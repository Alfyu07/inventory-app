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
        borderRadius: BorderRadius.circular(6),
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
              child: (selectedIndex == 0)
                  ? Icon(Icons.home_rounded, color: mainColor1, size: 32)
                  : Icon(Icons.home_rounded,
                      color: blackColor.withOpacity(0.3), size: 32),
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
                child: (selectedIndex == 1)
                    ? Icon(Icons.add_box_rounded, color: mainColor1, size: 32)
                    : Icon(Icons.add_box_rounded,
                        color: blackColor.withOpacity(0.3), size: 32)),
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
              child: (selectedIndex == 2)
                  ? Icon(Icons.qr_code_scanner_rounded,
                      color: mainColor1, size: 32)
                  : Icon(Icons.qr_code_scanner_rounded,
                      color: blackColor.withOpacity(0.3), size: 32),
            ),
          )
        ],
      ),
    );
  }
}
