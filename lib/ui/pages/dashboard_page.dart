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
    return BlocBuilder<AssetCubit, AssetState>(builder: (_, state) {
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
                        onTap: () async {
                          final Asset result = await showSearch(
                            context: context,
                            delegate:
                                BarangSearch((state as AssetLoaded).assets),
                          );
                          Get.to(DetailPage());
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
            child: (state is AssetLoaded)
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
                        onChanged: (String value) async {
                          setState(() {
                            sortBy = value;
                          });
                        },
                      ),
                    ],
                  )
                : SizedBox(),
          ),
          Container(
              //TODO:tambahkan animasi untuk ux scrolling
              height: size.height * 0.5 - 20,
              color: kBackgroundColor,
              child: (state is AssetLoaded)
                  ? Builder(builder: (_) {
                      List<Asset> assets = state.assets;
                      if (sortBy == 'terbaru') {
                        assets.sort((a, b) => a.id.compareTo(b.id));
                      } else if (sortBy == 'terlama') {
                        assets.sort((a, b) => b.id.compareTo(a.id));
                      } else if (sortBy == 'kondisi') {
                        assets
                            .sort((a, b) => a.condition.compareTo(b.condition));
                      }
                      return ListView(
                          physics: BouncingScrollPhysics(),
                          children: assets
                              .map((asset) => GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        DetailPage(
                                            // asset: asset,
                                            ),
                                      );
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
                              .toList());
                    })
                  : loadingIndicator),
        ],
      );
    });
  }
}

class BarangSearch extends SearchDelegate<Asset> {
  final List<Asset> assets;

  BarangSearch(this.assets);

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
  Widget buildResults(BuildContext context) {
    final result = assets
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    if (result.isEmpty) {
      return Center(child: Text("No Data"));
    }

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: SvgPicture.asset('assets/box_icon.svg'),
        title: Text(result[index].name),
        onTap: () {
          close(context, result[index]);
        },
      ),
      itemCount: result.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final result = assets
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    if (result.isEmpty) {
      return Center(child: Text("No Data"));
    }

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: SvgPicture.asset('assets/box_icon.svg'),
        title: Text(result[index].name),
        onTap: () {
          close(context, result[index]);
        },
      ),
      itemCount: result.length,
    );
  }
}
