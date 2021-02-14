part of 'widgets.dart';

class AssetListItem extends StatelessWidget {
  final Barang barang;
  final double itemWidth;

  const AssetListItem({Key key, this.barang, this.itemWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                image: NetworkImage(barang.picturePath), fit: BoxFit.cover),
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
                    barang.name,
                    style: blackFontStyle0,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                  AssetConditionIndicator(barang: barang)
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
