part of 'pages.dart';

class NotFoundPage extends StatelessWidget {
  final Asset asset;

  const NotFoundPage({Key key, this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: IllustrationPage(
        title: '404 Not Found',
        subtitle: 'Data tidak ditemukan',
        picturePath: 'assets/404_error.png',
        buttonTap1: () {
          context.read<AssetCubit>().getAssets();
          Get.offAll(MainPage());
        },
        buttonTitle1: 'Kembali ke home',
      ),
    );
  }
}
