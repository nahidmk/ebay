//SignInScreen

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/provider/profile_provider.dart';
import 'package:untitled1/screen/home_page_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.red,
            ],
          ),
        ),
        child: Card(
          margin:
              const EdgeInsets.only(top: 200, bottom: 200, left: 30, right: 30),
          elevation: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Welcome to evey",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: profileProvider.googleSignInLoading
                    ? const Center(
                        child: CupertinoActivityIndicator(),
                      )
                    : MaterialButton(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/google.svg',
                              height: 25,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text('Sign in with google'),
                          ],
                        ),
                        onPressed: () async {
                          bool status =
                              await profileProvider.socialMediaSignIn();
                          if (status) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => HomePageScreen()));
                          }
                        },
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
