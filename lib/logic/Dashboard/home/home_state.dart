import 'package:equatable/equatable.dart';

class HomeScreenState extends Equatable {
  final List<String> onboardingData;
  final int currentPage;
  final double animationValue;

  HomeScreenState({
    required this.onboardingData,
    required this.currentPage,
    required this.animationValue,
  });

  HomeScreenState copyWith({
    List<String>? onboardingData,
    int? currentPage,
    double? animationValue,
  }) {
    return HomeScreenState(
      onboardingData: onboardingData ?? this.onboardingData,
      currentPage: currentPage ?? this.currentPage,
      animationValue: animationValue ?? this.animationValue,
    );
  }

  @override
  List<Object?> get props => [onboardingData, currentPage, animationValue];
}
