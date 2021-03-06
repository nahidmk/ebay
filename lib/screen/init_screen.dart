import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/provider/profile_provider.dart';
import 'package:untitled1/screen/user_form_screen.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  SharedPreferences? prefs;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      ProfileProvider profileProvider =
          Provider.of<ProfileProvider>(context, listen: false);
      profileProvider.autoLogin();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);

    return UserFormScreen();
  }
}
