part of 'widgets.dart';

class OverviewCard extends StatelessWidget {
  final int jumlahAsset;
  final int barangBaru;

  const OverviewCard({Key key, this.jumlahAsset = 120, this.barangBaru = 32})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: 150,
              height: 150,
              padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin, vertical: defaultMargin),
              decoration: BoxDecoration(
                  color: mainColor0, borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/chart-pie-slice-fill.svg',
                    width: 20,
                    color: Colors.white,
                  ),
                  Text(jumlahAsset.toString(),
                      style: GoogleFonts.poppins(
                          fontSize: 35, color: Colors.white)),
                  Text(
                    'Jumlah Asset',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.clip,
                  )
                ],
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              margin: EdgeInsets.only(),
              width: 150,
              height: 150,
              padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin, vertical: defaultMargin),
              decoration: BoxDecoration(
                  color: mainColor1, borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/chart-pie-slice-fill.svg',
                    width: 20,
                    color: Colors.white,
                  ),
                  Text(barangBaru.toString(),
                      style: GoogleFonts.poppins(
                          fontSize: 35, color: Colors.white)),
                  Text(
                    'Barang Baru',
                    style:
                        GoogleFonts.poppins(fontSize: 14, color: Colors.white),
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
