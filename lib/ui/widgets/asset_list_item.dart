part of 'widgets.dart';

class AssetListItem extends StatelessWidget {
  final Asset asset;
  final double itemWidth;

  const AssetListItem({Key key, this.asset, this.itemWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(
                image: NetworkImage(
                    "https://inventory-lpp.herokuapp.com/storage/" +
                        asset.picturePath),
                // image: NetworkImage(asset.picturePath),
                fit: BoxFit.cover),
          ),
        ),
        SizedBox(
          width: itemWidth - 60 - 12, //,
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    asset.name,
                    style: blackFontStyle0,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                  AssetConditionIndicator(condition: asset.condition)
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
