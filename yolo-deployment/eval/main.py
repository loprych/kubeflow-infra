from ultralytics import YOLO
import glob
import os

def evaluate_model():
    print("Current working directory:", os.getcwd())

    os.makedirs('runs/detect/predict', exist_ok=True)

    model = YOLO('/app/model/trained_model.pt')

    image_files = glob.glob('/app/image/*.jpg')
    print("\nFound images for evaluation:")
    for img in image_files:
        print(img)

    for image_path in image_files:
        print(f"\nProcessing image: {image_path}")

        results = model(image_path)

        for r in results:
            filename = os.path.basename(image_path)
            save_path = os.path.join('runs/detect/predict', filename)
            
            r.plot()  
            r.save_txt('runs/detect/predict/labels')  

            print("\nDetections:")
            for box in r.boxes:
                class_id = int(box.cls[0])
                class_name = model.names[class_id]
                confidence = float(box.conf[0])
                print(f"- {class_name}: {confidence:.2f}")

if __name__ == "__main__":
    evaluate_model()