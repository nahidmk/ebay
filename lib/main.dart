import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/provider/firebase_crud_provider.dart';
import 'package:untitled1/provider/profile_provider.dart';
import 'package:untitled1/screen/home_page_screen.dart';
import 'package:untitled1/screen/init_screen.dart';



 void main() async {

   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => FirebaseCrudProvider()),
      ],
      child: EveayApp(),
    );
  }
}

class EveayApp extends StatelessWidget {
  const EveayApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evey',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const InitScreen(),
    );
  }
}

