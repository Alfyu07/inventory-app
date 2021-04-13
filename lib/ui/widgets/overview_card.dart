part of 'widgets.dart';

class OverviewCard extends StatelessWidget {
  final int jumlahAsset;
  final int barangBaru;

  const OverviewCard({Key key, this.jumlahAsset = 120, this.barangBaru = 32})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: 136,
            padding: EdgeInsets.symmetric(
                horizontal: defaultMargin, vertical: defaultMargin),
            decoration: BoxDecoration(
                color: mainColor0, borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/chart-pie-slice-fill.svg',
                  width: 20,
                  color: Colors.white,
                ),
                Text(jumlahAsset.toString(),
                    style:
                        GoogleFonts.poppins(fontSize: 24, color: Colors.white)),
                Text(
                  'Jumlah Asset',
                  style: blackFontStyle1.copyWith(color: Colors.white),
                  overflow: TextOverflow.clip,
                )
              ],
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            margin: EdgeInsets.only(),
            width: MediaQuery.of(context).size.width * 0.4,
            height: 136,
            padding: EdgeInsets.symmetric(
                horizontal: defaultMargin, vertical: defaultMargin),
            decoration: BoxDecoration(
                color: mainColor1, borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/chart-pie-slice-fill.svg',
                  width: 20,
                  color: Colors.white,
                ),
                Text(barangBaru.toString(),
                    style:
                        GoogleFonts.poppins(fontSize: 24, color: Colors.white)),
                Text(
                  'Barang Baru',
                  style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
