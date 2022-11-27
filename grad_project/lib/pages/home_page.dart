import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'booking.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => new _HomePageState();
}

List<String> Laboratories = [
  "Professional ",
  "Al-Najah ",
  "MedLabs",
  "Medicare",
  "Ajyal Lab"
];
List<String> phone_Lab = [
  "092396420",
  "092396420",
  "092396420",
  "092396420",
  "092396420"
];
List<String> Location = [
  "Nablus-R",
  "Nablus-R",
  "Nablus-R",
  "Nablus-R",
  "Nablus-R",
];
List l = [0, 1, 2, 3, 4];

class _HomePageState extends State<HomePage> {
  int _page = 0;

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 159, 198, 223),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 159, 198, 223),
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
        elevation: 1,
        title: Container(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.065,
            // child: Image.asset(
            //   'assets/images/hemog_black.jpg',
            //   fit: BoxFit.cover,
            // ),
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        height: 60.0,
        index: 2,
        items: <Widget>[
          Icon(Icons.attach_money_rounded, size: 32),
          Icon(Icons.article, size: 30),
          Icon(Icons.home, size: 30),
          Icon(Icons.location_on, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 159, 198, 223),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.06),
              child: Text(
                'Laboratories',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: MediaQuery.of(context).size.width * 0.052,
                  letterSpacing: 0.5,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: <Widget>[
                for (int i in l)
                  Laboratory(context, MediaQuery.of(context).size, i),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget Laboratory(BuildContext context, Size size, int i) {
    return Padding(
        padding: EdgeInsets.only(left: size.height * 0.03),
        child: Stack(
          children: [
            Container(
              width: size.width * 0.7,
              height: size.height * 0.12,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(1.1, 4.0),
                      blurRadius: 8.0),
                ],
              ),
              child: Stack(children: <Widget>[
                // Big light background
                Positioned(
                  right: 170,
                  top: 0,
                  bottom: 0,
                  left: 2,
                  child: Container(
                    width: size.width * 0.5,
                    height: size.height * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      color: Color.fromARGB(255, 253, 250, 250),
                    ),
                    child: Image.asset(
                      'assets/images/hemog_blackk.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                Positioned(
                  // right: 10,
                  left: 100,
                  top: 2,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            Laboratories[i],
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.007),
                          Text(
                            Location[i],
                            style: TextStyle(
                                color: Color.fromARGB(255, 9, 78, 153),
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.035,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Row(children: [
                            Text(
                              phone_Lab[i],
                              style: TextStyle(
                                  color: Color.fromARGB(255, 9, 78, 153),
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.035,
                                  fontWeight: FontWeight.w600),
                            ),
                            Padding(padding: EdgeInsets.only(left: 30)),
                            Container(
                              alignment: Alignment.topCenter,
                              height:
                                  MediaQuery.of(context).size.height * 0.032,
                              width: MediaQuery.of(context).size.width * 0.12,
                              //margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  color: Color(0xFFFB475F).withOpacity(.65)),
                              child: Padding(
                                  padding: EdgeInsets.only(bottom: 1),
                                  child: IconButton(
                                    alignment: Alignment.topCenter,
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 12,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Booking_page()));
                                      setState(() {});
                                    },
                                  )),
                            ),
                          ]),
                        ]),
                  ),
                ),
              ]),
            ),
          ],
        ));
  }
}
