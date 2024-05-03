import 'package:bigo/screens/Arabic/arabic%20category.dart';
import 'package:bigo/screens/Arabic/letters_arabic.dart';
import 'package:bigo/screens/Home.dart';
import 'package:bigo/screens/LOGIN.dart';
import 'package:bigo/screens/SIGNUP.dart';
import 'package:bigo/screens/SPLASH.dart';
import 'package:bigo/screens/auth.dart';
import 'package:bigo/screens/model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  initState(){
    getImageAndFolderName();
    super.initState();
  }
  getImageAndFolderName()async{
    var ref = await FirebaseStorage.instance.ref().list();
    ref.items.forEach((element) {
      print('===================');
      print(element.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        routes: {
          'Splash': (context) => Splash(),
          'Auth':(context)=>Auth(),
          'login': (context) => Login(),
          'signup': (context) => Resgister(),
          'Home': (context) => Home(),
          'model': (context) => model(),
          'arabic_cat': (context) => Arabic_cat(),
          'letters': (context) => letters(),
        },
        debugShowCheckedModeBanner: false,
        home:letters(),
      ),
    );
  }
}


