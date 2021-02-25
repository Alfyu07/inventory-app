part of 'widgets.dart';

class AssetConditionIndicator extends StatelessWidget {
  final Asset asset;
  const AssetConditionIndicator({
    this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (asset.condition.toLowerCase() == 'bagus')
          ? Row(
              children: [
                Container(
                    width: 20,
                    height: 20,
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          'assets/up_arrow_in_circle.svg',
                          color: successColor,
                        )
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Bagus',
                      style: blackFontStyle2.copyWith(color: successColor)),
                ),
              ],
            )
          : Row(
              children: [
                Container(
                    width: 20,
                    height: 20,
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          'assets/down_arrow_in_circle.svg',
                          color: dangerColor,
                        )
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Rusak',
                      style: blackFontStyle2.copyWith(color: dangerColor)),
                )
              ],
            ),
    );
  }
}
