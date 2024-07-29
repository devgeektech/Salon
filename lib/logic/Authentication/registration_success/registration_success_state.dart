
import 'package:equatable/equatable.dart';

class RegistrationSuccessState extends Equatable {
  final double scale;
  final bool isWelcoming;

  const RegistrationSuccessState({
    required this.scale,
    required this.isWelcoming,
  });

  RegistrationSuccessState copyWith({
    double? scale,
    bool? isWelcoming,
  }) {
    return RegistrationSuccessState(
      scale: scale ?? this.scale,
      isWelcoming: isWelcoming ?? this.isWelcoming,
    );
  }

  @override
  List<Object> get props => [scale, isWelcoming];
}
