part of 'widgets.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;

  TipsCard(this.tips);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tips.image,
          width: 80,
          height: 80,
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width -
                  2 * defaultMargin -
                  80 -
                  16 - 24,
              child: Text(
                tips.title,
                maxLines: 2,
                overflow: TextOverflow.clip,
                style: blackTextFont.copyWith(fontSize: 18),
              ),
            ),
            Text("Updated " + tips.updateAt,
                style: greyTextFont.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w300))
          ],
        ),
        Image.asset(
          "assets/images/ic_forward.png",
          height: 24,
          width: 24,
        ),
      ],
    );
  }
}
