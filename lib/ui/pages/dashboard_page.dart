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
                Text('Dashboard', style: titleFontStyle0),
                Row(
                  children: [
                    GestureDetector(
                      //TODO: Tambah Searching
                      onTap: () {
                        showSearch(context: context, delegate: BarangSearch());
                      },
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
          child: BlocBuilder<AssetCubit, AssetState>(
            builder: (_, state) => (state is AssetLoaded)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Daftar Barang',
                        style: titleFontStyle1,
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
                              style: blackFontStyle1.copyWith(
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        onChanged: (String value) {
                          setState(() {
                            sortBy = value;
                            if (sortBy == 'terbaru') {
                              state.assets.sortedBy(
                                (a, b) => b.tanggalDibeli.microsecondsSinceEpoch
                                    .compareTo(
                                  a.tanggalDibeli.microsecondsSinceEpoch,
                                ),
                              );
                            } else if (sortBy == 'terlama') {
                              state.assets.sortedBy(
                                (a, b) => a.tanggalDibeli.microsecondsSinceEpoch
                                    .compareTo(
                                  b.tanggalDibeli.microsecondsSinceEpoch,
                                ),
                              );
                            } else if (sortBy == 'kondisi') {
                              state.assets.sortedBy(
                                (a, b) => a.condition.compareTo(
                                  b.condition,
                                ),
                              );
                            }
                          });
                        },
                      ),
                    ],
                  )
                : SizedBox(),
          ),
        ),
        Container(
          //TODO:tambahkan animasi untuk ux scrolling
          height: size.height * 0.5 - 20,
          color: kBackgroundColor,
          child: BlocBuilder<AssetCubit, AssetState>(
              builder: (_, state) => (state is AssetLoaded)
                  ? ListView(
                      physics: BouncingScrollPhysics(),
                      children: state.assets
                          .map((asset) => GestureDetector(
                                onTap: () {
                                  Get.to(DetailPage(
                                    asset: asset,
                                  ));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: defaultMargin),
                                  child: AssetListItem(
                                    itemWidth: assetListWidth,
                                    asset: asset,
                                  ),
                                ),
                              ))
                          .toList())
                  : loadingIndicator),
        ),
      ],
    );
  }
}

List<Asset> recentSearch = [mockAssets[0], mockAssets[9], mockAssets[2]];

class BarangSearch extends SearchDelegate<String> {
  int selectedIndex;
  @override
  List<Widget> buildActions(BuildContext context) {
    //Actions for appbar

    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {}

  @override
  Widget buildSuggestions(BuildContext context) {
    // show something when someone searches for something
    final suggestionList = query.isEmpty
        ? recentSearch
        : mockAssets
            .where((element) => element.name.toLowerCase().startsWith(query))
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
          selectedIndex = index;
        },
        leading: Icon(Icons.location_city),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].name.substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
              children: [
                TextSpan(
                    text: suggestionList[index].name.substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
