import 'package:flutter/material.dart';
import 'edit_profile_screen.dart'; // Pastikan file ini ada

class ProfileScreen extends StatefulWidget { // Ubah jadi StatefulWidget
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> { // Tambahkan State class
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profil Saya")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
            const SizedBox(height: 20),
            const Text("Nama Pengguna", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Text("user@email.com", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 30),
            
            // Edit Profil yang sudah bersih (hanya satu)
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text("Edit Profil"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditProfileScreen()),
                ).then((value) {
                  setState(() {}); // Sekarang setState tidak akan merah lagi!
                });
              },
            ),
            
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Pengaturan"),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Keluar", style: TextStyle(color: Colors.red)),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}