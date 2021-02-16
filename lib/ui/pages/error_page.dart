part of 'pages.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/404.png", height: 85, width: 300),
            SizedBox(height: 70),
            Text("Where are you going?", style: blackTextFont),
            SizedBox(height: 14),
            Text("Seems like the page that you were\nrequested is already gone",
                textAlign: TextAlign.center,
                style: greyTextFont.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w300)),
            SizedBox(height: 50),
            Container(
                height: 50,
                width: 210,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17)),
                    color: purpleColor,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text("Back Home",
                        style: whiteTextFont.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w500))))
          ],
        )),
      ),
    );
  }
}
