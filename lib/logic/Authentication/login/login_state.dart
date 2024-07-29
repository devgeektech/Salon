import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
//part 'login_cubit.dart';

class LoginScreenState extends Equatable {
  final bool isLogin;
  final bool showPassword;
  final bool showRegisterPassword;
  final String errorMessage;
  final bool loadingState;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController registerEmailController;
  final TextEditingController registerPasswordController;
  final GlobalKey<FormState> login_formKey;  // Added form key
  final GlobalKey<FormState> signup_formKey;
  final String otpValue;
  final String email;
  final String name;
  final String secreen_type;
  final bool isSubmitting;

  LoginScreenState({
    required this.isLogin,
    required this.showPassword,
    required this.showRegisterPassword,
    required this.errorMessage,
    required this.loadingState,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.registerEmailController,
    required this.registerPasswordController,
    required this.login_formKey,  // Added form key
    required this.signup_formKey,
    required this.otpValue,
    required this.email,
    required this.name,
    required this.isSubmitting,// Added form key
    required this.secreen_type,// Added form key
  });

  LoginScreenState copyWith({
    bool? isLogin,
    bool? showPassword,
    bool? showRegisterPassword,
    String? errorMessage,
    bool? loadingState,
    TextEditingController? nameController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? registerEmailController,
    TextEditingController? registerPasswordController,
    GlobalKey<FormState>? login_formKey,  // Added form key
    GlobalKey<FormState>? signup_formKey,
    String? otp_Value,
    String? secreenType,
    String? emaill,
    String? name,
    bool? isSubmitting,// Added form key
  }) {
    return LoginScreenState(
      isLogin: isLogin ?? this.isLogin,
      showPassword: showPassword ?? this.showPassword,
      showRegisterPassword: showRegisterPassword ?? this.showRegisterPassword,
      errorMessage: errorMessage ?? this.errorMessage,
      loadingState: loadingState ?? this.loadingState,
      nameController: nameController ?? this.nameController,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      registerEmailController: registerEmailController ?? this.registerEmailController,
      registerPasswordController: registerPasswordController ?? this.registerPasswordController,
      login_formKey: login_formKey ?? this.login_formKey,  // Added form key
      signup_formKey: signup_formKey ?? this.signup_formKey,
      otpValue: otp_Value ?? this.otpValue,
      email: emaill ?? this.email,
      name: name ?? this.name,
      secreen_type: secreenType ?? this.secreen_type,
      isSubmitting: isSubmitting ?? this.isSubmitting,// Added form key
    );
  }

  @override
  List<Object> get props => [
    isLogin,
    showPassword,
    showRegisterPassword,
    errorMessage ,
    loadingState ,
    nameController,
    emailController,
    passwordController,
    registerEmailController,
    registerPasswordController,
    login_formKey,  // Added form key
    signup_formKey,
    email ,
    secreen_type ,
    name ,
    otpValue, isSubmitting// Added form key
  ];
}
