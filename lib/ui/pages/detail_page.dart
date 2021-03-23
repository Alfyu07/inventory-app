part of 'pages.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<AssetCubit, AssetState>(
      builder: (context, state) {
        if (state is SingleAssetLoaded) {
          return Scaffold(
            body: Center(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    title: Text('Detail barang'),
                    backgroundColor: mainColor0,
                    expandedHeight: 300.0,
                    leading: IconButton(
                      onPressed: () async {
                        context.read<AssetCubit>().getAssets();
                        Get.off(MainPage());
                      },
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                    ),
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
                        ),
                      )
                    ],
                    flexibleSpace: FlexibleSpaceBar(
                        background: Image.network(state.asset.picturePath)),
                  ),
                  (SliverFixedExtentList(
                    itemExtent: size.height * 0.75,
                    delegate: SliverChildListDelegate(
                      [
                        Container(
                          width: size.width,
                          padding: EdgeInsets.symmetric(
                              vertical: defaultMargin,
                              horizontal: defaultMargin),
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
                                      state.asset.name,
                                      style: titleFontStyle1,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  AssetConditionIndicator(
                                      condition: state.asset.condition),
                                  SizedBox(height: 20)
                                ],
                              ),
                              Text('Deskripsi asset',
                                  style:
                                      titleFontStyle0.copyWith(fontSize: 20)),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //desc 1
                                  Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                  style:
                                                      blackFontStyle1.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: greyColor0,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 3),
                                                child: Text(
                                                  state.asset.getPurchaseDate(),
                                                  style:
                                                      blackFontStyle2.copyWith(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                  style:
                                                      blackFontStyle1.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: greyColor0,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 1),
                                                child: Text(
                                                  NumberFormat.currency(
                                                          locale: 'id-ID',
                                                          symbol: 'IDR ',
                                                          decimalDigits: 0)
                                                      .format(
                                                          state.asset.price),
                                                  style:
                                                      blackFontStyle2.copyWith(
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
                                    child: Icon(Icons.location_city,
                                        color: greyColor0),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 130,
                                        child: Text(
                                          'Lokasi barang',
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
                                          state.asset.location,
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
                                  style:
                                      titleFontStyle0.copyWith(fontSize: 20)),
                              SizedBox(height: 10),
                              Text(
                                state.asset.description ??
                                    'Tidak ada keterangan',
                                style: blackFontStyle2.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: greyColor0,
                                ),
                              ),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextButton(
                                    onPressed: () async {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            _buildAlertDialog(
                                                context, state.asset.id),
                                      );
                                    },
                                    style: TextButton.styleFrom(
                                      primary: dangerColor,
                                    ),
                                    child: Text(
                                      'Hapus',
                                      style: GoogleFonts.poppins(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(EditAssetPage(asset: state.asset));
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 120,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: mainColor1,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Text(
                                        'Edit',
                                        style: GoogleFonts.poppins(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                    ),
                                  )
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
        } else if (state is AssetLoadingFailed) {
          return IllustrationPage(
            title: '404 Not Found',
            subtitle: 'Data tidak ditemukan',
            picturePath: 'assets/404_error.png',
            buttonTap1: () {
              context.read<AssetCubit>().getAssets();
              Get.offAll(MainPage());
            },
            buttonTitle1: 'Kembali ke home',
          );
        } else {
          return Container();
        }
      },
    );
  }

  _buildAlertDialog(BuildContext context, int id) {
    return AlertDialog(
      title: Text('Hapus'),
      content: SingleChildScrollView(
        child: Text('Apakah anda yakin ingin menghapus item ini?',
            style: blackFontStyle2),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('CANCEL',
              style: blackFontStyle2.copyWith(fontWeight: FontWeight.w500)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('DELETE',
              style: blackFontStyle2.copyWith(color: dangerColor)),
          onPressed: () async {
            await context.read<AssetCubit>().delete(id);

            AssetState state = context.read<AssetCubit>().state;

            if (state is AssetDeleted) {
              Navigator.of(context).pop();

              await context.read<AssetCubit>().getAssets();
              Get.off(MainPage());
            } else if (state is AssetLoadingFailed) {
              Navigator.of(context).pop();
              Get.snackbar(
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
