import 'package:flutter/material.dart';

class IntermediateScreen extends StatelessWidget {
  const IntermediateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A84FF),
      body: SafeArea(
        child: Column(
          children: [
            /// HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                    "Intermediate",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 34),
                ],
              ),
            ),

            /// BODY (Area Bertumpuk / Stack)
            Expanded(
              child: Stack(
                children: [
                  // 1. LAYER BACKGROUND PUTIH DI BAGIAN BAWAH
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.45, // Area putih dinaikkan sedikit untuk mengkover tombol & card
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(35),
                        ),
                      ),
                    ),
                  ),

                  // 2. LAYER KONTEN UTAMA
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end, // <--- KUNCI: Menarik semua elemen ke bawah layar!
                      children: [
                        
                        // AREA AVATAR DAN LINGKARAN PUTIH
                        SizedBox(
                          height: 310, // Ketinggian area gambar diperbesar drastis
                          child: Stack(
                            alignment: Alignment.bottomCenter, // Agar kaki nempel di dasar container ini
                            children: [
                              
                              // LINGKARAN PUTIH 
                              Positioned(
                                bottom: 60, // Mengatur tinggi lingkaran agar pas di belakang punggung
                                child: Container(
                                  width: 220, // Lingkaran diperbesar
                                  height: 220,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.8),
                                        blurRadius: 20,
                                        spreadRadius: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // GAMBAR ORANG JUMBO
                              Image.asset(
                                "assets/images/orang.png",
                                height: 340, // Gambar dibesarkan maksimal
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ),

                        // CARD NAVY (INFORMASI)
                        // Sengaja TIDAK ADA SizedBox di atasnya agar kaki karakter menempel dengan card ini
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 35),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: const Color(0xff162B45),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 20,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              const Text(
                                "Intermediate",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                "Uji pemahaman isyaratmu.",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 15),
                              
                              // Baris Detail Statistik
                              _buildDetailRow("Jumlah soal", "2"),
                              _buildDetailRow("Level", "1"),
                              _buildDetailRow("Waktu", "±3 menit"),
                              
                              const SizedBox(height: 15),

                              // Kotak Progress
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                  color: const Color(0xff455A7B),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Text(
                                  "PROGRESS 0%",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 25), // Jarak Card ke Tombol Start

                        // TOMBOL START LEARNING
                        _buildButton("START LEARNING", const Color(0xff006FD6), () {
                          print("Start Learning ditekan!");
                        }),

                        const SizedBox(height: 15),

                        // TOMBOL EXIT
                        _buildButton("EXIT", const Color(0xffE50000), () {
                          Navigator.pop(context);
                        }),

                        const SizedBox(height: 30), // Ruang paling bawah
                      ],
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

  // Helper Widget untuk Baris Detail pada Card Navy
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ),
          const Text(":", style: TextStyle(color: Colors.white, fontSize: 13)),
          const SizedBox(width: 15),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widget untuk Tombol di bagian bawah
  Widget _buildButton(String text, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        margin: const EdgeInsets.symmetric(horizontal: 35),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}