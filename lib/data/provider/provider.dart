import 'dart:convert';
import 'dart:io';
import 'package:salon/routes/routes_names.dart';

import '../../utils/business_url.dart';
import '../../utils/user_url.dart';
import 'package:http/http.dart' as http;

class Provider {

  Future<http.Response> loginUser(Map<String, Object> body) async {
    print("login url====>  ${loginUrl}");
    print("login body ====> ${json.encode(body)}");

    http.Response response = await http.post(
      Uri.parse(loginUrl),
      body: body,
    );
    return response;
  }

  Future<http.Response> signUp_user(Map<String, Object> body) async {
    print("signUp_user url====>  ${signUp}");
    print("signUp_user body ====> ${json.encode(body)}");

    http.Response response = await http.post(
      Uri.parse(signUp),
      body: body,
    );
    return response;
  }

  Future<http.Response> verification(Map<String, Object> body) async {
    print("verification url====>  ${verification}");
    print("verification body ====> ${json.encode(body)}");

    http.Response response = await http.post(
      Uri.parse(verifyOTP),
      body: body,
    );
    return response;
  }

  Future<http.Response> ResendOtp(Map<String, Object> body) async {
    print("ResendOtp url====>  ${resendOTP}");
    print("ResendOtp body ====> ${json.encode(body)}");

    http.Response response = await http.post(
      Uri.parse(resendOTP),
      body: body,
    );
    return response;
  }


  Future<http.Response> Forgot(Map<String, Object> body) async {
    print("verification url====>  ${forgotPassword}");
    print("verification body ====> ${json.encode(body)}");

    http.Response response = await http.post(
      Uri.parse(forgotPassword),
      body: body,
    );
    return response;
  }

  Future<http.Response> SetNewPassword(Map<String, Object> body) async {
    print("verification url====>  ${setNewPassword}");
    print("verification body ====> ${json.encode(body)}");

    http.Response response = await http.post(
      Uri.parse(setNewPassword),
      body: body,
    );
    return response;
  }
/*
  Future<http.Response> socialLoginUser(Map<String, Object> body) async {


    http.Response response = await http.post(
      Uri.parse(socialLoginUrl),
      body: body,
    );
    return response;
  }
*/

/*
  Future<http.Response> createProfile(Map<String, String> body, File image) async {
    print("HelloCreateProfile====>  ${jsonEncode(body)}");
    print("HelloCreateProfile====>  ${createProfileUrl}");

    var request = http.MultipartRequest('POST', Uri.parse(createProfileUrl));
    var imagee = await http.MultipartFile.fromPath('profileImageUrl', image.path);
    request.fields['userName'] = body['userName']!;
    request.fields['email'] = body['email']!;
    request.fields['DOB'] = body['DOB']!;
    request.fields['martialStatus'] = body['martialStatus']!;
    request.fields['gender'] = body['gender']!;
    request.fields['city'] = body['city']!;
    request.fields['postCode'] = '';
    request.fields['country'] = body['country']!;
    request.fields['lat'] = body['lat'] ?? '30.6762062';
    request.fields['long'] = body['long'] ?? "76.7404944";
    request.fields['userTypeId'] = '1';
    request.fields['password'] = body['password']!;
    request.fields['phoneNo'] = body['phoneNo']!;
    request.fields['height'] = body['height']!;
    request.fields['hairColor'] = body['hairColor']!;
    request.fields['education_title'] = body['education_title']!;
    request.fields['education_level'] = body['education_level']!;
    request.fields['education_startDate'] = body['education_startYear']!;
    request.fields['education_location'] = body['education_location']!;
    request.fields['work_title'] = body['work_title']!;
    request.fields['work_description'] = body['work_description']!;
    request.fields['work_startDate'] = body['work_startDate']!;
    request.fields['current_working'] = body['current_working']!;
    request.fields['work_endDate'] = body['work_endDate']!;
    request.fields['work_location'] = body['work_location']!;
    request.fields['workspace_name'] = body['workspace_name']!;
    request.fields['religion'] = body['religion']!;
    request.fields['education_endDate'] = body['education_endDate']!;
    request.fields['type'] = body['type'] ?? "";
    request.fields['state'] = body['state'] ?? "";
    request.fields['weight'] = body['weight'] ?? "";
    request.fields['occupation_type'] = body['occupation_type'] ?? "";

    request.files.add(imagee);

    request.fields.forEach((key, value) {
      print('"HelloBusiness===> $key: $value');
    });

    http.Response response = await http.Response.fromStream(await request.send());
    return response;
  }
*/

/*
  Future<http.Response> verifyEmail(String email) async {
    print("HelloVerify===> " + email);
    print("HelloVerify===> " + verifyEmailUrl);
    http.Response response = await http.post(
      Uri.parse(verifyEmailUrl),
      body: {'email': email},
    );
    return response;
  }
*/
/*
  Future<http.Response> verifyForgotEmail(String email) async {
    print("HelloVerify===> " + email);
    print("HelloVerify===> " + verifyForgotEmailUrl);
    http.Response response = await http.post(
      Uri.parse(verifyForgotEmailUrl),
      body: {'email': email},
    );
    return response;
  }
*/

/*
  Future<http.Response> resetPassword(String email,String password) async {
    print("HelloReset===> " + resetPasswordUrl);
    print("HelloReset===>  " + email);
    print("HelloReset===> " + resetPasswordUrl);
    http.Response response = await http.post(
      Uri.parse(resetPasswordUrl),
      body: {
        'email': email,
        'password':password
      },
    );
    return response;
  }
*/


}
