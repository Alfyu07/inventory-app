part of 'pages.dart';

class IllustrationPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String picturePath;
  final String buttonTitle1;
  final String buttonTitle2;
  final Function buttonTap1;
  final Function buttonTap2;

  const IllustrationPage(
      {Key key,
      @required this.title,
      this.subtitle,
      @required this.picturePath,
      @required this.buttonTitle1,
      @required this.buttonTap1,
      this.buttonTitle2,
      this.buttonTap2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(picturePath)))),
          Text(title, style: blackFontStyle0.copyWith(fontSize: 20)),
          Text(subtitle,
              style: greyFontStyle.copyWith(fontWeight: FontWeight.w300),
              textAlign: TextAlign.center),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 12),
            width: 200,
            height: 45,
            child: RaisedButton(
              onPressed: buttonTap1,
              color: mainColor0,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                buttonTitle1,
                style: whiteLabelStyle.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          (buttonTap2 == null)
              ? SizedBox()
              : SizedBox(
                  width: 200,
                  height: 45,
                  child: RaisedButton(
                    onPressed: buttonTap2,
                    color: '8D92A3'.toColor(),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      buttonTitle2 ?? 'title',
                      style: whiteLabelStyle.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
