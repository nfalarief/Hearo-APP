import os
import cv2

# --- KONFIGURASI ---
DATA_DIR = './data'
if not os.path.exists(DATA_DIR):
    os.makedirs(DATA_DIR)

# Tentukan berapa banyak kelas/huruf (misal 3 dulu: A, B, L)
number_of_classes = 3
dataset_size = 100 # Jumlah foto per huruf

cap = cv2.VideoCapture(0)

for j in range(number_of_classes):
    if not os.path.exists(os.path.join(DATA_DIR, str(j))):
        os.makedirs(os.path.join(DATA_DIR, str(j)))

    print('Mengumpulkan data untuk kelas {}'.format(j))

    # Tahap persiapan (Aba-aba)
    done = False
    while True:
        ret, frame = cap.read()
        frame = cv2.flip(frame, 1)
        cv2.putText(frame, 'Siap? Pencet "Q" buat mulai rekam!', (50, 50), 
                    cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2, cv2.LINE_AA)
        cv2.imshow('Collector Data', frame)
        if cv2.waitKey(25) & 0xFF == ord('q'):
            break

    # Tahap rekam otomatis 100 foto
    counter = 0
    while counter < dataset_size:
        ret, frame = cap.read()
        frame = cv2.flip(frame, 1)
        cv2.imshow('Collector Data', frame)
        cv2.waitKey(25)
        
        # Simpan gambar ke folder masing-masing
        cv2.imwrite(os.path.join(DATA_DIR, str(j), '{}.jpg'.format(counter)), frame)
        counter += 1
        print(f"Berhasil ambil foto ke-{counter} untuk kelas {j}")

cap.release()
cv2.destroyAllWindows()