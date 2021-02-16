part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int isSelectedItemIndex;

  @override
  void initState() {
    super.initState();
    isSelectedItemIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Stack(
          children: [
            ListView(
              children: [
                //NOTE: HEADER
                SizedBox(
                  height: defaultMargin,
                ),
                Text(
                  "Explore Now",
                  style: blackTextFont,
                ),
                SizedBox(
                  height: 2,
                ),
                Text("Mencari kosan yang cozy", style: greyTextFont),
                SizedBox(height: 30),
                Text("Popular Cities",
                    style: blackTextFont.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 16,
                ),
                // NOTE: POPULAR CITIES
                Container(
                  height: 150,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      CityCard(City(
                          id: 1,
                          title: "Jakarta",
                          imageUrl: "assets/images/city1.png")),
                      SizedBox(
                        width: 20,
                      ),
                      CityCard(City(
                          id: 1,
                          title: "Bandung",
                          isPopular: true,
                          imageUrl: "assets/images/city2.png")),
                      SizedBox(
                        width: 20,
                      ),
                      CityCard(City(
                          id: 1,
                          title: "Surabaya",
                          imageUrl: "assets/images/city3.png")),
                      SizedBox(
                        width: 20,
                      ),
                      CityCard(City(
                          id: 1,
                          title: "Lombok",
                          isPopular: true,
                          imageUrl: "assets/images/city4.png")),
                      SizedBox(
                        width: 20,
                      ),
                      CityCard(City(
                          id: 1,
                          title: "Aceh",
                          imageUrl: "assets/images/city5.png")),
                      SizedBox(
                        width: 20,
                      ),
                      CityCard(City(
                          id: 1,
                          title: "Palembang",
                          imageUrl: "assets/images/city6.png")),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text("Recommended Space",
                      style: blackTextFont.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w400)),
                ),
                SizedBox(
                  height: 16,
                ),
                // NOTE: RECOMMENDED SPACE
                FutureBuilder(
                    future: FetchServices.getSpaces(),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        List<Space> space = snapshot.data;
                        int index = 0;

                        return Column(
                            children: space.map((e) {
                          index++;
                          return Container(
                              margin: EdgeInsets.only(top: index == 1 ? 0 : 20),
                              child: SpaceCard(e, index));
                        }).toList());
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: purpleColor,
                          ),
                        );
                      }
                    }),
                SizedBox(height: 30),
                Text("Tips & Guidance",
                    style: blackTextFont.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 16,
                ),
                // NOTE: TIPS & GUIDANCE
                Column(
                  children: [
                    Row(
                      children: [
                        TipsCard(Tips(
                            id: 1,
                            image: "assets/images/ic_tips1.png",
                            title: "City Guidelines",
                            updateAt: "20 April")),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TipsCard(Tips(
                        id: 2,
                        image: "assets/images/ic_tips2.png",
                        title: "Jakarta Fairship",
                        updateAt: "11 August")),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
            //NOTE: BOTTOM NAVIGATION BAR
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                        color: Color(0xffF6F7F8),
                        borderRadius: BorderRadiusDirectional.circular(23)),
                    height: 65,
                    width:
                        MediaQuery.of(context).size.width - 2 * defaultMargin,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        createBottomNavBar(
                          icon: isSelectedItemIndex == 0
                              ? "assets/images/ic_home.png"
                              : "assets/images/ic_home_grey.png",
                          index: 0,
                        ),
                        createBottomNavBar(
                          icon: isSelectedItemIndex == 1
                              ? "assets/images/ic_mail.png"
                              : "assets/images/ic_mail_grey.png",
                          index: 1,
                        ),
                        createBottomNavBar(
                          icon: isSelectedItemIndex == 2
                              ? "assets/images/ic_card.png"
                              : "assets/images/ic_card_grey.png",
                          index: 2,
                        ),
                        createBottomNavBar(
                          icon: isSelectedItemIndex == 3
                              ? "assets/images/ic_love.png"
                              : "assets/images/ic_love_grey.png",
                          index: 3,
                        )
                      ],
                    ))),
          ],
        ),
      )),
    );
  }

  Widget createBottomNavBar({String icon, int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelectedItemIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: 19,
        ),
        Image.asset(
          icon,
          width: 26,
          height: 26,
        ),
        SizedBox(
          height: 18,
        ),
        (index == isSelectedItemIndex)
            ? Container(
                height: 2,
                width: 30,
                decoration: BoxDecoration(
                    color: purpleColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(1000),
                        topRight: Radius.circular(1000))),
              )
            : Container()
      ]),
    );
  }
}
