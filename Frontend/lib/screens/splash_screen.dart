import 'package:flutter/material.dart';
import 'onboarding_screen.dart'; // Pastikan import ini benar

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Variabel untuk mengontrol jalannya animasi
  bool _isExpanded = false;
  bool _showLogo = false;

  @override
  void initState() {
    super.initState();

    // 1. Setelah 0.5 detik, mulai besarkan lingkaran biru
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _isExpanded = true;
        });
      }
    });

    // 2. Setelah 1.2 detik (saat layar sudah biru), munculkan Logo Hearo
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (mounted) {
        setState(() {
          _showLogo = true;
        });
      }
    });

    // 3. Setelah 4 detik (animasi selesai ditonton), pindah ke Onboarding
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Mengambil ukuran tinggi layar HP untuk membuat lingkaran yang sangat besar
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white, // Warna dasar sebelum lingkaran membesar
      body: Stack(
        alignment: Alignment.center,
        children: [
          // ANIMASI 1: Lingkaran Biru yang Membesar
          AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            // Jika _isExpanded true, ukuran jadi 1.5x tinggi layar. Jika false, ukurannya 0.
            width: _isExpanded ? screenHeight * 1.5 : 0,
            height: _isExpanded ? screenHeight * 1.5 : 0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              // Anda bisa mengganti kode hex ini dengan warna biru yang pas dari Figma
              color: Color(0xFF1C75FF), 
            ),
          ),

          // ANIMASI 2: Logo Hearo yang Muncul Perlahan (Fade In)
          AnimatedOpacity(
            duration: const Duration(milliseconds: 800),
            opacity: _showLogo ? 1.0 : 0.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TODO: Nanti ganti dengan gambar asli logo Anda (Image.asset)
                // Contoh: Image.asset('assets/logo_hearo.png', height: 100),
                
                // Sementara menggunakan Icon + Teks tiruan agar kodenya jalan dulu
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.hearing, size: 50, color: Colors.yellow),
                    const SizedBox(width: 10),
                    const Text(
                      "Hearo",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}