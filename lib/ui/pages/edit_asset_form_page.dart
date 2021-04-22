part of 'pages.dart';

class EditAssetPage extends StatefulWidget {
  final Asset asset;

  const EditAssetPage({Key key, this.asset}) : super(key: key);

  @override
  _EditAssetPageState createState() => _EditAssetPageState();
}

class _EditAssetPageState extends State<EditAssetPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String _condition;
  bool isLoading = false;
  DateTime purchaseDate = DateTime.now();
  File _imageFile;
  var kondisi = ['Bagus', 'Rusak'];

  @override
  void initState() {
    super.initState();
    nameController.text = widget.asset.name;
    priceController.text = widget.asset.price.toString();
    locationController.text = widget.asset.location;
    descriptionController.text = widget.asset.description;
    // _condition = widget.asset.condition;
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    locationController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

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
                'Perbarui Barang',
                style: titleFontStyle0,
              ),
            ),
          ),
          _imageFile == null
              ? GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildPopupDialog(context),
                    );
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 10, horizontal: defaultMargin),
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          color: lightGreyColor,
                          borderRadius: BorderRadius.circular(6),
                          image: DecorationImage(
                            image: new NetworkImage(widget.asset.picturePath),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildPopupDialog(context),
                    );
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 10, horizontal: defaultMargin),
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          color: lightGreyColor,
                          borderRadius: BorderRadius.circular(6),
                          image: DecorationImage(
                            image: new FileImage(_imageFile),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: defaultMargin, vertical: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Input nama barang
                Text('Nama barang', style: blackFontStyle0),
                buildTextField(
                    controller: nameController,
                    hint: 'Masukkan nama barang',
                    contentPadding: EdgeInsets.only(bottom: 10.0)),

                //Harga Pe_buildPopupDialogmbelian
                Text('Harga barang', style: blackFontStyle0),
                buildTextField(
                  controller: priceController,
                  hint: 'Masukkan harga barang',
                  contentPadding: EdgeInsets.only(bottom: 10.0),
                ),

                //Input Lokasi
                Text('Lokasi', style: blackFontStyle0),
                buildTextField(
                  controller: locationController,
                  hint: 'Masukkan lokasi barang disimpan',
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
                        Text('${DateFormat("dd-MM-yyyy").format(purchaseDate)}',
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
                  controller: descriptionController,
                  hint: 'Masukkan Keterangan',
                  maxLines: null,
                  height: 80.0,
                ),
                (isLoading)
                    ? Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Center(child: loadingIndicator))
                    : Container(
                        width: double.infinity,
                        height: 45,
                        margin: EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          onPressed: () async {
                            widget.asset.copyWith(
                              name: nameController.text,
                              condition: _condition,
                              description: descriptionController.text,
                              price: priceController.text.toInt(),
                              purchaseDate:
                                  DateFormat("yyyy-MM-dd").format(purchaseDate),
                              location: locationController.text,
                            );
                            setState(() {
                              isLoading = true;
                            });

                            await context
                                .read<AssetCubit>()
                                .editAsset(widget.asset, _imageFile);

                            AssetState state = context.read<AssetCubit>().state;

                            if (state is SingleAssetLoaded) {
                              getx.Get.to(() =>
                                  AddAssetSuccessPage(asset: state.asset));
                            } else if (state is AssetLoadingFailed) {
                              getx.Get.snackbar(
                                "",
                                "",
                                backgroundColor: 'D9435E'.toColor(),
                                icon: Icon(Icons.close_outlined,
                                    color: Colors.white),
                                titleText: Text(
                                  'Please try again',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                messageText: Text(
                                  state.message,
                                  style:
                                      GoogleFonts.poppins(color: Colors.white),
                                ),
                              );
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            primary: mainColor1,
                          ),
                          child: Text('Perbarui',
                              style: blackFontStyle0.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
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
    if (selected != null) {
      return File(selected.path);
    }
  }

  Container buildDropdownForm({List<String> values, width = double.infinity}) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 2.5, 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: width,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: greyColor1),
        borderRadius: BorderRadius.circular(3),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _condition,
          isDense: true,
          onChanged: (value) {
            setState(() {
              _condition = value;
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
        borderRadius: BorderRadius.circular(3),
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
                File selected = await _pickImage(ImageSource.gallery);
                if (selected != null) {
                  _imageFile = selected;
                  await _cropImage();
                }
                Navigator.of(context).pop();
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
                File selected = await _pickImage(ImageSource.camera);
                if (selected != null) {
                  _imageFile = selected;
                  await _cropImage();
                }
                Navigator.of(context).pop();
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
      initialDate: purchaseDate,
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
    if (picked != null && picked != purchaseDate) {
      setState(() {
        purchaseDate = picked;
      });

      print(picked);
    }
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
                if (picked != null && picked != purchaseDate)
                  setState(() {
                    purchaseDate = picked;
                  });
              },
              initialDateTime: purchaseDate,
              minimumYear: 2000,
              maximumYear: 2100,
            ),
          );
        });
  }
}
