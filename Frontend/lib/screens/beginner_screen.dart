import 'package:flutter/material.dart';
import 'alphabet_screen.dart';
import 'angka_screen.dart';

class BeginnerScreen extends StatelessWidget {
  const BeginnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background dasar biru terang 
      backgroundColor: const Color(0xff0A84FF), 
      
      body: SafeArea(
        child: Column(
          children: [
            
            /// HEADER
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 34,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Beginner",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 34), 
                ],
              ),
            ),

            /// BODY (Background Navy Melengkung)
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xff162B45), 
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(35),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      // Kartu 1: Abjad
                      _buildFixedCard("assets/images/abjat.png", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AlphabetScreen(),
                          ),
                        );
                      }),
                      
                      // Kartu 2: Angka
                      _buildFixedCard("assets/images/angka.png", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AngkaScreen(),
                          ),
                        );
                      }),

                    ],
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }

  // WIDGET KARTU DENGAN UKURAN TETAP 
  Widget _buildFixedCard(String imagePath, VoidCallback onTap) {
    return Container(
      width: 160,  
      height: 190,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          
          Expanded(
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain, 
            ),
          ),
          
          const SizedBox(height: 15),
          
          // Tombol Pelajari
          InkWell(
            onTap: onTap,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xff006FD6), 
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Pelajari",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}