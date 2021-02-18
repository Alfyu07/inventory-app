part of 'pages.dart';

class ScanQRPage extends StatefulWidget {
  @override
  _ScanQRPageState createState() => _ScanQRPageState();
}

class _ScanQRPageState extends State<ScanQRPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          width: double.infinity,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: size.height * 0.1,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Scan QR Code',
                    style: titleFontStyle0,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: size.height - size.height * 0.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: size.height * 0.6,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/scan-illustrator.png'),
                          ),
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {},
                        elevation: 2,
                        padding: EdgeInsets.all(5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        color: mainColor0,
                        child: Text(
                          'Scan',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
