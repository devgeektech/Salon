import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:salon/routes/routes_names.dart';
import 'package:salon/utils/user_url.dart';
import 'package:salon/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/repository/apis_repository.dart';
import '../../../utils/commonProgress.dart';
import '../../../utils/toast.dart';
import '../../../view/Authentication/verification.dart';
import 'login_state.dart';
import 'package:fluttertoast/fluttertoast.dart';
//part 'login_state.dart';


class LoginScreenCubit extends Cubit<LoginScreenState> {
  final repository = Repository();
  SharedPreferences? pre;
  String authorizationToken = '';
  String? accesToken;
  String? userID;
  String? email_value;



  LoginScreenCubit() : super(LoginScreenState(
    errorMessage: '',
    loadingState: false,
    isLogin: true,
    showPassword: false,
    showRegisterPassword: false,
    nameController: TextEditingController(),
    emailController: TextEditingController(),
    passwordController: TextEditingController(),
    registerEmailController: TextEditingController(),
    registerPasswordController: TextEditingController(),
    login_formKey: GlobalKey<FormState>(),  // Added form key
    signup_formKey: GlobalKey<FormState>(),
    otpValue: '',
    email: '',
    isSubmitting: false,
    secreen_type: '',
    name: '',// Added form key
  ));

  void toggleAuthMode() {
    emit(state.copyWith(isLogin: !state.isLogin));
  }

  void togglePasswordMode() {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  void toggleRegisterPasswordMode() {
    emit(state.copyWith(showRegisterPassword: !state.showRegisterPassword));
  }


   String? returnEmail() {
    print("returnEmail before === ${state.email}");
    return state.email;

  }

  assignEmail(String email1) {

    print("email before === ${state.email}");
    emit(state.copyWith(emaill: email1));
   // emit(state.copyWith(email: email));


    print("after email=== ${state.email}");
    email_value = state.email;
  }


  @override
  Future<void> close() {
    state.nameController.dispose();
    state.emailController.dispose();
    state.passwordController.dispose();
    state.registerEmailController.dispose();
    state.registerPasswordController.dispose();
    return super.close();
  }

  void setOtpValue(String otpValue) {
    print("otp=========$otpValue ");
    emit(state.copyWith(otp_Value: otpValue));
  }

  loginUser(BuildContext context) {
    emit(state.copyWith(errorMessage: '', loadingState: true));
    Map<String, Object> json = {
      "email": state.emailController.text.toString(),
      "password": state.passwordController.text.toString() ?? '',
    };

    print("loginUser data ===> " + json.toString());

    repository.loginUser(json).then((value) {
      emit(state.copyWith(loadingState: false));
      var deco = jsonDecode(value.body);
      print("loginUser response ===> " + deco.toString());

      if (deco['responseMessage'] == 'Success') {
        accesToken = deco['data']['accessToken'];
        email_value = deco['data']['email'];
        emit(state.copyWith(emaill: deco['data']['email']));
        print("accessToken response ===> " + deco['data']['accessToken']);

        saveAuthToken(deco['data']['accessToken']);
        saveName(deco['data']['name']);
        saveUSerId(deco['data']['_id']);
        saveUSerEmailId(deco['data']['email']);

        emit(state.copyWith(emaill: deco['data']['email'], name: deco['data']['name']));


        print("accesToken ===> $accesToken");
        print("email ===> $email_value");

        Fluttertoast.showToast(msg: deco['responseMessage']);
        Navigator.pushNamedAndRemoveUntil(context, registration_success, (route) => false);
      } else {
        Fluttertoast.showToast(msg: deco['responseMessage']);
        emit(state.copyWith(errorMessage: deco['responseMessage'], loadingState: false));
      }
    });
  }

  signUp(BuildContext context) {

    emit(state.copyWith(emaill: state.registerEmailController.text.toString()));

    emit(state.copyWith(errorMessage: '', loadingState: true));
    Map<String, Object> json = {
      "name": state.nameController.text.toString()!,
      "email": state.registerEmailController.text.toString()!,
      "password": state.registerPasswordController.text.toString() ?? '',
    };

    print("signUp data ===> " + json.toString());

    repository.signUpUser(json).then((value) {
      emit(state.copyWith(loadingState: false));
      var deco = jsonDecode(value.body);

      if (int.parse(deco['responseCode'].toString()) == 200) {

        emit(state.copyWith(secreenType: "register"));

        print("Screen type ===== ${state.secreen_type}");


        Fluttertoast.showToast(msg: deco['responseMessage']);
        Navigator.pushNamed(context, verification);

      } else {
        Fluttertoast.showToast(msg: deco['responseMessage']);
        emit(state.copyWith(errorMessage: deco['responseMessage'], loadingState: false));
      }
    });
  }


  otpVerifiaction(BuildContext context) {
    emit(state.copyWith(errorMessage: '', loadingState: true));
    Map<String, Object> json = {
      "email": state.email!,
      "otp": state.otpValue!,

    };
    print("OtpVerifiaction data ===> " + json.toString());

    repository.verfificationOtp(json).then((value) {
      emit(state.copyWith(loadingState: false));

      var deco = jsonDecode(value.body);
      print("OtpVerifiaction response ===> " + deco.toString());

      if (deco['responseCode'] == 200) {
         accesToken = deco['data']['accessToken'];
         email_value = deco['data']['email'];
         saveAuthToken(deco['data']['accessToken']);
         saveName(deco['data']['name']);
         saveUSerId(deco['data']['_id']);
         saveUSerEmailId(deco['data']['email']);

         emit(state.copyWith(emaill: deco['data']['email'], name: deco['data']['name']));


         print("accesToken ===> $accesToken");
        print("email ===> $email_value");
        Fluttertoast.showToast(msg: deco['responseMessage']);

        final cubit = context.read<LoginScreenCubit>();

        if(cubit.state.secreen_type ==  Utils.forgot_password){

          Navigator.pushNamedAndRemoveUntil(context, reset_password, (route) => false);

        }else{
          Navigator.pushNamedAndRemoveUntil(context, registration_success, (route) => false);
        }

        } else {
        Fluttertoast.showToast(msg: deco['responseMessage']);
        emit(state.copyWith(errorMessage: deco['responseMessage'], loadingState: false));
      }
    });
  }

  ResendOtp(BuildContext context) {
    emit(state.copyWith(errorMessage: '', loadingState: true));
    Map<String, Object> json = {
      "email": state.email!
    };
    print("ResendOtp data ===> " + json.toString());

    repository.ReSendOtp(json).then((value) {
      emit(state.copyWith(loadingState: false));

      var deco = jsonDecode(value.body);
      print("ResendOtp response ===> " + deco.toString());

      if (deco['responseCode'] == 200) {

        Fluttertoast.showToast(msg: deco['responseMessage']);

        /*final cubit = context.read<LoginScreenCubit>();

        if(cubit.state.secreen_type ==  Utils.forgot_password){

          Navigator.pushNamedAndRemoveUntil(context, reset_password, (route) => false);

        }else{
          Navigator.pushNamedAndRemoveUntil(context, registration_success, (route) => false);
        }*/

      } else {
        Fluttertoast.showToast(msg: deco['responseMessage']);
        emit(state.copyWith(errorMessage: deco['responseMessage'], loadingState: false));
      }
    });
  }



  saveAuthToken(String token) async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    pre.setString('token', token);
    authorizationToken = token;
  }

