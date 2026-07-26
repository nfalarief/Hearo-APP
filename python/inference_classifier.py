import pickle
import cv2
import mediapipe as mp
import numpy as np
import string

model_dict = pickle.load(open('./model.p', 'rb'))
model = model_dict['model']

cap = cv2.VideoCapture(0)
mp_hands, mp_drawing = mp.solutions.hands, mp.solutions.drawing_utils
hands = mp_hands.Hands(static_image_mode=False, min_detection_confidence=0.6)

labels_dict = {l: l for l in list(string.ascii_uppercase)}

while True:
    data_aux, x_, y_ = [], [], []
    ret, frame = cap.read()
    if not ret: break

    H, W, _ = frame.shape
    frame = cv2.flip(frame, 1)
    results = hands.process(cv2.cvtColor(frame, cv2.COLOR_BGR2RGB))

    if results.multi_hand_landmarks:
        hand_landmarks = results.multi_hand_landmarks[0]
        mp_drawing.draw_landmarks(frame, hand_landmarks, mp_hands.HAND_CONNECTIONS)

        for i in range(len(hand_landmarks.landmark)):
            x, y = hand_landmarks.landmark[i].x, hand_landmarks.landmark[i].y
            data_aux.extend([x, y])
            x_.append(x); y_.append(y)

        x1, y1 = int(min(x_) * W) - 10, int(min(y_) * H) - 10
        x2, y2 = int(max(x_) * W) + 10, int(max(y_) * H) + 10

        prediction = model.predict([np.asarray(data_aux)])
        char = labels_dict[prediction[0]]

        cv2.rectangle(frame, (x1, y1), (x2, y2), (0, 255, 0), 4)
        cv2.putText(frame, char, (x1, y1 - 10), cv2.FONT_HERSHEY_SIMPLEX, 2, (0, 255, 0), 3)

    cv2.imshow('Hearo AI PRO', frame)
    if cv2.waitKey(1) & 0xFF == ord('q'): break

cap.release()
cv2.destroyAllWindows()