import 'package:flutter/material.dart';

class AngkaScreen extends StatefulWidget {
  const AngkaScreen({super.key});

  @override
  State<AngkaScreen> createState() => _AngkaScreenState();
}

class _AngkaScreenState extends State<AngkaScreen> {
  final PageController _pageController = PageController();

  int currentIndex = 0;

  final List<Map<String, String>> angka = [
    {
      "title": "Angka 1",
      "image": "assets/images/1.png",
      "Cara Membentuk Isyarat :":
          "Kepalkan tangan lalu angkat jari telunjuk ke atas.",
      "Posisi Tangan :":
          "Telapak tangan menghadap ke depan.",
      "tips :":
          "Pastikan jari telunjuk lurus dan jari lainnya tetap tertutup rapat.",
      "penggunaan :":
          "Digunakan untuk menunjukkan angka satu dalam Bahasa Isyarat Indonesia."
    },
    {
      "title": "Angka 2",
      "image": "assets/images/2.png",
      "Cara Membentuk Isyarat :":
          "Angkat jari telunjuk dan jari tengah membentuk huruf “V",
      "Posisi Tangan :":
          "Telapak tangan menghadap ke depan.",
      "tips :":
          "Jaga jarak kedua jari agar terlihat jelas dan tidak terlalu rapat.",
      "penggunaan :":
          "Digunakan untuk menunjukkan angka dua dalam Bahasa Isyarat Indonesia."
    },
    {
      "title": "Angka 3",
      "image": "assets/images/3.png",
      "Cara Membentuk Isyarat :":
          "Angkat jari telunjuk, jari tengah, dan ibu jari.",
      "Posisi Tangan :":
          "Telapak tangan menghadap ke depan.",
      "tips :":
          "Pastikan jari manis dan kelingking tetap terlipat agar tidak tertukar dengan angka lain",
      "penggunaan :":
          "Digunakan untuk menunjukkan angka tiga dalam Bahasa Isyarat Indonesia."
    },
    {
      "title": "Angka 4",
      "image": "assets/images/4.png",
      "Cara Membentuk Isyarat :":
          "Angkat empat jari kecuali ibu jari.",
      "Posisi Tangan :":
          "Telapak tangan menghadap ke depan.",
      "tips :":
          "Rapatkan jari-jari agar bentuk angka terlihat jelas.",
      "penggunaan :":
          "Digunakan untuk menunjukkan angka empat dalam Bahasa Isyarat Indonesia."
    },
    {
      "title": "Angka 5",
      "image": "assets/images/5.png",
      "Cara Membentuk Isyarat :":
          "Buka seluruh jari tangan.",
      "Posisi Tangan :":
          "Telapak menghadap ke depan.",
      "tips :":
          "Pastikan semua jari terbuka sempurna dan tidak menekuk.",
      "penggunaan :":
          "Digunakan untuk menunjukkan angka lima dalam Bahasa Isyarat Indonesia."
    },
    {
      "title": "Angka 6",
      "image": "assets/images/6.png",
      "Cara Membentuk Isyarat :":
          "Sentuhkan ibu jari dengan jari kelingking, sementara tiga jari lainnya terbuka.",
      "Posisi Tangan :":
          "Telapak tangan menghadap ke depan atau sedikit miring.",
      "tips :":
          "Pastikan lingkaran antara ibu jari dan kelingking terlihat jelas.",
      "penggunaan :":
          "Digunakan untuk menunjukkan angka enam dalam Bahasa Isyarat Indonesia."
     },
    {
      "title": "Angka 7",
      "image": "assets/images/7.png",
      "Cara Membentuk Isyarat :":
          "Sentuhkan ibu jari dengan jari manis, sementara jari lainnya terbuka.",
      "Posisi Tangan :":
          "Telapak tangan menghadap ke depan.",
      "tips :":
          "Jangan tertukar dengan angka enam atau delapan, perhatikan jari yang menyentuh ibu jari.",
      "penggunaan :":
          "Digunakan untuk menunjukkan angka tujuh dalam Bahasa Isyarat Indonesia."
    },
    {
      "title": "Angka 8",
      "image": "assets/images/8.png",
      "Cara Membentuk Isyarat :":
          "Sentuhkan ibu jari dengan jari tengah, sementara jari lainnya terbuka.",
      "Posisi Tangan :":
          "Telapak tangan menghadap ke depan.",
      "tips :":
          "Pastikan bentuk lingkaran terlihat jelas agar mudah dibedakan.",
      "penggunaan :":
          "Digunakan untuk menunjukkan angka delapan dalam Bahasa Isyarat Indonesia."
    },
    {
      "title": "Angka 9",
      "image": "assets/images/9.png",
      "Cara Membentuk Isyarat :":
          "Sentuhkan ibu jari dengan jari telunjuk membentuk lingkaran, sementara tiga jari lainnya terbuka.",
      "Posisi Tangan :":
          "Telapak tangan menghadap ke depan.",
      "tips :":
          "Jaga posisi lingkaran tetap jelas dan tidak terlalu kecil.",
      "penggunaan :":
          "Digunakan untuk menunjukkan angka sembilan dalam Bahasa Isyarat Indonesia."
    },
    {
      "title": "Angka 10",
      "image": "assets/images/10.png",
      "Cara Membentuk Isyarat :":
          "Kepalkan tangan lalu angkat ibu jari ke atas.",
      "Posisi Tangan :":
          "Tangan dapat digerakkan sedikit ke samping atau digoyangkan.",
      "tips :":
          "Gerakan kecil pada ibu jari membantu membedakan angka sepuluh dengan simbol lain.",
      "penggunaan :":
          "Digunakan untuk menunjukkan angka sepuluh dalam Bahasa Isyarat Indonesia."   
    },
  ];

