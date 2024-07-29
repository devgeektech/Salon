import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/Authentication/forgot/forgot_cubit.dart';
import '../../logic/Authentication/forgot/forgot_state.dart';
import '../../routes/routes_names.dart';
import '../../utils/theme.dart';
import '../../widgets/button.dart';
import '../../widgets/commontext.dart';
import '../../widgets/custom_text_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgotPasswordCubit(),
      child: BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
                  child: Column(
                    children: [
                      Center(
                        child: Image(
                          image: AssetImage("assets/images/m2_s8_img1.png"),
                          height: MediaQuery.of(context).size.height * 0.26,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: CommonTextWidget(
                          heading: "Forgot Password",
                          fontSize: 20,
                          color: ThemeProvider.blackColor,
                          fontFamily: "ManropeSemibold",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: CommonTextWidget(
                          heading: "Enter your registered Email ID and we will send you a link to change your password",
                          fontSize: 14,
                          color: ThemeProvider.greyColor,
                          fontFamily: "ManropeSemibold",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                            CustomTextField(
                              maxLines: 1,
                              hintText: "Enter Email",
                              onChanged: (email) => context.read<ForgotPasswordCubit>().setEmail(email),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.05,
                  left: MediaQuery.of(context).size.width * 0.02,
                  right: MediaQuery.of(context).size.width * 0.02,
                  child: Button(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<ForgotPasswordCubit>().forgotPassword(context);
                     //   Navigator.pushNamed(context, reset_password);
                      }
                    },
                    title: "Send",
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
