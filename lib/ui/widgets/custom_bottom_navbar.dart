part of 'widgets.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;

  const CustomBottomNavbar({Key key, this.selectedIndex = 1, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(0);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              child: Stack(
                children: [
                  (selectedIndex == 0)
                      ? SvgPicture.asset('assets/house.svg',
                          width: 40, color: mainColor0)
                      : SvgPicture.asset('assets/house.svg',
                          width: 40, color: blackColor.withOpacity(0.3))
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(1);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              child: Stack(
                children: [
                  (selectedIndex == 1)
                      ? SvgPicture.asset(
                          'assets/plus.svg',
                          width: 40,
                          color: mainColor0,
                        )
                      : SvgPicture.asset(
                          'assets/plus.svg',
                          width: 40,
                          color: blackColor.withOpacity(0.3),
                        )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(2);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              child: Stack(
                children: [
                  (selectedIndex == 2)
                      ? SvgPicture.asset(
                          'assets/qr_code_scanner-24px.svg',
                          width: 40,
                          color: mainColor0,
                        )
                      : SvgPicture.asset(
                          'assets/qr_code_scanner-24px.svg',
                          width: 40,
                          color: blackColor.withOpacity(0.3),
                        )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
