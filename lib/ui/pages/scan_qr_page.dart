part of 'pages.dart';

class ScanQRPage extends StatefulWidget {
  @override
  _ScanQRPageState createState() => _ScanQRPageState();
}

class _ScanQRPageState extends State<ScanQRPage> {
  String result;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          width: double.infinity,
          height: 80,
          alignment: Alignment.centerLeft,
          child: Text(
            'Scan QR Code',
            style: titleFontStyle0,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: size.height / 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/scan-illustrator.png'),
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () async {
                        scanQRCode();
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        padding: EdgeInsets.all(5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        primary: mainColor1,
                      ),
                      child: Text('Scan',
                          style: blackFontStyle0.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                  ),
                  result != null
                      ? Text(result, style: titleFontStyle0)
                      : SizedBox()
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> scanQRCode() async {
    try {
      await Permission.camera.request();
      String qrResult = await scanner.scan();
      setState(() {
        result = qrResult;
      });
    } on PlatformException {
      print('failed to get platform version');
    }
  }
}
