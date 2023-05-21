// ignore: camel_case_types
// ignore_for_file: file_names, camel_case_types, duplicate_ignore, non_constant_identifier_names

enum category { nature, historical }

class Placelocation {
  final double Latitude; // Y-o`qi
  final double Longitude; // X-o`qi
  final String adress;
  Placelocation({
    required this.Latitude,
    required this.Longitude,
    required this.adress,
  });
}

class place {
  final String id;
  final String title;
  final String regionId;
  final List<String> Image;
  final String descriptions;
  final category TypeCategory;
  final Placelocation locations;
  bool islike;

  place({
    required this.id,
    required this.title,
    required this.regionId,
    required this.Image,
    required this.descriptions,
    required this.TypeCategory,
    required this.locations,
    this.islike = false,
  });
}

// class PlaceData {
//   List<place> places = [

//     place(id: 'p1', title: 'title', regionId: '0', Image: ['Image'], descriptions: 'Qalʼa meʼmorchilik yodgorligi 1880-1881-yillarda Chor Russiya harbiy qismi uchun mudofaa qoʻrgʻoni sifatida bunyod etilgan. Uning 10 metrdan ortiq balandlikka ega boʻlgan devoridan Andijon shahri kaftdek koʻrinib turgan. Bu esa shu joydan turib isyonlarni oʻz vaqtida bostirish imkonini bergan.Qalʼa oʻz vaqtida 1,5 gektar maydonni egallagan. Tarkibida qurol aslaha omborlari, oshxona, toʻpxonalar mavjud boʻlgan. Shuningdek, Chor Russiya armiyasining Turkiston asosiy muntazam harakatdagi batalyonining 4- va 5-rotalari shu joyda joylashgan. Ushbu rotalarda esa250 dan ziyod askarlar qoʻnim topgan.Tarixning qonli toʻqnashuvlariga guvoh devorlarQalʼa bilan tanishgan kishi tarixdan guvohlik beruvchi bu salobatli devorlar ne bir voqealarga shohid ekanligini yaxshi bilmaydi. Aslida u130-yil davomida juda koʻp tarixiy, fojiali voqealarning guvohidir. Masalan,1898-yil Chor Russiyani xavotirga solib kelgan Andijon qoʻzgʻoloni yuzaga keldi. Bugungi kunda Dukchi Eshon nomi bilan tarix zarvaraqlaridan joy olgan mingtepalik Muhammadali Eshonboshchiligidagi milliy ozodlik harakati isyonchilari Qalʼadagi rus askarlariga qarshi hujum uyushtirishdi. Natijada 23 nafar rus askari oʻldirildi. Qalʼa zabt etildi, biroq, rus armiyasi tomonidan uyushtirilgan qoʻzgʻolon tufayli Qalʼa shahidlar manziliga aylandi.Muhammadali Eshon boshliq 19 nafar qoʻzgʻolonchi Qalʼa maydonida osib oʻldirildi. 330 nafar qoʻzgʻolonchilar 4 yildan 20 yilgacha boʻlgan muddatdagi qamoq jazosiga tayin etildi.Koʻplab vatandoshlarimiz Sibirga surgun qilindi.', TypeCategory: category.historical, locations: 'locations')
//   ];
// }
