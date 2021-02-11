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
                    padding: EdgeInsets.only(left: defaultMargin),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.1,
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                                      image:
                                          AssetImage('assets/back_arrow.png'),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(),
                        Container(
                          padding: EdgeInsets.only(right: 130),
                          child: Text(
                            title,
                            style: titleFontStyle0,
                          ),
                        ),
                        onSearch != null
                            ? GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  margin: EdgeInsets.only(right: 16),
                                  child: Stack(
                                    children: [
                                      SvgPicture.asset('assets/search.svg')
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
                                      SvgPicture.asset('assets/logout.svg')
                                    ],
                                  ),
                                ),
                              )
                            : SizedBox()
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
