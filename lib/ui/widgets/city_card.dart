part of 'widgets.dart';

class CityCard extends StatelessWidget {
  final City city;
  CityCard(this.city);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        width: 120,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.only(bottom: 13),
                  height: 148,
                  width: 120,
                  color: Color(0xffF6F7F8),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(city.title,
                        style: blackTextFont.copyWith(
                          fontSize: 16,
                        )),
                  ),
                )),
            Image.asset(
              city.imageUrl,
              height: 102,
              width: 120,
            ),
            (city.isPopular)
                ? Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                        color: purpleColor,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(30)),
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/ic_star.png",
                          width: 22,
                          height: 22,
                        ),
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
