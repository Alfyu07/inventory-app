part of 'pages.dart';

class AddAssetPage extends StatefulWidget {
  @override
  _AddAssetPageState createState() => _AddAssetPageState();
}

class _AddAssetPageState extends State<AddAssetPage> {
  //TODO: tambahkan fila untuk gambar

  //TODO: state management
  TextEditingController nameController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController simpanController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();
  String _kondisiBarang;
  DateTime selectedDate = DateTime.now();
  var kondisi = ['Bagus', 'Rusak'];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      children: [
        SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            alignment: Alignment.centerLeft,
            height: size.height * 0.1,
            child: Text(
              'Tambah Barang',
              style: titleFontStyle0,
            ),
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin:
                  EdgeInsets.symmetric(vertical: 10, horizontal: defaultMargin),
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
                  builder: (BuildContext context) => _buildPopupDialog(context),
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

              //Harga Pembelian
              Text('Harga barang', style: blackFontStyle0),
              buildTextField(
                controller: hargaController,
                hint: 'Masukkan harga barang',
                contentPadding: EdgeInsets.only(bottom: 10.0),
              ),

              //Input Lokasi
              Text('Lokasi', style: blackFontStyle0),
              buildTextField(
                controller: simpanController,
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
                child: RaisedButton(
                  onPressed: () {},
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  color: mainColor0,
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
    );
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
          value: _kondisiBarang,
          isDense: true,
          onChanged: (value) {
            setState(() {
              _kondisiBarang = value;
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
          hint: Text('Masukkan kondisi',
              style: blackFontStyle2.copyWith(color: greyColor1)),
        ),
      ),
    );
  }

  Container buildTextField(
      {controller, hint, height = 40.0, maxLines = 1, contentPadding = null}) {
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
            hintStyle: blackFontStyle2.copyWith(color: greyColor1),
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
            //TODO:tambahkan aksi untuk membuka gallery atau camera
            GestureDetector(
              onTap: () {},
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
              onTap: () {},
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
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}
