import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../widgets/button.dart';
import '../../../widgets/commontext.dart';
import '../../logic/Authentication/login/login_cubit.dart';
import '../../logic/Authentication/login/login_state.dart';
import '../../utils/theme.dart';

class VerificationScreenPage extends StatefulWidget {
   VerificationScreenPage({super.key});

  @override
  State<VerificationScreenPage> createState() => _VerificationScreenPageState();
}

class _VerificationScreenPageState extends State<VerificationScreenPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authB = context.read<LoginScreenCubit>();
    print("authB HelloEmail====>${authB.state.email} ");

    return BlocBuilder<LoginScreenCubit, LoginScreenState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/gbl_img2.png"),
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Image(
                      image: AssetImage("assets/images/m2_s8_img1.png"),
                      height: MediaQuery.of(context).size.height * 0.26,
                    ),
                    CommonTextWidget(
                      heading: "Verification",
                      fontSize: 25,
                      color: ThemeProvider.blackColor,
                      fontFamily: "ManropeRegular",
                      fontWeight: FontWeight.w800,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CommonTextWidget(
                      textAlign: TextAlign.center,
                      heading: "Enter the code from the email we sent to ${authB.state.email}",
                      fontSize: 16,
                      color: ThemeProvider.greyColor,
                      fontFamily: "ManropeRegular",
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CommonTextWidget(
                      textAlign: TextAlign.center,
                      heading: "1:00",
                      fontSize: 16,
                      color: ThemeProvider.blackColor,
                      fontFamily: "ManropeRegular",
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    pinArea1(context, state),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    InkWell(
                      onTap: (){
                        authB.ResendOtp(context);
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              style: TextStyle(
                                fontSize: 14,
                                color: ThemeProvider.greyColor,
                                fontFamily: "ManropeLight",
                                fontWeight: FontWeight.w800,
                              ),
                              text: "I didn't receive any code. ",
                            ),
                            TextSpan(
                              style: TextStyle(
                                fontSize: 14,
                                color: ThemeProvider.blackColor,
                                fontFamily: "ManropeSemibold",
                                fontWeight: FontWeight.w800,
                                decoration: TextDecoration.underline,
                              ),
                              text: "RESEND",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).viewInsets.bottom != 0
                    ? 1
                    : MediaQuery.of(context).size.height * 0.05,
                left: MediaQuery.of(context).size.width * 0.02,
                right: MediaQuery.of(context).size.width * 0.02,
                child: Button(
                  onPressed: () =>{
                    authB.emit(state.copyWith(emaill: authB.state.email)),
                    authB.emit(state.copyWith(otp_Value: authB.state.otpValue)),


                    //  print("call set new password screen") ,
                    //   Navigator.pushNamed(context, dashboard)
                    authB.otpVerifiaction(context),
                  },

                  title: "Send",
                ),
              ),
            ],
          ),
        );
      },
    );
  }



  Widget pinArea1(BuildContext context1, LoginScreenState state) {
    return GestureDetector(
      onLongPress: () {
        print("LONG");
      },
      child: PinCodeTextField(
        cursorColor: ThemeProvider.blackColor,
        length: 6,
        obscureText: false,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(6),
          fieldHeight: MediaQuery.of(context).size.height * 0.06,
          fieldWidth: MediaQuery.of(context).size.height * 0.06,
          selectedColor: ThemeProvider.appColor,
          selectedFillColor: ThemeProvider.otpFilledColor,
          inactiveColor: ThemeProvider.appColor,
          activeColor: ThemeProvider.appColor,
          inactiveFillColor: ThemeProvider.whiteColor,
          activeFillColor: ThemeProvider.whiteColor,
          activeBoxShadow: [
            BoxShadow(
              color: ThemeProvider.appColor,
            ),
          ],
        ),
        animationDuration: Duration(milliseconds: 300),
        enableActiveFill: true,
        keyboardType: TextInputType.number,
        onCompleted: (v) {
          print("Completed");
          print("value is $state and length is ${v.length}");

          context.read<LoginScreenCubit>().setOtpValue(v);
        },
        onChanged: (value1) {
          print("value is $state and length is ${value1.length}");
          if (value1.length == 6) {
            context.read<LoginScreenCubit>().setOtpValue(value1);
          }
        },
        beforeTextPaste: (text) {
          print("Allowing to paste $text");
          return true;
        },
        appContext: context1,
      ),
    );
  }
}
