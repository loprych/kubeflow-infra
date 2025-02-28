from ts.torch_handler.base_handler import BaseHandler
from ultralytics import YOLO
import torch
import base64
import io
from PIL import Image

class YOLOHandler(BaseHandler):
    def __init__(self):
        super().__init__()
        self.initialized = False

    def initialize(self, context):
        self.manifest = context.manifest
        properties = context.system_properties
        model_dir = properties.get("model_dir")
        self.device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

        self.model = YOLO(f"{model_dir}/trained_model.pt")
        self.initialized = True

    def preprocess(self, requests):
        images = []
        for request in requests:
            image = request.get("data") or request.get("body")
            if isinstance(image, str):
                image = base64.b64decode(image)
            if isinstance(image, (bytes, bytearray)):
                image = Image.open(io.BytesIO(image))
            images.append(image)
        return images

    def inference(self, images):
        results = self.model(images, verbose=False)
        return results

    def postprocess(self, results):
        processed_results = []
        for result in results:
            detections = []
            for box in result.boxes:
                class_id = int(box.cls[0])
                class_name = self.model.names[class_id]
                confidence = float(box.conf[0])
                xyxy = box.xyxy[0].tolist()
                
                detections.append({
                    "class": class_name,
                    "confidence": confidence,
                    "bbox": xyxy
                })
            processed_results.append({"detections": detections})
        return processed_results