  saveName(String name) async {
    pre?.setString('name', name);
    // getFromShared();
  }

  saveUSerId(String id) async {
    pre?.setString('id', id);
   // getFromShared();
  }
  saveUSerEmailId(String id) async {
    pre?.setString('id', id);
    // getFromShared();
  }

  intiShared() async {
    pre = await SharedPreferences.getInstance();
  }

  getFromShared() {
    userID = pre?.getString('id');
    accesToken = pre?.getString('token');
    email_value = pre?.getString('email');
    print("User $userID");
    print("accesToken== $accesToken");
  }


  //Function to handle Google Login
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();

      if (googleSignInAccount == null) {
        // The user canceled the Google Sign In process.
        return ;
      }

      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      if (context.mounted) LoadingDialog.showLoadingDialog(context);

      // Sign in to Firebase with the Google credentials
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;
      final idToken = await user?.getIdToken(true);


      print("Firebase Token: $idToken");
      if (user != null) {
        LoadingDialog.dismissLoadingDialog(context);
        successSnackBar(context,'Google Sign In Success');
      } else {
        // Google Sign In failed.
        LoadingDialog.dismissLoadingDialog(context);
        errorSnackBar(context,'Error signing in with Google');
      }
    } catch (error) {
      LoadingDialog.dismissLoadingDialog(context);
      errorSnackBar(context,'Error signing in with Google: $error');
    }
  }

  //Function to handle Facebook Login
  Future<void> handleFacebookLogin(BuildContext context) async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final AuthCredential credential = FacebookAuthProvider.credential(accessToken.tokenString);
        // Sign in with Firebase using Facebook credentials
        final UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(credential);
        final User? user = authResult.user;

        LoadingDialog.showLoadingDialog(context);
        if(user != null){
          LoadingDialog.dismissLoadingDialog(context);
          successSnackBar(context,'Facebook Sign In Success');
        }else {
          print('Error signing in with Facebook:');
          LoadingDialog.dismissLoadingDialog(context);
          successSnackBar(context,'Facebook Sign In Failed');
        }
      } else {

      }
    } catch (error) {
      print('Error signing in with Facebook: $error');
    }
  }


}
