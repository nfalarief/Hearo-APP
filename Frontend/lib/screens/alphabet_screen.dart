import 'package:flutter/material.dart';

class AlphabetScreen extends StatefulWidget {
  const AlphabetScreen({super.key});

  @override
  State<AlphabetScreen> createState() => _AlphabetScreenState();
}

class _AlphabetScreenState extends State<AlphabetScreen> {
  final PageController _pageController = PageController();

  int currentIndex = 0;

  final List<Map<String, String>> alphabet = [
    {
      "title": "Huruf A",
      "image": "assets/images/a.png",
      "Cara Membentuk Isyarat :":
          "Kepalkan tangan kanan dengan posisi ibu jari berada tegak lurus di samping jari telunjuk.",
      "Posisi Tangan :":
          "Posisi tangan menghadap ke depan.",
      "tips :":
          "Jangan masukkan ibu jari ke dalam kepalan agar tidak tertukar dengan huruf “S”.",
      "penggunaan :":
          " Huruf A digunakan saat mengeja nama atau kata dalam Bahasa Isyarat Indonesia."
    },
    {
      "title": "Huruf B",
      "image": "assets/images/b.png",
      "Cara Membentuk Isyarat :":
          "Buka telapak tangan dengan keempat jari rapat mengarah ke atas lalu tekuk ibu jari ke depan telapak tangan.",
      "Posisi Tangan :":
          "Telapak tangan menghadap ke depan.",
      "tips :":
          "Pastikan jari-jari sangat rapat agar terlihat seperti dinding datar..",
      "penggunaan :":
          "Huruf B digunakan saat mengeja nama atau kata dalam Bahasa Isyarat Indonesia."
    },
    {
      "title": "Huruf C",
      "image": "assets/images/c.png",
      "Cara Membentuk Isyarat :":
          "Lengkungkan keempat jari dan ibu jari hingga membentuk lengkungan setengah lingkaran.",
      "Posisi Tangan :":
          " Tangan menyamping sehingga bentuk C terlihat jelas dari sisi lawan bicara.",
      "tips :":
          " Bayangkan kamu sedang memegang gelas besar.",
      "penggunaan :":
          "Huruf C digunakan saat mengeja nama atau kata dalam Bahasa Isyarat Indonesia."
    },
    {
      "title": "Huruf D",
      "image": "assets/images/d.png",
      "Cara Membentuk Isyarat :":
          "Angkat jari telunjuk lurus ke atas sementara ujung ibu jari bertemu dengan ujung jari tengah manis dan kelingking..",
      "Posisi Tangan :":
          "Telapak tangan menghadap ke depan/samping sedikit.",
      "tips :":
          "Pastikan hanya telunjuk yang berdiri tegak.",
      "penggunaan :":
          " Huruf D digunakan saat mengeja nama atau kata dalam Bahasa Isyarat Indonesia."
    },
    {
      "title": "Huruf E",
      "image": "assets/images/e.png",
      "Cara Membentuk Isyarat :":
          "Tekuk semua jari ke arah dalam telapak tangan dengan ujung kuku menyentuh sisi ibu jari yang juga ditekuk ke dalam.",
      "Posisi Tangan :":
          "Telapak menghadap ke depan.",
      "tips :":
          "Bentuknya mirip cakar yang menguncup rapat.",
      "penggunaan :":
          "Huruf E digunakan saat mengeja nama atau kata dalam Bahasa Isyarat Indonesia."
    },
    {
      "title": "Huruf F",
      "image": "assets/images/f.png",
      "Cara Membentuk Isyarat :":
          "Pertemukan ujung jari telunjuk dan ibu jari hingga membentuk lingkaran (seperti tanda OK). Tiga jari lainnya (tengah manis kelingking) dibuka tegak lurus ke atas.",
      "Posisi Tangan :":
          "Telapak tangan menghadap ke depan.",
      "tips :":
          "Pastikan jari tengah manis dan kelingking benar-benar lurus agar terlihat tegas.",
      "penggunaan :":
          "Huruf F digunakan saat mengeja nama atau kata dalam Bahasa Isyarat Indonesia."
     },
    {
      "title": "Huruf G",
      "image": "assets/images/g.png",
      "Cara Membentuk Isyarat :":
          "Posisikan jari telunjuk dan ibu jari sejajar menunjuk ke samping secara horizontal seolah-olah sedang menunjukkan ukuran kecil. Jari lainnya mengepal.",
      "Posisi Tangan :":
          "Telapak tangan menghadap ke arah tubuh (menyamping).",
      "tips :":
          "Jarak antara telunjuk dan ibu jari jangan terlalu lebar.",
      "penggunaan :":
          "Huruf G digunakan saat mengeja nama atau kata dalam Bahasa Isyarat Indonesia."
    },
    {
      "title": "Huruf H",
      "image": "assets/images/h.png",
      "Cara Membentuk Isyarat :":
          "Mirip dengan huruf G namun gunakan dua jari (telunjuk dan jari tengah) yang menunjuk ke samping secara sejajar.",
      "Posisi Tangan :":
          "Tangan diposisikan horizontal ke samping.",
      "tips :":
          "Pastikan jari manis dan kelingking tertutup rapat oleh ibu jari.",
      "penggunaan :":
          "Huruf H digunakan saat mengeja nama atau kata dalam Bahasa Isyarat Indonesia."
    },
  ];

  @override
  Widget build(BuildContext context) {
    final item = alphabet[currentIndex];

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
                    "Alfabet Isyarat",
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
                            "Alfabet Isyarat SIBI",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 5),

                          const Text(
                            "Pelajari huruf A-Z langkah demi langkah",
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
                                            alphabet[currentIndex]["title"]!
                                                .replaceAll("Huruf ", ""),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13,
                                            ),
                                          ),

                                          const Spacer(),

                                          Text(
                                            "${currentIndex + 1}/26",
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
                                            26,
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
                                    itemCount: alphabet.length,

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
                                        alphabet[index]["image"]!,
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