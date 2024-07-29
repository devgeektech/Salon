import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../widgets/button.dart';
import '../../../widgets/commontext.dart';
import '../../../widgets/custom_text_field.dart';
import '../../logic/Authentication/resetPassword/reset_password_cubit.dart';
import '../../logic/Authentication/resetPassword/reset_password_state.dart';
import '../../utils/theme.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ResetPasswordCubit(),
      child: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
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
                      image: AssetImage("assets/images/gbl_img2.png"),
                    ),
                  ),
                ),
                Padding(
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
                          heading: "Welcome!",
                          fontSize: 32,
                          color: ThemeProvider.blackColor,
                          fontFamily: "ManropeSemibold",
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: CommonTextWidget(
                          heading: "Setup new Password",
                          fontSize: 14,
                          color: ThemeProvider.blackColor,
                          fontFamily: "ManropeSemibold",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: CommonTextWidget(
                          heading: "New Password",
                          fontSize: 14,
                          color: ThemeProvider.blackColor,
                          fontFamily: "ManropeRegular",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                      CustomTextField(
                        maxLines: 1,
                        obscureText: state.showPassword ? false : true,
                        onChanged: (password) => context.read<ResetPasswordCubit>().setPassword(password),
                        hintText: "Enter Password",
                        suffixIcon: InkWell(
                          onTap: () {
                            context.read<ResetPasswordCubit>().togglePasswordMode();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: state.showPassword
                                ? SvgPicture.asset("assets/icons/m2_s8_img2.svg")
                                : SvgPicture.asset("assets/icons/m2_s8_img1.svg"),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                      Align(
                        alignment: Alignment.topLeft,
                        child: CommonTextWidget(
                          heading: "Re-Enter New Password",
                          fontSize: 14,
                          color: ThemeProvider.blackColor,
                          fontFamily: "ManropeRegular",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                      CustomTextField(
                        maxLines: 1,
                        obscureText: state.showConfirmPassword ? false : true,
                        onChanged: (confirmPassword) => context.read<ResetPasswordCubit>().setConfirmPassword(confirmPassword),
                        hintText: "Enter Password",
                        suffixIcon: InkWell(
                          onTap: () {
                            context.read<ResetPasswordCubit>().toggleConfirmPasswordMode();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: state.showConfirmPassword
                                ? SvgPicture.asset("assets/icons/m2_s8_img2.svg")
                                : SvgPicture.asset("assets/icons/m2_s8_img1.svg"),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    ],
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).viewInsets.bottom != 0 ? 1 : MediaQuery.of(context).size.height * 0.05,
                  left: MediaQuery.of(context).size.width * 0.02,
                  right: MediaQuery.of(context).size.width * 0.02,
                  child: Button(
                    onPressed: () => context.read<ResetPasswordCubit>().setNewPassword(context),
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
