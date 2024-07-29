
import 'package:equatable/equatable.dart';

class ForgotPasswordState extends Equatable {
  final bool isSubmitting;
  final bool loadingState;
  final String email;
  final String? errorMessage;

   ForgotPasswordState({
    required this.isSubmitting,
    required this.email,
    this.errorMessage,
     required this.loadingState,
  });

  ForgotPasswordState copyWith({
    bool? isSubmitting,
    bool? loadingState,
    String? email,
    String? errorMessage,
  }) {
    return ForgotPasswordState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      email: email ?? this.email,
      errorMessage: errorMessage ?? this.errorMessage,
      loadingState: loadingState ?? this.loadingState,
    );
  }

  @override
  List<Object?> get props => [isSubmitting, email, errorMessage ,loadingState];
}
