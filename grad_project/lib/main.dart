import 'package:flutter/material.dart';
import 'package:grad_project/pages/booking.dart';
import 'package:grad_project/pages/home_page.dart';
import 'package:grad_project/pages/login_page.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/services.dart';

import 'pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(LoginUiApp()));
}

class LoginUiApp extends StatelessWidget {
  Color _primaryColor = Color.fromARGB(255, 181, 217, 240);
  Color _accentColor = Color.fromARGB(255, 159, 198, 223);

  // Design color
  // Color _primaryColor= HexColor('##0b0421');
  // Color _accentColor= HexColor('#FF3CBD');

  // Our Logo Color
  // Color _primaryColor= HexColor('#D44CF6');
  // Color _accentColor= HexColor('#5E18C8');

  // Our Logo Blue Color
  //Color _primaryColor= HexColor('#651BD2');
  //Color _accentColor= HexColor('#320181');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hemoglobin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
      home: SplashScreen(title: 'Hemoglobin'),
    );
  }
}
