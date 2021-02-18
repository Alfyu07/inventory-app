part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: kBackgroundColor),
          SafeArea(
            child: Container(color: kBackgroundColor),
          ),
          SafeArea(
              child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                selectedPage = index;
              });
              pageController.jumpToPage(selectedPage);
            },
            children: [
              Center(
                child: DashboardPage(),
              ),
              Center(
                child: AddAssetPage(),
              ),
              Center(
                child: ScanQRPage(),
              )
            ],
          )),
          Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomNavbar(
                selectedIndex: selectedPage,
                onTap: (index) {
                  setState(() {
                    selectedPage = index;
                  });
                  pageController.jumpToPage(selectedPage);
                },
              )),
        ],
      ),
    );
  }
}
