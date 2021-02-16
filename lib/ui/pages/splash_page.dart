part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 433,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/bottom_logo.png"))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    child: Image.asset("assets/images/logo.png"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text("Find Cozy House\nto Stay and Happy",
                      style: blackTextFont),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Stop membuang banyak waktu\npada tempat yang tidak habitable",
                    style: greyTextFont,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 210,
                    height: 50,
                    child: RaisedButton(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17)),
                        color: purpleColor,
                        child: Text(
                          "Explore Now",
                          style: whiteTextFont,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                          
                        }),
                  ),
                  SizedBox(
                    height: 23,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
