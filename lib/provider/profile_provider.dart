import 'package:firebase_auth/firebase_auth.dart' as Firebse;
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/helper/constant.dart';
import 'package:untitled1/model/user.dart';

class ProfileProvider extends ChangeNotifier{

  User profile = User();

  setProfile(User value){
    profile = value;
    notifyListeners();
  }

  bool _googleSignInLoading = false;

  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  set isAuthenticated(bool value) {
    _isAuthenticated = value;
    notifyListeners();
  }

  bool get googleSignInLoading => _googleSignInLoading;

  set googleSignInLoading(bool value) {
    _googleSignInLoading = value;
    notifyListeners();
  }

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);


  void signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(AUTH_TOKEN);
    Firebse.FirebaseAuth.instance.signOut();
    GoogleSignIn _googleSignIn =  GoogleSignIn();
    _googleSignIn.signOut();
  }

  void autoLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString(AUTH_TOKEN)!=null){
      isAuthenticated = true;
    }
  }

  Future<bool> socialMediaSignIn() async {
    try {
      googleSignInLoading = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
        final Firebse.AuthCredential authCredential = Firebse.GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        Firebse.FirebaseAuth auth = Firebse.FirebaseAuth.instance;
        final result = await auth.signInWithCredential(authCredential);
        final token = await result.user!.getIdToken(true);

        if (result != null) {
         profile = User(
           email: result.user!.email??"",
           imageUrl: result.user!.photoURL??"",
           name: result.user!.displayName??"",
         );

         print('profile===>${profile.name}');
          prefs.setString(AUTH_TOKEN, token);
          googleSignInLoading = false;
          isAuthenticated = true;
         return true;
        }
      }
      googleSignInLoading = false;
      return false;
    } catch (error) {
      googleSignInLoading = false;

      return false;
    }
  }




}