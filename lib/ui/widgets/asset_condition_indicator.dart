part of 'widgets.dart';

class AssetConditionIndicator extends StatelessWidget {
  final String condition;
  const AssetConditionIndicator({
    this.condition,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (condition.toLowerCase() == 'bagus')
          ? Row(
              children: [
                Container(
                    width: 28,
                    height: 28,
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          'assets/arrow-up-circle.svg',
                          width: 28,
                          color: mainColor2,
                        )
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Bagus',
                      style: blackFontStyle2.copyWith(color: mainColor2)),
                ),
              ],
            )
          : Row(
              children: [
                Container(
                    width: 28,
                    height: 28,
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          'assets/arrow-down-circle.svg',
                          width: 28,
                          color: greyColor1,
                        )
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Rusak',
                      style: blackFontStyle2.copyWith(color: greyColor1)),
                )
              ],
            ),
    );
  }
}
