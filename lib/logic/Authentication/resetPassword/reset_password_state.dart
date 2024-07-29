
import 'package:equatable/equatable.dart';

class ResetPasswordState extends Equatable {
  final bool showPassword;
  final bool showConfirmPassword;
  final String password;
  final String confirmPassword;
  final String errorMessage;
  final bool isSubmitting;
  final bool loadingState;


  const ResetPasswordState({
    required this.showPassword,
    required this.showConfirmPassword,
    required this.password,
    required this.confirmPassword,
    required this.isSubmitting,
    required this.errorMessage,
    required this.loadingState,
  });

  ResetPasswordState copyWith({
    bool? showPassword,
    bool? showConfirmPassword,
    String? password,
    String? confirmPassword,
    String? errorMessage,
    bool? isSubmitting,
    bool? loadingState,
  }) {
    return ResetPasswordState(
      showPassword: showPassword ?? this.showPassword,
      showConfirmPassword: showConfirmPassword ?? this.showConfirmPassword,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage ?? this.errorMessage,
      loadingState: loadingState ?? this.loadingState,
    );
  }

  @override
  List<Object> get props => [showPassword, errorMessage,loadingState,showConfirmPassword, password, confirmPassword, isSubmitting];
}
