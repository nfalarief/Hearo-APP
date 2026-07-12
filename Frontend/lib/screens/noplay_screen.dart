import 'package:flutter/material.dart';

class NoPlayScreen extends StatelessWidget {
  const NoPlayScreen({super.key});

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
                    "NOPlay",
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
                  padding: const EdgeInsets.symmetric(vertical: 30),

                  children: const [

                    GameCard(
                      title: "Mirror Practice",
                      image: "assets/images/miror.png",
                    ),

                    SizedBox(height:30),

                    GameCard(
                      title: "Memory Practice",
                      image: "assets/images/memory.png",
                    ),

                    SizedBox(height:40),

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
class GameCard extends StatelessWidget {

  final String title;
  final String image;

  const GameCard({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(
        width: 250,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 25,
        ),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 12,
              offset: const Offset(0,5),
            )
          ],
        ),

        child: Column(
          children: [

            Image.asset(
              image,
              width: 150,
            ),

            const SizedBox(height:20),

            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height:25),

            SizedBox(
              width: 140,
              height: 45,

              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff0A84FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),

                onPressed: () {},

                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(
                      "Mulai",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(width:5),

                    Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
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