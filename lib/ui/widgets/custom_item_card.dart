part of 'widgets.dart';

class CustomItemCard extends StatelessWidget {
  final Barang barang;

  const CustomItemCard({Key key, this.barang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Stack(
        overflow: Overflow.clip,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Container(
              width: 62,
              height: 62,
              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(//image url
                      barang.picturePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 7.5,
            left: 74.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    barang.name,
                    style: blackFontStyle0,
                  ),
                  Container(
                    child: (barang.condition.toLowerCase() == 'bagus')
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text('Bagus',
                                    style: blackFontStyle2.copyWith(
                                        color: successColor)),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text('Rusak',
                                    style: blackFontStyle2.copyWith(
                                        color: dangerColor)),
                              )
                            ],
                          ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 24,
                height: 24,
                child: Stack(children: [
                  SvgPicture.asset('assets/forward_arrow.svg'),
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
