part of 'pages.dart';

class AddAssetSuccessPage extends StatelessWidget {
  final Asset asset;

  const AddAssetSuccessPage({Key key, this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: IllustrationPage(
        title: 'Request Berhasil!',
        subtitle: 'Barang berhasil ditambahkan',
        buttonTap1: () {
          Get.to(DetailPage());
        },
        buttonTitle1: 'Lihat detail barang',
        picturePath: 'assets/done.png',
        buttonTap2: () {
          context.read<AssetCubit>().getAssets();
          Get.offAll(MainPage());
        },
        buttonTitle2: 'Kembali ke home',
      ),
    );
  }
}
