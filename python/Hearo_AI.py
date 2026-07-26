import os
import cv2
import string
import shutil

DATA_DIR = './data'
if not os.path.exists(DATA_DIR):
    os.makedirs(DATA_DIR)

alphabet_list = list(string.ascii_uppercase)
dataset_size = 1000 

cap = cv2.VideoCapture(0)

i = 0
while i < len(alphabet_list):
    label = alphabet_list[i]
    class_path = os.path.join(DATA_DIR, label)
    
    # Cek kalau folder sudah ada isinya, tanyain mau rekam ulang gak?
    if os.path.exists(class_path) and len(os.listdir(class_path)) >= dataset_size:
        print(f'\n[!] Data huruf {label} sudah lengkap.')
        pilihan = input(f'Mau rekam ulang huruf "{label}"? (y/n): ').lower()
        if pilihan != 'y':
            i += 1
            continue
        else:
            # Hapus data lama buat rekam ulang
            shutil.rmtree(class_path)

    if not os.path.exists(class_path):
        os.makedirs(class_path)

    print(f'\n--- SIAP REKAM HURUF: {label} ---')

    # Aba-aba sebelum mulai
    while True:
        ret, frame = cap.read()
        frame = cv2.flip(frame, 1)
        cv2.putText(frame, f'SIAP REKAM "{label}"? Pencet "Q" untuk MULAI', (50, 50), 
                    cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0, 255, 0), 2, cv2.LINE_AA)
        cv2.imshow('Collector Data PRO', frame)
        if cv2.waitKey(25) & 0xFF == ord('q'):
            break

    # Proses rekam
    counter = 0
    while counter < dataset_size:
        ret, frame = cap.read()
        frame = cv2.flip(frame, 1)
        
        img_name = os.path.join(class_path, f'{counter}.jpg')
        cv2.imwrite(img_name, frame)
        
        cv2.putText(frame, f'Merekam {label}: {counter}/{dataset_size}', (50, 50), 
                    cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 0, 0), 2, cv2.LINE_AA)
        cv2.imshow('Collector Data PRO', frame)
        
        cv2.waitKey(5) 
        counter += 1

    # Opsi Setelah Selesai 1 Huruf
    print(f'--- Huruf {label} Selesai! ---')
    print('1. Lanjut ke huruf berikutnya')
    print('2. Rekam ulang huruf ini')
    print('3. Berhenti & Keluar')
    opsi = input('Pilih opsi (1/2/3): ')

    if opsi == '1':
        i += 1
    elif opsi == '2':
        shutil.rmtree(class_path) # Hapus yang barusan direkam
        # i tidak bertambah, jadi bakal ngulang huruf yang sama
    else:
        break

cap.release()
cv2.destroyAllWindows()
print("\n--- PROSES KOLEKSI DATA DIHENTIKAN ---")