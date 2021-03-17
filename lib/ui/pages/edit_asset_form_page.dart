part of 'pages.dart';

class EditAssetPage extends StatefulWidget {
  Asset asset;

  EditAssetPage({this.asset});
  @override
  _EditAssetPageState createState() => _EditAssetPageState();
}

class _EditAssetPageState extends State<EditAssetPage> {
  //TODO: Ambil data untuk di edit, belum jadi
  TextEditingController nameController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController lokasiController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();
  String _kondisiAsset;
  DateTime selectedDate = DateTime.now();
  File _imageFile;

  var kondisi = ['Bagus', 'Rusak'];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              alignment: Alignment.centerLeft,
              height: size.height * 0.1,
              child: Text(
                'Edit asset',
                style: titleFontStyle0,
              ),
            ),
          ),
          _imageFile == null
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 10, horizontal: defaultMargin),
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                          color: lightGreyColor,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              _buildPopupDialog(context),
                        );
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        child: Stack(
                          children: [SvgPicture.asset('assets/photo.svg')],
                        ),
                      ),
                    )
                  ],
                )
              : Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 10, horizontal: defaultMargin),
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        color: lightGreyColor,
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: FileImage(_imageFile),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _clear();
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          shape: BoxShape.circle,
                        ),
                        child: Stack(
                          children: [
                            SvgPicture.asset('assets/clear.svg',
                                color: Colors.white, width: 40),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: defaultMargin, vertical: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Input nama asset
                Text('Nama asset', style: blackFontStyle0),
                buildTextField(
                    controller: nameController,
                    hint: 'Masukkan nama asset',
                    contentPadding: EdgeInsets.only(bottom: 10.0)),

                //Harga Pembelian
                Text('Harga asset', style: blackFontStyle0),
                buildTextField(
                  controller: hargaController,
                  hint: 'Masukkan harga asset',
                  contentPadding: EdgeInsets.only(bottom: 10.0),
                ),

                //Input Lokasi
                Text('Lokasi', style: blackFontStyle0),
                buildTextField(
                  controller: lokasiController,
                  hint: 'Masukkan lokasi asset disimpan',
                  contentPadding: EdgeInsets.only(bottom: 10.0),
                ),
                //Input kondisi
                Text('Kondisi', style: blackFontStyle0),
                buildDropdownForm(values: kondisi),

                //Input tanggal pembelian
                Text('Tanggal pembelian', style: blackFontStyle0),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.fromLTRB(0, 5, 5, 10),
                  padding: EdgeInsets.only(left: 10),
                  width: size.width,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: greyColor1),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${DateFormat("dd-MM-yyyy").format(selectedDate)}',
                            style: blackFontStyle1),
                        GestureDetector(
                          onTap: () => _selectDate(context),
                          child: Container(
                              height: 40,
                              width: 40,
                              color: greyColor1,
                              child: Icon(Icons.calendar_today,
                                  color: Colors.white)),
                        )
                      ]),
                ),

                //Input keterangan
                Text('Keterangan', style: blackFontStyle0),
                buildTextField(
                  controller: keteranganController,
                  hint: 'Masukkan Keterangan',
                  maxLines: null,
                  height: 80.0,
                ),
                Container(
                  width: double.infinity,
                  height: 45,
                  margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(AddAssetSuccessPage());
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      primary: mainColor0,
                    ),
                    child: Text(
                      'Tambahkan',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 80)
        ],
      ),
    );
  }

  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
        sourcePath: _imageFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: AndroidUiSettings(
            toolbarColor: mainColor0,
            toolbarWidgetColor: Colors.white,
            toolbarTitle: 'Crop It'));

    setState(() {
      _imageFile = cropped ?? _imageFile;
    });
  }

  Future<File> _pickImage(ImageSource source) async {
    PickedFile selected = await ImagePicker().getImage(source: source);
    return File(selected.path);
  }

  void _clear() {
    setState(() => _imageFile = null);
  }

  Container buildDropdownForm({List<String> values, width = double.infinity}) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 2.5, 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: width,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: greyColor1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _kondisiAsset,
          isDense: true,
          onChanged: (value) {
            setState(() {
              _kondisiAsset = value;
            });
          },
          items: values
              .map(
                (e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(e, style: blackFontStyle1),
                ),
              )
              .toList(),
          hint: Text('Masukkan kondisi', style: greyFontStyle),
        ),
      ),
    );
  }

  Container buildTextField(
      {controller, hint, height = 40.0, maxLines = 1, contentPadding}) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: greyColor1),
      ),
      child: TextField(
        style: blackFontStyle2,
        maxLines: maxLines,
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: greyFontStyle,
            hintText: hint,
            contentPadding: contentPadding),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return new AlertDialog(
      title: const Text('Select image source'),
      content: SizedBox(
        height: size.height * 0.125,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () async {
                if (_imageFile == null) {
                  _imageFile = await _pickImage(ImageSource.gallery);
                  await _cropImage();
                }
              },
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(right: 5),
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [SvgPicture.asset('assets/gallery.svg')],
                        )),
                    Text(
                      "Gallery",
                      style: blackFontStyle0,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                if (_imageFile == null) {
                  _imageFile = await _pickImage(ImageSource.camera);
                  await _cropImage();
                }
              },
              child: Container(
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(right: 5),
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [SvgPicture.asset('assets/camera.svg')],
                        )),
                    Text(
                      "Camera",
                      style: blackFontStyle0,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      actions: <Widget>[
        new TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: TextButton.styleFrom(
            primary: Theme.of(context).primaryColor,
          ),
          child: const Text('Close'),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final ThemeData theme = Theme.of(context);
    assert(theme.platform != null);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return buildMaterialDatePicker(context);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return buildCupertinoDatePicker(context);
    }
  }

  buildMaterialDatePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return FittedBox(
          child: Theme(
            data: ThemeData.light(),
            child: child,
          ),
        );
      },
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  buildCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != null && picked != selectedDate)
                  setState(() {
                    selectedDate = picked;
                  });
              },
              initialDateTime: selectedDate,
              minimumYear: 2000,
              maximumYear: 2100,
            ),
          );
        });
  }
}
