import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'sign_screen.dart';
import 'voice_screen.dart';
import 'learn_screen.dart';
import 'noplay_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;

  final List<Map<String, String>> menus = [
    {
      "title": "Hearo Sign",
      "image": "assets/images/sign.png",
      "desc": "Terjemahan bahasa isyarat dan\nteks secara langsung."
    },
    {
      "title": "Hearo Voice",
      "image": "assets/images/voice.png",
      "desc": "Konversi suara dan teks untuk\nkomunikasi dua arah."
    },
    {
      "title": "Hearo Learn",
      "image": "assets/images/learn.png",
      "desc": "Fitur edukasi interktif untuk belaja\nkomunikasi dan bahasa isyarat dengan\ncara yang mudah dan menarik"
    },
    {
      "title": "NOPlay",
      "image": "assets/images/play.png",
      "desc": "New Objective Play Game interaktif\nuntuk melatih komunikasi dan\nmemahami bahasa isyarat dengan\ncara yang seru dan menyenangkan"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A84FF),

      body: SafeArea(
        child: Column(
          children: [

            const SizedBox(height:18),

            /// HEADER
            SizedBox(
              height: 240,
              child: Stack(
                children: [

                  Positioned(
                    top: 15,
                    left: 22,
                    child: Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.15),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Image.asset(
                        "assets/images/logo.png",
                        width: 300,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 10, // lebih aman dari overlap
                    left: 0,
                    right: 0,
                    child: const Center(
                      child: Text(
                        "Jembatan komunikasi tanpa batas.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: CarouselSlider.builder(
                itemCount: menus.length,
                itemBuilder: (context, index, realIndex) {
                  final item = menus[index];
                  return _buildCard(
                    context,
                    item,
                    currentIndex == index,
                  );
                },
                options: CarouselOptions(
                  height: 500,
                  viewportFraction: 0.85,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
            ),

            /// NAV BAR BAWAH
            Container(
              height: 95,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(35),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _nav(Icons.keyboard_alt,"Keyboard"),
                  _nav(Icons.smart_toy,"Chat AI"),
                  _nav(Icons.bookmark_add,"Add Gesture"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
    BuildContext context,
    Map<String, String> item,
    bool active,
    ) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.only(top: 20, bottom: 35),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [

          Positioned(
            top: 50,
            child: Container(
              width: 300,
              height: 330,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.15),
                    blurRadius: 18,
                    offset: const Offset(0, 10),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 115, 22, 30),
                child: Column(
                  children: [
                    Text(
                      item["title"]!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      item["desc"]!,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: active ? -15 : 25,
            child: AnimatedScale(
              duration: const Duration(milliseconds: 300),
              scale: active ? 1.08 : 0.92,
              child: Image.asset(
                item["image"]!,
                width: 180,
              ),
            ),
          ),

          Positioned(
              bottom: -6,
               child: GestureDetector(
                onTap: () {
                  if (item["title"] == "Hearo Sign") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SignScreen()),
                    );
                  } else if (item["title"] == "Hearo Voice") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const VoiceScreen()),
                    );
                  } else if (item["title"] == "Hearo Learn") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LearnScreen()),
                    );
                  } else if (item["title"] == "NOPlay") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const NoPlayScreen()),
                    );
                  }
                },
              child: Stack(
                alignment: Alignment.center,
                children: [

                  // Lingkaran putih luar
                  Container(
                    width: 94,
                    height: 94,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),

                  // Ring biru tua
                  Container(
                    width: 82,
                    height: 82,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xff14233C),
                        width: 4.5, // sebelumnya 2.8 atau 3
                      ),
                    ),
                  ),

                  // Tombol tengah
                  Container(
                    width: 66,
                    height: 66,
                    decoration: BoxDecoration(
                      color: const Color(0xff14233C),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _nav(IconData icon, String title) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: 90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: const Color(0xff1E2D4D),
              size: 40,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}