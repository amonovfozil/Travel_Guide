// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({super.key});

  @override
  Widget build(BuildContext context) {
    void pushlaunchURL(String url) async {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 260,
                        width: double.infinity,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1,
                                blurRadius: 20)
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                          ),
                        ),
                        child: Image.asset(
                          'assets/images/fon1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 260,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                          ),
                          color: Colors.blueGrey.withOpacity(0.3),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.5),
                      backgroundImage: const AssetImage(
                        'assets/images/logo31.png',
                      ),
                      radius: 55,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                'UZBEKISTAN',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
              ),
            ),
            const Center(
              child: Text(
                'TRAVEL GUIDE',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 5),
              ),
            ),
            const Divider(
              height: 20,
              thickness: 2,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                " O’zbekistonda turizmni rivojlantirish uchun mobil ilova yaratish maqsadi, turistlar uchun O’zbekistonda sayohat va safarlarini tashkil etishni yanada qulaylashtirish, sayohat mahsulotlari va xizmatlarini sotishni, turizmga oid ma'lumotlarni taqdim etishni va turizm tadbirlarini tashkil etishni osonlashtirishdir.Bu ilova, turistlar uchun virtual sayohatlar, ko'chish, mehmonxonalar, transport xizmatlari, restoranlar va boshqa turizm mahsulotlariga onlayn buyurtma berish imkoniyatini taqdim etadi. Shu bilan birga, turistlar O`zbekistondagi turistik obyektlar, yodgorliklar va madaniyat turg'unligi haqida ma'lumotlarga ega bo'lishadi.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    'Muallif:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //TATU Samarqand filial KI fakultet Di 111-19-guruh talabasi
                  Text(
                    ' Amonov Fozil',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () => pushlaunchURL(
                        'https://www.facebook.com/profile.php?id=100071581669785&mibextid=ZbWKwL'),
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset('assets/images/facebook.png'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () => pushlaunchURL(
                        'https://instagram.com/amonov_fozil?igshid=NGExMmI2YTkyZg=='),
                    child: SizedBox(
                      height: 45,
                      width: 45,
                      child: Image.asset('assets/images/inst1.png'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () => pushlaunchURL('https://t.me/amonov_ff'),
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset('assets/images/tel.png'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
