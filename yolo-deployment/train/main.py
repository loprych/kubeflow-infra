from ultralytics import YOLO
import os
import glob

def train_model():
    print("Current working directory:", os.getcwd())
    print("\nFiles in dataset directory:")
    for file in glob.glob('/app/dataset/coco8/**/*', recursive=True):
        print(file)

    model = YOLO('/app/model/yolov8n.pt')

    results = model.train(
        data='/app/dataset/coco8/data.yaml',
        epochs=1,
        imgsz=640,
        batch=1,
        patience=5,
        device='cpu',
        verbose=True,
        cache=False,  
        single_cls=False,  
    )
    
    model.save('/app/model/trained_model.pt')

if __name__ == "__main__":
    train_model()