import 'package:equatable/equatable.dart';

import '../../../data/model/onBoard.dart';

class OnboardingState extends Equatable {
  final int currentPage;
  final List<OnBoard> onboardingData;

  OnboardingState({
    required this.currentPage,
    required this.onboardingData,
  });

  OnboardingState copyWith({
    int? currentPage,
    List<OnBoard>? onboardingData,
  }) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      onboardingData: onboardingData ?? this.onboardingData,
    );
  }

  @override
  List<Object> get props => [currentPage, onboardingData];
}
