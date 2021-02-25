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
            title: Text('Detail asset'),
            backgroundColor: mainColor0,
            expandedHeight: 300.0,
            actions: [
              Container(
                  margin: EdgeInsets.only(top: 18, right: 18),
                  height: 24,
                  width: 24,
                  child: Stack(
                    children: [
                      SvgPicture.asset('assets/qr_code_scanner-24px.svg',
                          color: Colors.white)
                    ],
                  ))
            ],
            flexibleSpace:
                FlexibleSpaceBar(background: Image.network(asset.picturePath)),
          ),
          (SliverFixedExtentList(
            itemExtent: size.height * 0.75,
            delegate: SliverChildListDelegate([
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
                            style: titleFontStyle1,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        AssetConditionIndicator(asset: asset),
                        SizedBox(height: 20)
                      ],
                    ),
                    Text('Deskripsi asset',
                        style: titleFontStyle0.copyWith(fontSize: 20)),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 130,
                                      child: Text(
                                        'Tanggal dibeli',
                                        style: blackFontStyle1.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: greyColor0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 3),
                                      child: Text(
                                        '${DateFormat("dd-MM-yyyy").format(asset.tanggalDibeli)}',
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 130, // 32 + 102
                                      child: Text(
                                        'Harga dibeli',
                                        style: blackFontStyle1.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: greyColor0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 1),
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
                          child: Icon(Icons.location_city, color: greyColor0),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 130,
                              child: Text(
                                'Lokasi asset',
                                style: blackFontStyle1.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: greyColor0,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
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
                    SizedBox(height: 10),
                    Text('Keterangan',
                        style: titleFontStyle0.copyWith(fontSize: 20)),
                    SizedBox(height: 10),
                    Text(
                      asset.description,
                      style: blackFontStyle2.copyWith(
                        fontWeight: FontWeight.bold,
                        color: greyColor0,
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Hapus',
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              color: dangerColor,
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                Get.to(EditAssetPage(asset: asset));
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  width: 120,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: mainColor1,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Text(
                                    'Edit',
                                    style: GoogleFonts.poppins(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  )))
                        ])
                  ],
                ),
              ),
            ]),
          ))
        ],
      ),
    ));
  }
}
