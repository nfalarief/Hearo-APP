import 'package:flutter/material.dart';
import 'gesture_to_text_screen.dart';

class SignScreen extends StatelessWidget {
  const SignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A84FF),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [

            // HEADER 
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Row(
                children: [

                  InkWell(
                    onTap: (){
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

                      SizedBox(height:5),

                      Text(
                        "Suara menjadi animasi",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),

                    ],
                  ),

                  const Spacer(),

                  const SizedBox(width:34),

                ],
              ),
            ),

            // BODY 
            Expanded(
              child: Stack(
                children: [

                  // Background Biru Tua
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

                      //CARD PUTIH
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 22,
                            right: 22,
                            top: 30,
                          ),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color(0xffF4F6FA),
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(35),
                            ),
                          ),

                          child: Column(
                            children: [

                              const SizedBox(height:25),

                              /// Avatar GIF
                              Container(
                                width: 270,
                                height: 270,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(.15),
                                      blurRadius: 10,
                                      offset: const Offset(0,5),
                                    ),
                                  ],
                                ),

                                child: ClipOval(
                                  child: Transform.translate(
                                    offset: const Offset(0,-10),
                                    child: Image.asset(
                                      "assets/images/avatar.gif",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height:40),
                              
                              //BOX SUARA
                              Container(
                                width: 320,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10,
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: const Color(0xff0666C9),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(.2),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: const Text(
                                  'Suara Anda : "Apa kabar hari ini ?"',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 15),

                              const Text(
                                "Menerjemahkan ke isyarat........",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const Spacer(),

                              //TOMBOL MIC
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: const Color(0xff0A84FF),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(.2),
                                      blurRadius: 6,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.mic,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),

                              const SizedBox(height: 70),

                            ],
                          ),
                        ),
                      ),

                      //FOOTER
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const GestureToTextScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: 95,
                          width: double.infinity,
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
                                Icons.camera_alt,
                                size: 48,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
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