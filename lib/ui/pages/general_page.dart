part of 'pages.dart';

class GeneralPage extends StatelessWidget {
  final String title;
  final Function onBackButtonPressed;
  final Function onSearch;
  final Function onLogout;
  final Widget child;
  final Color backColor;

  const GeneralPage(
      {Key key,
      this.title = "Dashboard",
      this.onBackButtonPressed,
      this.onSearch,
      this.onLogout,
      this.backColor,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: kBackgroundColor,
          ),
          SafeArea(child: Container(color: backColor ?? kBackgroundColor)),
          SafeArea(
              child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    width: double.infinity,
                    height: size.height * 0.1,
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            onBackButtonPressed != null
                                ? GestureDetector(
                                    onTap: () {
                                      if (onBackButtonPressed != null) {
                                        onBackButtonPressed();
                                      }
                                    },
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      margin: EdgeInsets.only(right: 20),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/back_arrow.png'),
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                            Container(
                              child: Text(
                                title,
                                style: titleFontStyle0,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            onSearch != null
                                ? GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      margin: EdgeInsets.only(right: 16),
                                      child: Stack(
                                        children: [
                                          SvgPicture.asset('assets/search.svg',
                                              color:
                                                  blackColor.withOpacity(0.6))
                                        ],
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                            onLogout != null
                                ? GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      child: Stack(
                                        children: [
                                          SvgPicture.asset('assets/logout.svg',
                                              color:
                                                  blackColor.withOpacity(0.6))
                                        ],
                                      ),
                                    ),
                                  )
                                : SizedBox()
                          ],
                        ),
                      ],
                    ),
                  ),
                  child ?? SizedBox()
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
