part of 'pages.dart';

class SpaceDetailPage extends StatefulWidget {
  final Space space;

  SpaceDetailPage(this.space);

  @override
  _SpaceDetailPageState createState() => _SpaceDetailPageState();
}

class _SpaceDetailPageState extends State<SpaceDetailPage> {
  bool isFavorite = false;
  @override
  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ErrorPage()));
      }
    }

    handleBook(Space space) async {
      return showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: Text(
                  "Konfirmasi",
                  style: blackTextFont,
                ),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      Text("Apakah kamu ingin menghubungi bapak kos?",
                          style: blackTextFont.copyWith(fontSize: 18))
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Nanti",
                        style: greyTextFont.copyWith(fontSize: 14)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      launchUrl("tel:${space.phone}");
                    },
                    child: Text(
                      "Hubungi",
                      style: greyTextFont.copyWith(
                          fontSize: 14, color: purpleColor),
                    ),
                  )
                ],
              ));
    }

    return WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          return;
        },
        child: Scaffold(
            body: Stack(
          children: [
            // NOTE: IMAGE BACKDROP
            Image.network(
              widget.space.image,
              width: double.infinity,
              height: 350,
              fit: BoxFit.cover,
            ),
            // NOTE: ICON BACK
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/images/btn_back.png",
                      width: 40,
                      height: 40,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Image.asset(
                      !isFavorite
                          ? "assets/images/btn_wishlist.png"
                          : "assets/images/btn_wishlist_fill.png",
                      width: 40,
                      height: 40,
                    ),
                  )
                ],
              ),
            ),
            // NOTE: DETAILS SPACE
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(0, 328, 0, 0),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.space.title,
                              style: blackTextFont.copyWith(
                                  fontSize: 22, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text.rich(TextSpan(
                                text: "\$" + widget.space.price.toString(),
                                style: whiteTextFont.copyWith(
                                    color: purpleColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                                children: [
                                  TextSpan(
                                      text: " / month",
                                      style: greyTextFont.copyWith(
                                          fontWeight: FontWeight.w300))
                                ]))
                          ],
                        ),
                        Row(
                          children: [1, 2, 3, 4, 5]
                              .map((e) => e <= widget.space.rating
                                  ? Image.asset(
                                      "assets/images/ic_star.png",
                                      width: 20,
                                      height: 20,
                                    )
                                  : Image.asset(
                                      "assets/images/ic_star_grey.png",
                                      width: 20,
                                      height: 20,
                                    ))
                              .toList(),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Main Facilities",
                        style: blackTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(children: [
                          Image.asset("assets/images/ic_kitchen.png",
                              width: 32, height: 32),
                          SizedBox(
                            height: 8,
                          ),
                          Text.rich(TextSpan(
                              text: widget.space.numberOfKitchen.toString(),
                              style: whiteTextFont.copyWith(
                                  color: purpleColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                              children: [
                                TextSpan(
                                    text: " kitchen",
                                    style: greyTextFont.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300))
                              ]))
                        ]),
                        Column(children: [
                          Image.asset("assets/images/ic_bedroom.png",
                              width: 32, height: 32),
                          SizedBox(
                            height: 8,
                          ),
                          Text.rich(TextSpan(
                              text: widget.space.numberOfbedroom.toString(),
                              style: whiteTextFont.copyWith(
                                  color: purpleColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                              children: [
                                TextSpan(
                                    text: " Bedroom",
                                    style: greyTextFont.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300))
                              ]))
                        ]),
                        Column(children: [
                          Image.asset("assets/images/ic_cupboard.png",
                              width: 32, height: 32),
                          SizedBox(
                            height: 8,
                          ),
                          Text.rich(TextSpan(
                              text: widget.space.numberOfCupboard.toString(),
                              style: whiteTextFont.copyWith(
                                  color: purpleColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                              children: [
                                TextSpan(
                                    text: " Big Lemari",
                                    style: greyTextFont.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300))
                              ]))
                        ]),
                      ],
                    ),
                    SizedBox(height: 30),
                    // NOTE: PHOTOS
                    Text("Photos",
                        style: blackTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                    SizedBox(height: 12),
                    SizedBox(
                        height: 88,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.space.photo.length,
                            itemBuilder: (_, i) {
                              if (widget.space.photo != null) {
                                return Container(
                                    margin:
                                        EdgeInsets.only(left: i == 0 ? 0 : 18),
                                    child: PhotosCard(
                                        icon: widget.space.photo[i]));
                              } else {
                                return CircularProgressIndicator(
                                  backgroundColor: purpleColor,
                                );
                              }
                            })),
                    SizedBox(height: 30),
                    Text("Location",
                        style: blackTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                    SizedBox(height: 6),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.space.address,
                                  maxLines: 2,
                                  style: greyTextFont.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)),
                              SizedBox(
                                height: 2,
                              ),
                              Text(widget.space.city,
                                  maxLines: 2,
                                  style: greyTextFont.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                          InkWell(
                            onTap: () => launchUrl(widget.space.mapUrl),
                            child: Image.asset(
                              "assets/images/ic_maps.png",
                              height: 40,
                              width: 40,
                            ),
                          )
                        ]),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 50,
                      width:
                          MediaQuery.of(context).size.width - 2 * defaultMargin,
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17)),
                          color: purpleColor,
                          child:
                              Text("Book Now", style: whiteTextFont.copyWith()),
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => ErrorPage()));
                            handleBook(widget.space);
                          }),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            )
          ],
        )));
  }
}
