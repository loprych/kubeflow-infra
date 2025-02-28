import requests
import base64

def test_model():
    # Adres endpointu
    url = "http://localhost:8080/predictions/yolo_model"
    
    # Przygotuj obraz
    with open("../image/bus.jpg", "rb") as f:
        img_bytes = f.read()
        img_base64 = base64.b64encode(img_bytes).decode('utf-8')
    
    # Wyślij zapytanie
    response = requests.post(url, data=img_base64)
    
    # Wyświetl wyniki
    if response.status_code == 200:
        results = response.json()
        for detection in results[0]['detections']:
            print(f"Detected {detection['class']} with confidence {detection['confidence']}")
    else:
        print(f"Error: {response.text}")

if __name__ == "__main__":
    test_model()