part of 'pages.dart';

class DetailPage extends StatelessWidget {
  final Asset asset;

  const DetailPage({Key key, this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: mainColor0,
              expandedHeight: 300.0,
              leading: IconButton(
                onPressed: () async {
                  context.read<AssetCubit>().getAssets();
                  getx.Get.off(() => MainPage());
                },
                icon: Icon(Icons.arrow_back, color: Colors.white),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    getx.Get.to(() => QRPage(asset.hash),
                        transition: getx.Transition.downToUp);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 18, right: 18),
                    height: 24,
                    width: 24,
                    child: Stack(
                      children: [
                        SvgPicture.asset('assets/qr_code_scanner-24px.svg',
                            color: Colors.white)
                      ],
                    ),
                  ),
                )
              ],
              flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(asset.picturePath)),
            ),
            (SliverFixedExtentList(
              itemExtent: size.height * 0.75,
              delegate: SliverChildListDelegate(
                [
                  Container(
                    width: size.width,
                    padding: EdgeInsets.symmetric(
                        vertical: defaultMargin, horizontal: defaultMargin),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: kBackgroundColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: size.width, // 32 + 102
                              child: Text(
                                asset.name,
                                style: titleFontStyle0,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            AssetConditionIndicator(condition: asset.condition),
                            SizedBox(height: 20)
                          ],
                        ),
                        Text('Deskripsi asset',
                            style: blackFontStyle0.copyWith(
                                fontWeight: FontWeight.w700)),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //desc 1
                            Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      margin: EdgeInsets.only(right: 10),
                                      child: Icon(Icons.calendar_today,
                                          color: greyColor0),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 130,
                                          child: Text(
                                            'Tanggal dibeli',
                                            style: blackFontStyle2.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: greyColor0,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 6),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 3),
                                          child: Text(
                                            asset.getPurchaseDate(),
                                            style: blackFontStyle2.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: greyColor0,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            //desc 2
                            Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      margin: EdgeInsets.only(right: 10),
                                      child: Icon(Icons.payments_outlined,
                                          color: greyColor0),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 130, // 32 + 102
                                          child: Text(
                                            'Harga dibeli',
                                            style: blackFontStyle2.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: greyColor0,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 6),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 1),
                                          child: Text(
                                            NumberFormat.currency(
                                                    locale: 'id-ID',
                                                    symbol: 'IDR ',
                                                    decimalDigits: 0)
                                                .format(asset.price),
                                            style: blackFontStyle2.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: greyColor0,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        //desc 3
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              margin: EdgeInsets.only(right: 10),
                              child:
                                  Icon(Icons.location_city, color: greyColor0),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 130,
                                  child: Text(
                                    'Lokasi barang',
                                    style: blackFontStyle2.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: greyColor0,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 6),
                                Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Text(
                                    asset.location,
                                    style: blackFontStyle2.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: greyColor0,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Keterangan',
                          style: blackFontStyle0.copyWith(
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 10),
                        Text(
                          asset.description ?? 'Tidak ada keterangan',
                          style: blackFontStyle2.copyWith(
                            fontWeight: FontWeight.bold,
                            color: greyColor0,
                          ),
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              onPressed: () async {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      _buildAlertDialog(context, asset.id),
                                );
                              },
                              style: TextButton.styleFrom(
                                primary: dangerColor,
                              ),
                              child: Text(
                                'Hapus',
                                style: blackFontStyle0.copyWith(
                                    color: dangerColor),
                              ),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                    getx.Get.to(
                                        () => EditAssetPage(asset: asset));
                                  },
                                  child: Text('Edit',
                                      style: blackFontStyle0.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      )),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  _buildAlertDialog(BuildContext context, int id) {
    return AlertDialog(
      title: Text('Hapus'),
      content: SingleChildScrollView(
        child: Text('Apakah anda yakin?', style: blackFontStyle1),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Batalkan',
              style: blackFontStyle1.copyWith(fontWeight: FontWeight.w500)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Hapus',
              style: blackFontStyle1.copyWith(color: dangerColor)),
          onPressed: () async {
            await context.read<AssetCubit>().delete(id);

            AssetState state = context.read<AssetCubit>().state;

            if (state is AssetDeleted) {
              Navigator.of(context).pop();

              await context.read<AssetCubit>().getAssets();
              getx.Get.off(MainPage());
            } else if (state is AssetLoadingFailed) {
              Navigator.of(context).pop();
              getx.Get.snackbar(
                "",
                "",
                backgroundColor: 'D9435E'.toColor(),
                icon: Icon(Icons.close_outlined, color: Colors.white),
                titleText: Text(
                  'Sign In Failed',
                  style: GoogleFonts.poppins(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                messageText: Text(
                  (state as UserLoadingFailed).message,
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
