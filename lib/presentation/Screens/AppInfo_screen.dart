import 'package:flutter/material.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
                        decoration: BoxDecoration(
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
                        child: Image.network(
                          'https://indyguide-web-development.s3.us-east-2.amazonaws.com/listings/images/Uzbekistan-Gourmet-Tour-1594212517575.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 260,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
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
                      backgroundImage: AssetImage(
                        'assets/images/logo31.png',
                      ),
                      radius: 55,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                'UZBEKISTAN',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
              ),
            ),
            Center(
              child: Text(
                'TRAVEL GUIDE',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 5),
              ),
            ),
            Divider(
              height: 20,
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                " O’zbekistonda turizmni rivojlantirish uchun mobil ilova yaratish maqsadi, turistlar uchun O’zbekistonda sayohat va safarlarini tashkil etishni yanada qulaylashtirish, sayohat mahsulotlari va xizmatlarini sotishni, turizmga oid ma'lumotlarni taqdim etishni va turizm tadbirlarini tashkil etishni osonlashtirishdir.Bu ilova, turistlar uchun virtual sayohatlar, ko'chish, mehmonxonalar, transport xizmatlari, restoranlar va boshqa turizm mahsulotlariga onlayn buyurtma berish imkoniyatini taqdim etadi. Shu bilan birga, turistlar O`zbekistondagi turistik obyektlar, yodgorliklar va madaniyat turg'unligi haqida ma'lumotlarga ega bo'lishadi.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
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
            SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    child: Image.asset('assets/images/facebook.png'),
                  ),
                  SizedBox(width: 8),
                  Container(
                    height: 45,
                    width: 45,
                    child: Image.asset('assets/images/inst1.png'),
                  ),
                  SizedBox(width: 8),
                  Container(
                    height: 40,
                    width: 40,
                    child: Image.asset('assets/images/tel.png'),
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
