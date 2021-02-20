part of 'pages.dart';

class SuccessOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: IllustrationPage(
        title: 'Request Berhasil!',
        subtitle: 'Barang berhasil ditambahkan',
        buttonTap1: () {},
        buttonTitle1: 'Lihat detail barang',
        picturePath: 'assets/done.png',
        buttonTap2: () {
          Get.offAll(MainPage());
        },
        buttonTitle2: 'Kembali ke home',
      ),
    );
  }
}
