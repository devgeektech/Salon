
import 'dart:convert';
import 'dart:io';

import '../../data/provider/provider.dart';
import 'package:http/http.dart';

class Repository{
  final provider = Provider();


  Future<Response> loginUser(Map<String, Object> json)async{

    Future<Response> response = provider.loginUser(json);
    return response;
  }

  Future<Response> signUpUser(Map<String, Object> json)async{

    Future<Response> response = provider.signUp_user(json);
    return response;
  }

  Future<Response> verfificationOtp(Map<String, Object> json)async{

    Future<Response> response = provider.verification(json);
    return response;
  }

  Future<Response> ReSendOtp(Map<String, Object> json)async{

    Future<Response> response = provider.ResendOtp(json);
    return response;
  }

  Future<Response> forgot(Map<String, Object> json)async{

    Future<Response> response = provider.Forgot(json);
    return response;
  }

  Future<Response> setNewPassword(Map<String, Object> json)async{

    Future<Response> response = provider.SetNewPassword(json);
    return response;
  }

/*
  Future<Response> socialLoginUser(Map<String, Object> json)async{

    Future<Response> response = provider.socialLoginUser(json);
    return response;
  }
*/




/*
  Future<Response> createProfile(Map<String, String> json,File iamge)async{
    Future<Response> response = provider.createProfile(json,iamge);
    return response;
  }
*/




/*
  Future<Response> verifyEmail(String email){
    Future<Response> response = provider.verifyEmail(email);
    return response;
  }
*/

/*
  Future<Response> verifyForgotEmail(String email){
    Future<Response> response = provider.verifyForgotEmail(email);
    return response;
  }
*/


/*
  Future<Response> resetPassword(String email,String password){
    Future<Response> response = provider.resetPassword(email,password);
    return response;
  }
*/




}