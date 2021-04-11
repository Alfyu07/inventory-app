part of 'pages.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<String> sort = ["terbaru", "terlama", "kondisi"];
  String sortBy;
  int page;
  ScrollController scrollController;
  bool isLoading;
  @override
  void initState() {
    super.initState();
    sortBy = sort[0];
    scrollController = ScrollController();
    page = 1;
    isLoading = false;
    context.read<AssetCubit>().getAssets();
  }

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;
      if (currentScroll == maxScroll) {
        page += 1;
        context
            .read<AssetCubit>()
            .getAssets(page: page, sort: sortBy, limit: 10);
      }
    });
    final size = MediaQuery.of(context).size;
    final double assetListWidth = size.width - 2 * defaultMargin;
    return ListView(children: [
      Column(children: [
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
                          delegate: BarangSearch(),
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
            jumlahAsset: 130,
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

                    await context
                        .read<AssetCubit>()
                        .getAssets(page: 1, limit: 10, sort: sortBy);

                    AssetState state = context.read<AssetCubit>().state;
                    if (state is AssetLoaded) {
                      setState(() {});
                    } else if (state is AssetLoadingFailed) {
                      Get.snackbar(
                        "",
                        state.message,
                        backgroundColor: 'D9435E'.toColor(),
                        icon: Icon(Icons.close_outlined, color: Colors.white),
                        titleText: Text(
                          'Load Asset failed',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        messageText: Text(
                          state.message,
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                      );
                    }
                  },
                ),
              ],
            )),
        Container(
          //TODO:tambahkan animasi untuk ux scrolling
          color: kBackgroundColor,
          child: BlocBuilder<AssetCubit, AssetState>(
              builder: (context, state) => (state is AssetLoaded)
                  ? Column(
                      children: state.assets
                          .map(
                            (e) => GestureDetector(
                              onTap: () {
                                Get.to(() => DetailPage(asset: e));
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                padding: EdgeInsets.only(
                                    bottom: 3,
                                    left: defaultMargin,
                                    right: defaultMargin),
                                child: AssetListItem(
                                    itemWidth: assetListWidth, asset: e),
                              ),
                            ),
                          )
                          .toList(),
                    )
                  : Center(child: loadingIndicator)),

          // BlocBuilder<AssetCubit, AssetState>(
          //     builder: (context, state) => (state is AssetLoaded)
          //         ? ListView.builder(
          //             controller: scrollController,
          //             itemCount: (state.hasReachedMax == true)
          //                 ? state.assets.length
          //                 : state.assets.length + 1,
          //             itemBuilder: (context, index) =>
          //                 (index < state.assets.length)
          //                     ? GestureDetector(
          //                         onTap: () async {
          //                           await context
          //                               .read<AssetCubit>()
          //                               .getAssetById(state.assets[index].id);
          //                           Get.to(
          //                             DetailPage(),
          //                           );
          //                         },
          //                         child: Container(
          //                           padding: EdgeInsets.only(
          //                               bottom: 3,
          //                               left: defaultMargin,
          //                               right: defaultMargin),
          //                           child: AssetListItem(
          //                               itemWidth: assetListWidth,
          //                               asset: state.assets[index]),
          //                         ))
          //                     : Container(
          //                         child: Center(
          //                           child: SizedBox(
          //                             child: CircularProgressIndicator(),
          //                           ),
          //                         ),
          //                       ),
          //           )
          //         : Center(child: loadingIndicator)),
        )
      ])
    ]);
  }
}

class BarangSearch extends SearchDelegate<Asset> {
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
  Widget buildSuggestions(BuildContext context) {}
}
