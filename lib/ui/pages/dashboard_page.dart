part of 'pages.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String sortBy;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double assetListWidth = size.width - 2 * defaultMargin;
    return ListView(
      children: [
        //* HEADER
        Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            height: size.height * 0.1,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dashboard',
                    style: titleFontStyle0.copyWith(letterSpacing: -0.3)),
                Row(
                  children: [
                    GestureDetector(
                      //TODO: Tambah Searching
                      onTap: () {},
                      child: Container(
                        width: 24,
                        height: 24,
                        margin: EdgeInsets.only(right: 16),
                        child: Stack(
                          children: [
                            SvgPicture.asset('assets/search.svg',
                                color: blackColor.withOpacity(0.6))
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      //TODO: Tambah routing logout
                      onTap: () {},
                      child: Container(
                        width: 24,
                        height: 24,
                        child: Stack(
                          children: [
                            SvgPicture.asset('assets/logout.svg',
                                color: blackColor.withOpacity(0.6))
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            )),

        //* OVERVIEW CARD
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: OverviewCard(
            barangBaru: 32,
            jumlahAsset: 120,
          ),
        ),
        //* LIST BARANG
        Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          margin: EdgeInsets.only(top: 8, bottom: 8),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Daftar Barang',
                style: titleFontStyle1.copyWith(letterSpacing: -0.3),
              ),
              DropdownButton<String>(
                items: <DropdownMenuItem<String>>[
                  DropdownMenuItem<String>(
                    value: 'terbaru',
                    child: Text('Terbaru',
                        style: blackFontStyle1.copyWith(
                            fontWeight: FontWeight.w500)),
                  ),
                  DropdownMenuItem<String>(
                    value: 'terlama',
                    child: Text('Terlama',
                        style: blackFontStyle1.copyWith(
                            fontWeight: FontWeight.w500)),
                  ),
                  DropdownMenuItem<String>(
                    value: 'kondisi',
                    child: Text('Kondisi',
                        style: blackFontStyle1.copyWith(
                            fontWeight: FontWeight.w500)),
                  ),
                ],
                value: sortBy,
                hint: Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      margin: EdgeInsets.only(right: 10),
                      child: Stack(
                        children: [
                          SvgPicture.asset('assets/sort.svg'),
                        ],
                      ),
                    ),
                    Text(
                      'Urutkan',
                      style:
                          blackFontStyle1.copyWith(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                onChanged: (String value) {
                  setState(() {
                    sortBy = value;
                    sortList(sortBy);
                  });
                },
              ),
              //TODO:Tambahin button buat ngurutin
            ],
          ),
        ),
        Container(
          //TODO:tambahkan animasi untuk ux scrolling
          height: size.height * 0.4,
          color: kBackgroundColor,
          child: ListView(
              physics: BouncingScrollPhysics(),
              children: mockBarang
                  .map((barang) => Container(
                        margin: EdgeInsets.only(top: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: defaultMargin),
                        child: AssetListItem(
                          itemWidth: assetListWidth,
                          barang: barang,
                        ),
                      ))
                  .toList()),
        ),
        SizedBox(
          height: 60,
        )
      ],
    );
  }

  void sortList(String key) {
    if (key == 'terlama') {
      mockBarang.sort((a, b) => a.id.compareTo(b.id));
    } else if (key == 'terbaru') {
      mockBarang.sort((a, b) => b.id.compareTo(a.id));
    } else if (key == 'kondisi') {
      mockBarang.sort((a, b) => a.condition.compareTo(b.condition));
    }
  }
}
