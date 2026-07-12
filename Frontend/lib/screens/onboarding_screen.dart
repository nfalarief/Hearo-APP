import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Penting untuk SystemUiOverlayStyle
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Terhubung Tanpa Batas",
      "text": "Komunikasi lebih mudah dengan\npenerjemah teks dan isyarat.",
      "image": "assets/images/splash_screen_2.png", 
    },
    {
      "title": "Ucapkan, Kami Dengarkan",
      "text": "Ubah suara jadi teks real-time untuk\nkomunikasi lebih cepat.",
      "image": "assets/images/splash_screen_3.png", 
    },
    {
      "title": "Belajar & Tumbuh Bersama",
      "text": "Pelajari bahasa isyarat dengan bantuan AI\nyang siap menemanimu.",
      "image": "assets/images/splash_screen_4.png", 
    },
  ];

  @override
  Widget build(BuildContext context) {
    // 1. AnnotatedRegion memaksa Status Bar transparan dan ikon JADI HITAM (karena BG Putih)
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark, // Ikon jadi HITAM agar terlihat di BG putih
        statusBarBrightness: Brightness.light, 
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        // 2. Tidak pakai SafeArea di root, kita handle padding-nya secara manual di bawah
        body: Column(
          children: [
            // Handle area status bar agar tidak tertutup jam
            SizedBox(height: MediaQuery.of(context).padding.top), 
            
            // BAGIAN ATAS: Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${_currentPage + 1}/${onboardingData.length}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                    },
                    child: const Text('Skip', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),

            // BAGIAN TENGAH: Konten Utama
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() => _currentPage = value);
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      children: [
                        const Spacer(flex: 1),
                        Text(
                          onboardingData[index]["title"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        const Spacer(flex: 1),
                        Image.asset(
                          onboardingData[index]["image"]!,
                          width: MediaQuery.of(context).size.width * 0.85,
                          fit: BoxFit.fitWidth,
                        ),
                        const Spacer(flex: 1),
                        Text(
                          onboardingData[index]["text"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16, height: 1.5, color: Colors.black, fontWeight: FontWeight.w700),
                        ),
                        const Spacer(flex: 2),
                      ],
                    ),
                  );
                },
              ),
            ),

            // BAGIAN BAWAH
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _currentPage > 0
                      ? TextButton(
                          onPressed: () {
                            _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
                          },
                          child: const Text('Prev', style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold)),
                        )
                      : const SizedBox(width: 50),
                  Row(
                    children: List.generate(onboardingData.length, (index) => buildDot(index: index)),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_currentPage == onboardingData.length - 1) {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                      } else {
                        _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
                      }
                    },
                    child: Text(
                      _currentPage == onboardingData.length - 1 ? 'Mulai' : 'Next',
                      style: const TextStyle(color: Colors.redAccent, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 8),
      height: 8,
      width: _currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? const Color(0xFF1E2640) : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}