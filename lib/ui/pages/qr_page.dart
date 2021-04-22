part of 'pages.dart';

class QRPage extends StatefulWidget {
  final String hash;

  const QRPage(this.hash, {Key key}) : super(key: key);
  @override
  _QRPageState createState() => new _QRPageState();
}

class _QRPageState extends State<QRPage> {
  final globalKey = GlobalKey();

  Future<void> writeToFile(ByteData data, String path) async {
    final buffer = data.buffer;
    await File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  Future<String> getQrWidget() async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      debugPrint(bs64.length.toString());

      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      final ts = DateTime.now().millisecondsSinceEpoch.toString();
      String path = '$tempPath/$ts.png';
      await writeToFile(ByteData.sublistView(pngBytes), path);
      return path;
    } catch (exception) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          Container(
            color: mainColor1,
          ),
          SafeArea(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [mainColor0, mainColor2],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.all(6),
                child: IconButton(
                  onPressed: () {
                    getx.Get.back();
                  },
                  icon: Icon(Icons.close_rounded,
                      size: 32.0, color: Colors.white),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.all(6),
                child: IconButton(
                  onPressed: () async {
                    String path = await getQrWidget();

                    await Share.shareFiles(
                      [path],
                      subject: 'My QR code',
                      text: 'Please scan me',
                    );
                  },
                  icon: Icon(Icons.share_rounded,
                      size: 32.0, color: Colors.white),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: RepaintBoundary(
                key: globalKey,
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: blackColor.withAlpha(38),
                          offset: Offset(0.0, 8.0),
                          blurRadius: 24.0,
                        )
                      ]),
                  child: QrImage(
                    data: widget.hash,
                    version: QrVersions.auto,
                    size: 320,
                    gapless: false,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
