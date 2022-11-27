import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:grad_project/pages/home_page.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/cupertino.dart';

import '../common/theme_helper.dart';

class Booking_page extends StatefulWidget {
  const Booking_page({Key? key}) : super(key: key);
  @override
  _Booking_pageState createState() => new _Booking_pageState();
}

class _Booking_pageState extends State<Booking_page> {
  @override
  List<String> med_analysis = [
    'Afghanistan',
    'Turkey',
    'Germany',
    'France',
    'Italy',
    'Spain',
    'United Kingdom',
    'United States',
    'Canada',
    'Australia',
    'New Zealand',
    'India',
    'Indonesia',
    'Bangladesh',
    'Sri Lanka',
  ];
  DateTime today = DateTime.now();
  bool select = false;
  bool select_t = false;
  String time = "";
  DateTime _setDate = DateTime.now();
  Duration initialtimer = new Duration();
  int selectitem = 1;
  void _onDaySelected(DateTime focused, DateTime day) {
    setState(() {
      select = true;
      today = day;
    });
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 159, 198, 223),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 159, 198, 223),
        //toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: 10),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.065,
            child: Image.asset(
              'assets/images/hemog_black.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(1.1, 4.0),
                blurRadius: 8.0),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.07),
                child: Text(
                  'Appointment Booking',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: MediaQuery.of(context).size.width * 0.055,
                    letterSpacing: 0.5,
                    color: Color.fromARGB(255, 15, 15, 15),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 70),
                child: Text('Select a Medical Analysis from the list:',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.width * 0.042,
                      color: Color.fromARGB(255, 9, 78, 153),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(right: 60, top: 10, left: 15),
                child: DropdownSearch<String>(
                  mode: Mode.MENU,
                  showSearchBox: true,
                  items: med_analysis,
                  selectedItem: med_analysis[0],
                  onSaved: (value) {
                    selectedItem:
                    value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 260,
                  top: 20,
                ),
                child: Text('Select Date:',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.width * 0.042,
                      color: Color.fromARGB(255, 9, 78, 153),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20, top: 10, left: 15),
                child: TableCalendar(
                  locale: "en_US",
                  headerStyle: HeaderStyle(
                      formatButtonVisible: false, titleCentered: true),
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) => isSameDay(day, today),
                  firstDay: DateTime.now(),
                  focusedDay: today,
                  lastDay: DateTime.utc(2023, 12, 31),
                  onDaySelected: _onDaySelected,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                child: select
                    ? Text(
                        "Selected Date is: " + today.toString().split(" ")[0],
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          color:
                              Color.fromARGB(255, 128, 27, 40).withOpacity(.9),
                        ),
                      )
                    : null,
              ),
              ElevatedButton(
                onPressed: () {
                  bottomSheet(context, timePicker());
                },
                style: ThemeHelper().buttonStyle(),
                child: Text('SELECT TIME'),
              ),
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                child: select_t
                    ? Text(
                        "Selected Time  is: " + time,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          color:
                              Color.fromARGB(255, 128, 27, 40).withOpacity(.9),
                        ),
                      )
                    : null,
              ),
              Padding(
                padding: EdgeInsets.only(right: 20, top: 10, left: 15),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(Size(280, 50)),
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 159, 198, 223),
                    ),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: Text('Book'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget timePicker() {
    return CupertinoTimerPicker(
      mode: CupertinoTimerPickerMode.hm,
      minuteInterval: 15,
      initialTimerDuration: initialtimer,
      onTimerDurationChanged: (Duration changedtimer) {
        setState(() {
          select_t = true;
          initialtimer = changedtimer;
          time = changedtimer.inHours.toString() +
              ':' +
              (changedtimer.inMinutes % 60).toString();
        });
      },
    );
  }

  Future<void> bottomSheet(
    BuildContext context,
    Widget child,
  ) {
    return showModalBottomSheet(
        isScrollControlled: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(13), topRight: Radius.circular(13))),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) => Container(
            height: MediaQuery.of(context).size.height / 3, child: child));
  }
}
