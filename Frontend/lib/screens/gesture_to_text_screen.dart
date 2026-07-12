import 'package:flutter/material.dart';

class GestureToTextScreen extends StatelessWidget {
  const GestureToTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A84FF),
      body: SafeArea(
        bottom: false,
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
                  Column(
                    children: const [
                      Text(
                        "Hearo Sign",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Gerakan menjadi teks",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const SizedBox(width: 34),
                ],
              ),
            ),

            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 100,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xff0B1A30), 
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(40),
                        ),
                      ),
                    ),
                  ),

                  Column(
                    children: [
                      // Card PUTIH 
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 22, right: 22, top: 30),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color(0xffF4F6FA),
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(35),
                            ),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 25),

                              // AVATAR GIF
                              Container(
                                width: 280,
                                height: 280,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 10,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    "assets/images/animasi_nenek.gif", 
                                    width: 280,
                                    height: 280,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 40),

                              const Text(
                                "Menerjemahkan ke kalimat........",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 15),

                              // BOX HASIL ISYARAT
                              Container(
                                width: 300,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: const Color(0xff0666C9),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: const Text(
                                  'Isyarat Anda : "Apa kabar hari ini ?"',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              const Spacer(),

                              // BUTTON SPEAKER & CAMERA
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 65,
                                    height: 65,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff0A84FF),
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 6,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: const Icon(Icons.volume_up, color: Colors.white, size: 32),
                                  ),
                                  const SizedBox(width: 25),
                                  Container(
                                    width: 65,
                                    height: 65,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff0A84FF),
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 6,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: const Icon(Icons.camera_alt, color: Colors.white, size: 32),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 70), 
                            ],
                          ),
                        ),
                      ),

                      Container(
                        height: 95,
                        width: double.infinity, // membuat melebar penuh ujung ke ujung
                        decoration: const BoxDecoration(
                          color: Color(0xff006FD6),
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(35),
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 85,
                            height: 85,
                            decoration: const BoxDecoration(
                              color: Color(0xff064B93),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.mic,
                              size: 48,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}