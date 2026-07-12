import 'package:flutter/material.dart';
import 'beginner_screen.dart'; 
import 'intermediate_screen.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

                  const Text(
                    "Hearo Learn",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Spacer(),

                  const SizedBox(width:34),

                ],
              ),
            ),

            Expanded(
              child: Container(
                width: double.infinity,

                decoration: const BoxDecoration(
                  color: Color(0xff162B45),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(35),
                  ),
                ),

                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 25),

                  children: [ 

                    LearnCard(
                      title: "Beginner",
                      image: "assets/images/beginner.png",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BeginnerScreen(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height:30),

                    LearnCard(
                      title: "Intermediate",
                      image: "assets/images/intermediate.png",
                      onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const IntermediateScreen(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height:30),

                    LearnCard(
                      title: "Advanced",
                      image: "assets/images/advanced.png",
                      onPressed: () {
                        print("Tombol Advanced diklik");
                      },
                    ),

                    const SizedBox(height:40),

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class LearnCard extends StatelessWidget {

  final String title;
  final String image;
  final VoidCallback onPressed; 

  const LearnCard({
    super.key,
    required this.title,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(
        width: 220,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 25,
        ),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.18),
              blurRadius: 12,
              offset: const Offset(0,5),
            ),
          ],
        ),

        child: Column(
          children: [

            Image.asset(
              image,
              width: 120,
            ),

            const SizedBox(height:18),

            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height:22),

            SizedBox(
              width: 120,
              height: 42,

              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff006FD6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                onPressed: onPressed,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Text(
                      "Mulai",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}