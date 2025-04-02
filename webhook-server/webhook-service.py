import os
import sys
import json
import logging
from flask import Flask, request, jsonify

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    stream=sys.stdout
)
logger = logging.getLogger(__name__)

logger.info(f"Python version: {sys.version}")
logger.info(f"Starting webhook service...")

try:
    import kfp
    logger.info(f"KFP version: {kfp.__version__}")
except Exception as e:
    logger.error(f"Error importing KFP: {str(e)}")
    raise

app = Flask(__name__)

# Default namespace
DEFAULT_NAMESPACE = os.getenv("KF_NAMESPACE", "kubeflow-user-example-com")
DEFAULT_EXPERIMENT_ID = "948f3551-b48f-429a-abd3-7e3ce73d9370"  
logger.info(f"Using default namespace: {DEFAULT_NAMESPACE}")
logger.info(f"Default experiment ID: {DEFAULT_EXPERIMENT_ID}")

PIPELINE_IDS = {
    "yolov8-pipeline": "6d6d8804-4180-472d-a771-d6c20d413a58"  
}

PIPELINE_VERSION_IDS = {
    "yolov8-pipeline": "37885bf1-dd97-42ee-8c27-f2c030eb553a"  
}

@app.route('/health', methods=['GET'])
def health_check():
    """Health check endpoint"""
    logger.info("Health check endpoint called")
    return jsonify({"status": "ok"})

@app.route('/trigger/<pipeline_name>', methods=['POST'])
def trigger_pipeline(pipeline_name):
    logger.info(f"Trigger endpoint called for pipeline: {pipeline_name}")

    try:
        params = request.json.copy() if request.is_json else {}

        namespace = params.pop('namespace', DEFAULT_NAMESPACE)
        experiment_id = params.pop('experiment_id', DEFAULT_EXPERIMENT_ID)
        run_name = params.pop('run_name', f"{pipeline_name}-run")

        pipeline_id = params.pop('pipeline_id', PIPELINE_IDS.get(pipeline_name))
        version_id = params.pop('version_id', PIPELINE_VERSION_IDS.get(pipeline_name))

        if not pipeline_id:
            error_msg = f"Pipeline '{pipeline_name}' missing pipeline_id."
            logger.error(error_msg)
            return jsonify({"error": error_msg}), 404

        
        client = kfp.Client(
            host=os.getenv("KFP_HOST", "http://ml-pipeline-ui.kubeflow.svc.cluster.local"),
            namespace=namespace
        )

       
        run = client.create_run_from_pipeline_id(
            pipeline_id=pipeline_id,
            pipeline_version_id=version_id, 
            arguments=params,
            run_name=run_name,
            experiment_id=experiment_id
        )

        logger.info(f"Pipeline run created: {run.run_id}")

        return jsonify({
            "status": "success",
            "run_id": run.run_id,
            "run_url": f"/pipeline/runs/details/{run.run_id}"
        })

    except Exception as e:
        logger.exception(f"Error triggering pipeline: {str(e)}")
        return jsonify({"error": str(e)}), 500


@app.route('/raw_trigger', methods=['POST'])
def raw_trigger():
    """
    A more direct endpoint that uses the raw API parameters
    """
    try:
        if not request.is_json:
            return jsonify({"error": "Request must be JSON"}), 400
            
        data = request.json
        logger.info(f"Raw trigger data: {data}")
        
        client = kfp.Client()
        
        run = client.run_pipeline(**data)
        
        return jsonify({
            "status": "success",
            "run_id": run.id,
            "run_url": f"/pipeline/runs/details/{run.id}"
        })
    except Exception as e:
        logger.exception(f"Error in raw trigger: {str(e)}")
        return jsonify({"error": str(e)}), 500

@app.route('/info', methods=['GET'])
def get_info():
    """
    Return information about configured pipeline IDs and mappings
    """
    return jsonify({
        "status": "ok",
        "pipeline_mappings": PIPELINE_IDS,
        "version_mappings": PIPELINE_VERSION_IDS,
        "default_experiment_id": DEFAULT_EXPERIMENT_ID,
        "default_namespace": DEFAULT_NAMESPACE
    })

@app.route('/api_debug', methods=['GET'])
def api_debug():
    """
    Debug endpoint to check KFP API capabilities
    """
    try:
        client = kfp.Client()
        api_client = client._client
        
        debug_info = {
            "kfp_version": kfp.__version__,
            "client_type": type(client).__name__,
            "api_client_type": type(api_client).__name__,
            "api_methods": [m for m in dir(api_client) if not m.startswith('_') and callable(getattr(api_client, m))],
            "client_methods": [m for m in dir(client) if not m.startswith('_') and callable(getattr(client, m))]
        }
        
        try:
            pipelines = client.list_pipelines()
            debug_info["pipeline_list_type"] = type(pipelines).__name__
            
            if hasattr(pipelines, 'pipelines') and pipelines.pipelines:
                first_pipeline = pipelines.pipelines[0]
                debug_info["first_pipeline_type"] = type(first_pipeline).__name__
                debug_info["first_pipeline_attributes"] = dir(first_pipeline)
        except Exception as e:
            debug_info["pipeline_list_error"] = str(e)
            
        return jsonify(debug_info)
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == "__main__":
    logger.info("Starting Flask application...")
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port, debug=True)
