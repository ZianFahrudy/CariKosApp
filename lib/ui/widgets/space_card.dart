part of 'widgets.dart';

class SpaceCard extends StatelessWidget {
  final Space space;
  final int index;

  SpaceCard(this.space, this.index);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SpaceDetailPage(space)));
      },
      child: Row(
        children: [
          Container(
            height: 110,
            width: 130,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.network(
                    space.image,
                    height: 110,
                    width: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                      color: purpleColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          topRight: Radius.circular(18)),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/ic_star.png",
                            width: 18,
                            height: 18,
                          ),
                          Text(
                            "${space.rating}/5",
                            style: whiteTextFont.copyWith(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width -
                    2 * defaultMargin -
                    20 -
                    130,
                child: Text(
                  space.title,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  style: blackTextFont.copyWith(fontSize: 18),
                ),
              ),
              Text.rich(
                TextSpan(
                    text: "\$" + space.price.toString(),
                    style: greyTextFont.copyWith(color: purpleColor),
                    children: [
                      TextSpan(text: " / month", style: greyTextFont),
                    ]),
              ),
              Text(
                "${space.city}, ${space.country}",
                style: greyTextFont.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w300),
              ),
            ],
          )
        ],
      ),
    );
  }
}
