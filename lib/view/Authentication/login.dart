import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../logic/Authentication/login/login_cubit.dart';
import '../../logic/Authentication/login/login_state.dart';
import '../../routes/routes_names.dart';
import '../../utils/theme.dart';
import '../../widgets/button.dart';
import '../../widgets/commontext.dart';
import '../../widgets/custom_text_field.dart';

 class LoginScreenPage extends StatefulWidget {
   const LoginScreenPage({super.key});

   @override
   State<LoginScreenPage> createState() => _LoginScreenPageState();
 }

 class _LoginScreenPageState extends State<LoginScreenPage> {


   @override
   Widget build(BuildContext context) {
     final cubit = context.read<LoginScreenCubit>();
     return BlocBuilder<LoginScreenCubit, LoginScreenState>(
       builder: (context, state) {

         return Scaffold(
           resizeToAvoidBottomInset: true,
           body: Stack(
             children: [
               Container(
                 height: double.infinity,
                 width: double.infinity,
                 decoration: BoxDecoration(
                   image: DecorationImage(
                       image: AssetImage("assets/images/gbl_img2.png")),
                 ),
               ),
               SingleChildScrollView(
                 padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
                 child: Column(
                   children: [
                     Image(
                       image: AssetImage("assets/images/m2_s8_img1.png"),
                       height: MediaQuery.of(context).size.height * 0.26,
                     ),
                     Align(
                       alignment: Alignment.topLeft,
                       child: CommonTextWidget(
                         heading: state.isLogin ? "Welcome!" : "Sign Up",
                         fontSize: 32,
                         color: ThemeProvider.blackColor,
                         fontFamily: "ManropeSemibold",
                         fontWeight: FontWeight.w700,
                       ),
                     ),
                     SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                     Align(
                       alignment: Alignment.topLeft,
                       child: RichText(
                         text: TextSpan(
                           children: [
                             TextSpan(
                               style: TextStyle(
                                 fontSize: 14,
                                 color: ThemeProvider.greyColor,
                                 fontFamily: "ManropeLight",
                                 fontWeight: FontWeight.w800,
                               ),
                               text: state.isLogin ? "Don’t have an account? " : "Already have an Account? ",
                             ),
                             TextSpan(
                               style: TextStyle(
                                 fontSize: 14,
                                 color: ThemeProvider.blackColor,
                                 fontFamily: "ManropeSemibold",
                                 fontWeight: FontWeight.w800,
                                 decoration: TextDecoration.underline,
                               ),
                               text: state.isLogin ? " Sign Up" : " Login",
                               recognizer: TapGestureRecognizer()..onTap = () {
                                 cubit.toggleAuthMode();
                                 state.nameController.clear();
                                 state.emailController.clear();
                                 state.passwordController.clear();
                                 state.registerEmailController.clear();
                                 state.registerPasswordController.clear();
                               },
                             ),
                           ],
                         ),
                       ),
                     ),
                     SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                     AnimatedCrossFade(
                       duration: Duration(milliseconds: 300),
                       firstChild: loginForm(context, state, cubit),
                       secondChild: signUpForm(context, state, cubit),
                       crossFadeState: state.isLogin ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                     ),
                     SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                     Button(
                       onPressed: () {


                         //Navigator.pushNamed(context, verification);
                         if(state.isLogin){
                          if (state.login_formKey.currentState?.validate() ?? false){
                            //Navigator.pushNamed(context, dashboard);
                            cubit.loginUser(context);
                          }
                        }else{
                          if (state.signup_formKey.currentState?.validate() ?? false){
                            cubit.signUp(context);
                           // Navigator.pushNamed(context, verification);
                          }

                        }

                       },
                       title: state.isLogin ? "Log in" : "Sign Up",
                     ),
                     SizedBox(height: state.isLogin ? MediaQuery.of(context).size.height * 0.04 : MediaQuery.of(context).size.height * 0.03),
                     Row(
                       children: [
                         Flexible(
                           child: Divider(
                             color: ThemeProvider.dividerColor,
                             height: 2,
                             endIndent: 2,
                           ),
                         ),
                         CommonTextWidget(
                           heading: state.isLogin ? "Or Log in using" : "Or Sign up using",
                           fontSize: 14,
                           color: ThemeProvider.blackColor,
                           fontFamily: "ManropeRegular",
                           fontWeight: FontWeight.w400,
                         ),
                         Flexible(
                           child: Divider(
                             color: ThemeProvider.dividerColor,
                             height: 2,
                             indent: 2,
                           ),
                         ),
                       ],
                     ),
                     SizedBox(height: state.isLogin ? MediaQuery.of(context).size.height * 0.02 : MediaQuery.of(context).size.height * 0.01),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [

                         // Google login button
                         InkWell(
                           onTap: (){
                             cubit.signInWithGoogle(context);
                           },
                           child: Column(
                             children: [
                               SvgPicture.asset("assets/icons/gbl_img3.svg"),
                               CommonTextWidget(
                                 heading: "Google",
                                 fontSize: 14,
                                 color: ThemeProvider.blackColor,
                                 fontFamily: "ManropeRegular",
                                 fontWeight: FontWeight.w400,
                               ),
                             ],
                           ),
                         ),

                         //Facebook Login Button
                         InkWell(
                           onTap: (){
                             print("Hello Pressed");
                             cubit.handleFacebookLogin(context);
                           },
                           child: Column(
                             children: [
                               SvgPicture.asset("assets/icons/gbl_img4.svg"),
                               CommonTextWidget(
                                 heading: "Facebook",
                                 fontSize: 14,
                                 color: ThemeProvider.blackColor,
                                 fontFamily: "ManropeRegular",
                                 fontWeight: FontWeight.w400,
                               ),
                             ],
                           ),
                         ),
                       ],
                     ),
                   ],
                 ),
               ),
             ],
           ),
         );
       },
     );
   }

   Widget loginForm(BuildContext context, LoginScreenState state, LoginScreenCubit cubit) {
     return Form(
       key: state.login_formKey,
       child: Column(
         key: ValueKey('loginForm'),
         children: [
           Align(
             alignment: Alignment.topLeft,
             child: CommonTextWidget(
               heading: "Email",
               fontSize: 14,
               color: ThemeProvider.blackColor,
               fontFamily: "ManropeRegular",
               fontWeight: FontWeight.w400,
             ),
           ),
           SizedBox(height: 10),
           CustomTextField(
             controller: state.emailController,
             hintText: "Enter Email",
             maxLines: 1,
             keyboardType: TextInputType.emailAddress,
             textInputAction: TextInputAction.next,
             validator: (value) {
               if (value == null || value.isEmpty) {
                 return 'Please enter your email';
               } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                 return 'Please enter a valid email';
               }
               return null;
             },
           ),
           SizedBox(height: 30),
           Align(
             alignment: Alignment.topLeft,
             child: CommonTextWidget(
               heading: "Password",
               fontSize: 14,
               color: ThemeProvider.blackColor,
               fontFamily: "ManropeRegular",
               fontWeight: FontWeight.w400,
             ),
           ),
           SizedBox(height: 10),
           CustomTextField(
             maxLines: 1,
             keyboardType: TextInputType.visiblePassword,
             textInputAction: TextInputAction.done,
             obscureText: !state.showPassword,
             controller: state.passwordController,
             hintText: "Enter Password",
             suffixIcon: InkWell(
               onTap: () {
                 cubit.togglePasswordMode();
               },
               child: Padding(
                 padding: const EdgeInsets.all(14.0),
                 child: SvgPicture.asset(
                   state.showPassword ? "assets/icons/m2_s8_img2.svg" : "assets/icons/m2_s8_img1.svg",
                 ),
               ),
             ),
             validator: (value) {
               if (value == null || value.isEmpty) {
                 return 'Please enter your password';
               } else if (value.length < 6) {
                 return 'Password must be at least 6 characters long';
               }
               return null;
             },
           ),
           SizedBox(height: 10),

           GestureDetector(
             onTap: (){
               Navigator.pushNamed(context, forgot);
             },
             child: Align(
               alignment: Alignment.topLeft,
               child: CommonTextWidget(
                 heading: "Forgot Password?",
                 fontSize: 14,
                 color: ThemeProvider.greyColor,
                 fontFamily: "ManropeRegular",
                 fontWeight: FontWeight.w400,
               ),
             ),
           ),

           SizedBox(height: 30),


         ],
       ),
     );
   }

   Widget signUpForm(BuildContext context, LoginScreenState state, LoginScreenCubit cubit) {
     return Form(
       key: state.signup_formKey,
       child: Column(
         key: ValueKey('signUpForm'),
         children: [
           Align(
             alignment: Alignment.topLeft,
             child: CommonTextWidget(
               heading: "Name",
               fontSize: 14,
               color: ThemeProvider.blackColor,
               fontFamily: "ManropeRegular",
               fontWeight: FontWeight.w400,
             ),
           ),
           SizedBox(height: 10),
           CustomTextField(
             controller: state.nameController,
             maxLines: 1,
             keyboardType: TextInputType.name,
             textInputAction: TextInputAction.next,

             hintText: "Enter Name",
             validator: (value) {
               if (value == null || value.isEmpty) {
                 return 'Please enter your name';
               }
               return null;
             },
           ),
           SizedBox(height: 30),
           Align(
             alignment: Alignment.topLeft,
             child: CommonTextWidget(
               heading: "Email",
               fontSize: 14,
               color: ThemeProvider.blackColor,
               fontFamily: "ManropeRegular",
               fontWeight: FontWeight.w400,
             ),
           ),
           SizedBox(height: 10),
           CustomTextField(
             controller: state.registerEmailController,
             hintText: "Enter Email",
             maxLines: 1,
              onChanged: (v) {
               cubit.assignEmail(v);
              },
             keyboardType: TextInputType.emailAddress,
             textInputAction: TextInputAction.next,
             validator: (value) {
               if (value == null || value.isEmpty) {
                 return 'Please enter your email';
               } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                 return 'Please enter a valid email';
               }
               return null;
             },
           ),

           SizedBox(height: 30),
           Align(
             alignment: Alignment.topLeft,
             child: CommonTextWidget(
               heading: "Password",
               fontSize: 14,
               color: ThemeProvider.blackColor,
               fontFamily: "ManropeRegular",
               fontWeight: FontWeight.w400,
             ),
           ),
           SizedBox(height: 10),
           CustomTextField(
             maxLines: 1,
             obscureText: !state.showRegisterPassword,
             controller: state.registerPasswordController,
             hintText: "Enter Password",
             keyboardType: TextInputType.visiblePassword,
             textInputAction: TextInputAction.done,
             suffixIcon: InkWell(
               onTap: () {
                 cubit.toggleRegisterPasswordMode();
               },
               child: Padding(
                 padding: const EdgeInsets.all(14.0),
                 child: SvgPicture.asset(
                   state.showRegisterPassword ? "assets/icons/m2_s8_img2.svg" : "assets/icons/m2_s8_img1.svg",
                 ),
               ),
             ),
             validator: (value) {
               if (value == null || value.isEmpty) {
                 return 'Please enter your password';
               } else if (value.length < 6) {
                 return 'Password must be at least 6 characters long';
               }
               return null;
             },
           ),
           SizedBox(height: 20),
         ],
       ),
     );
   }
 }