  @override
  Widget build(BuildContext context) {
    final item = angka[currentIndex];

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
                    "Angka Isyarat",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
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
                constraints: const BoxConstraints.expand(),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),

                      child: LayoutBuilder(
                      builder: (context, constraints) {
                        return SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: constraints.maxHeight,
                            ),
                            child: Column(
                              children: [

                          const SizedBox(height: 25),

                          const Text(
                            "Angka Isyarat SIBI",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 5),

                          const Text(
                            "Pelajari angka 1-10 langkah demi langkah",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),

                          const SizedBox(height: 25),

                          Container(
                            width: 330,
                            height: 330,
                            decoration: BoxDecoration(
                              color: const Color(0xff0A84FF),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.20),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),

                            child: Column(
                              children: [

                                const SizedBox(height: 18),

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 14),
                                  child: Column(
                                    children: [

                                      Row(
                                        children: [

                                          Text(
                                            angka[currentIndex]["title"]!
                                                .replaceAll("Angka ", ""),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13,
                                            ),
                                          ),

                                          const Spacer(),

                                          Text(
                                            "${currentIndex + 1}/10",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 6),
                                      //progres bar atas 
                                      SizedBox(
                                        height: 3,
                                        child: Row(
                                          children: List.generate(
                                            10,
                                            (i) => Expanded(  
                                              child: Container(
                                                margin: const EdgeInsets.symmetric(horizontal: .5),
                                                decoration: BoxDecoration(
                                                  color: i <= currentIndex
                                                      ? Colors.white
                                                      : Colors.white.withOpacity(0.35),
                                                  borderRadius: BorderRadius.circular(2),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 10),

                                SizedBox(
                                  height: 270,
                                  child: PageView.builder(
                                    controller: _pageController,
                                    itemCount: angka.length,

                                    onPageChanged: (index) {
                                      setState(() {
                                        currentIndex = index;
                                      });
                                    },

                                    itemBuilder: (context, index) {
                                    return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0,
                                        vertical: 5,
                                      ),
                                      child: Image.asset(
                                        angka[index]["image"]!,
                                        fit: BoxFit.contain,
                                      ),
                                    );
                                   },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),

                          /// TOMBOL PENJELASAN
                          Container(
                            width: 170,
                            height: 42,

                            padding: const EdgeInsets.symmetric(
                              horizontal: 26,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xff006FD6),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.20),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: const Text(
                              "PENJELASAN",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                                fontSize: 14,
                              ),
                            ),
                          ),

                          const SizedBox(height: 18),
                          Container(
                            width: double.infinity,
                            constraints: const BoxConstraints(
                              minHeight: 250,
                            ),
                            margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),

                            border: Border.all(
                              color: Colors.grey.shade300,
                            ),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.08),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),

                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Center(
                                    child: Text(
                                      item["title"]!,
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 18),

                                  const Text(
                                    "Cara Membentuk Isyarat :",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16,
                                    ),
                                  ),

                                  const SizedBox(height: 6),

                                  Text(
                                    item["Cara Membentuk Isyarat :"]!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      height: 1.6,
                                    ),
                                  ),

                                  const SizedBox(height: 18),

                                  const Text(
                                    "Posisi Tangan :",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16,
                                    ),
                                  ),

                                  const SizedBox(height: 6),

                                  Text(
                                    item["Posisi Tangan :"]!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      height: 1.6,
                                    ),
                                  ),

                                  const SizedBox(height: 18),

                                  const Text(
                                    "Tips :",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16,
                                    ),
                                  ),

                                  const SizedBox(height: 6),

                                  Text(
                                    item["tips :"]!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      height: 1.6,
                                    ),
                                  ),

                                  const SizedBox(height: 18),

                                  const Text(
                                    "Penggunaan :",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16,
                                    ),
                                  ),

                                  const SizedBox(height: 6),

                                  Text(
                                    item["penggunaan :"]!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      height: 1.6,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ], // children Column
                      ),
                    ), // ConstrainedBox
                  ); // return SingleChildScrollView
                }, // builder
              ), // LayoutBuilder
            ), // Container
          ), // Expanded
        ], // children Column utama
      ), // Column
    ), // SafeArea
  ); // Scaffold
}

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}