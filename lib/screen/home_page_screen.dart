import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/provider/profile_provider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Signin'),
      ),
      body: Container(

        padding: const EdgeInsets.all(10),
        child: MaterialButton(
          color: Colors.white,
          child: const Text('Logout'),
          onPressed: (){
            profileProvider.signOut();
          },
        ),

      ),
    );
  }
}
