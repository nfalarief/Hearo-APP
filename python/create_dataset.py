import os
import pickle
import mediapipe as mp
import cv2

mp_hands = mp.solutions.hands
hands = mp_hands.Hands(static_image_mode=True, min_detection_confidence=0.3)

DATA_DIR = './data'
data, labels = [], []

print("Memulai ekstraksi... Jangan dimatikan sampai ada tulisan Beres!")

for dir_ in os.listdir(DATA_DIR):
    class_path = os.path.join(DATA_DIR, dir_)
    if not os.path.isdir(class_path): continue
        
    for img_path in os.listdir(class_path):
        data_aux = []
        img = cv2.imread(os.path.join(class_path, img_path))
        results = hands.process(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))

        if results.multi_hand_landmarks:
            hand_landmarks = results.multi_hand_landmarks[0]
            for i in range(len(hand_landmarks.landmark)):
                data_aux.append(hand_landmarks.landmark[i].x)
                data_aux.append(hand_landmarks.landmark[i].y)
            data.append(data_aux)
            labels.append(dir_)

with open('data.pickle', 'wb') as f:
    pickle.dump({'data': data, 'labels': labels}, f)
print(f"Beres! {len(data)} koordinat tersimpan.")