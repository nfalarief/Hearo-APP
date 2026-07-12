import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // Controller untuk mengambil data dari input
  final TextEditingController _nameController = TextEditingController(text: "Muhammad Adji Saputra");
  final TextEditingController _emailController = TextEditingController(text: "adji@example.com");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profil")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Foto Profil Placeholder
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
                  Positioned(
                    bottom: 0, right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: IconButton(icon: const Icon(Icons.camera_alt, color: Colors.white, size: 18), onPressed: () {}),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            
            // Input Nama
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Nama Lengkap", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            
            // Input Email
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 30),
            
            // Tombol Simpan
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                onPressed: () {
                  // Aksi simpan data akan diproses di sini
                  Navigator.pop(context); // Kembali ke profil setelah simpan
                },
                child: const Text("SIMPAN PERUBAHAN", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}