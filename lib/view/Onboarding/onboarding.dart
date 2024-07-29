import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


import '../../logic/Splash-Onboarding/onboarding/onboarding_cubit.dart';
import '../../logic/Splash-Onboarding/onboarding/onboarding_state.dart';
import '../../utils/theme.dart';
import '../../widgets/button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          final cubit = context.read<OnboardingCubit>();
          return Scaffold(
            backgroundColor: Colors.white,
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
                Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: PageView.builder(
                        scrollBehavior: CupertinoScrollBehavior(),
                        controller: cubit.pageController,
                        itemCount: state.onboardingData.length,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index) {
                          cubit.onPageChanged(index);
                        },
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AnimatedSwitcher(
                                duration: Duration(milliseconds: 500),
                                child: Container(
                                  key: ValueKey<int>(state.currentPage),
                                  height: MediaQuery.of(context).size.height * 0.4,
                                  width: MediaQuery.of(context).size.height * 0.4,
                                  child: Image.asset(
                                    state.onboardingData[state.currentPage].image,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                              AnimatedSwitcher(
                                duration: Duration(milliseconds: 500),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    state.onboardingData[state.currentPage].title,
                                    key: ValueKey<int>(state.currentPage), // Ensure unique key for text
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "ManropeSemiBold",
                                      color: ThemeProvider.blackColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                              AnimatedSwitcher(
                                duration: Duration(milliseconds: 500),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    state.onboardingData[state.currentPage].description,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: ThemeProvider.blackColor,
                                      fontFamily: "ManropeSemiBold",
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: cubit.pageController,
                      count: state.onboardingData.length,
                      effect: SwapEffect(
                        activeDotColor: ThemeProvider.blackColor,
                        dotColor: ThemeProvider.blackColor.withOpacity(0.4),
                        dotHeight: 8,
                        dotWidth: 8,
                        type: SwapType.zRotation,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Button(
                        onPressed: () {
                          cubit.nextPage(context);
                        },
                        title: "Continue",
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
