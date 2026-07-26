import pickle
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
import numpy as np

data_dict = pickle.load(open('./data.pickle', 'rb'))

# Filter data agar panjangnya seragam (42 titik)
data, labels = [], []
for i in range(len(data_dict['data'])):
    if len(data_dict['data'][i]) == 42:
        data.append(data_dict['data'][i])
        labels.append(data_dict['labels'][i])

x_train, x_test, y_train, y_test = train_test_split(
    np.asarray(data), np.asarray(labels), test_size=0.2, shuffle=True, stratify=labels
)

# Gunakan n_jobs=-1 agar training lebih cepat menggunakan semua core CPU
model = RandomForestClassifier(n_estimators=200, max_depth=30, n_jobs=-1)
model.fit(x_train, y_train)

print(f'Akurasi: {accuracy_score(model.predict(x_test), y_test) * 100:.2f}%')

with open('model.p', 'wb') as f:
    pickle.dump({'model': model}, f)
print("Model model.p sudah jadi!")