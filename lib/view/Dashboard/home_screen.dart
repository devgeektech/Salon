import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../logic/Dashboard/home/home_cubit.dart';
import '../../logic/Dashboard/home/home_state.dart';
import '../../utils/theme.dart';
import '../../widgets/commontext.dart';


class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> with SingleTickerProviderStateMixin {
  late HomeScreenCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = HomeScreenCubit();
    _cubit.initializeAnimation(this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 20,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(
                              state.animationValue * 3.141592653589793238 / 180),
                          child: Image.asset('assets/images/m3_s3_img1.png'),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset("assets/icons/gps_m3.svg"),
                                Image(
                                  image: AssetImage("assets/images/m2_s8_img1.png"),
                                  height: 0.14.h,
                                  color: ThemeProvider.whiteColor,
                                ),
                                SvgPicture.asset("assets/icons/drawer_m3.svg"),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0.25.w,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonTextWidget(
                                  heading: "Cleaned Salon",
                                  fontSize: 25,
                                  color: ThemeProvider.whiteColor,
                                  fontFamily: "ManropeSemibold",
                                  fontWeight: FontWeight.w700,
                                ),
                                SizedBox(height: 0.02.w),
                                Row(
                                  children: [
                                    SvgPicture.asset("assets/icons/gps_m3.svg"),
                                    SizedBox(height: 0.04.w),
                                    CommonTextWidget(
                                      heading: "Top Categories",
                                      fontSize: 12,
                                      color: ThemeProvider.whiteColor,
                                      fontFamily: "ManropeSemibold",
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: SizedBox(
                            width: 100.w,
                            height: 0.06.h,
                            child: Card(
                              color: ThemeProvider.whiteColor,
                              surfaceTintColor: ThemeProvider.whiteColor,
                              elevation: 2,
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(
                                      Icons.search,
                                      color: ThemeProvider.greyColor,
                                    ),
                                    onPressed: () {
                                      // Perform search logic here
                                    },
                                  ),
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(
                                        fontFamily: "Lato-Regular",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Search and book best services',
                                        hintStyle: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Lato-Regular",
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF000000).withOpacity(0.4),
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 0.02.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonTextWidget(
                          heading: "Top Categories",
                          fontSize: 18,
                          color: ThemeProvider.blackColor,
                          fontFamily: "ManropeSemibold",
                          fontWeight: FontWeight.w800,
                        ),
                        CommonTextWidget(
                          heading: "See All",
                          fontSize: 12,
                          color: ThemeProvider.appColor,
                          fontFamily: "ManropeRegular",
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 0.02.h),
                  Container(
                    height: 0.1.h,
                    child: ListView.builder(
                      itemCount: 8,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: index == 0
                              ? EdgeInsets.only(left: 8.0)
                              : EdgeInsets.only(left: 0),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  SvgPicture.asset("assets/icons/tc_img1.svg"),
                                  SizedBox(height: 0.01 .h),
                                  CommonTextWidget(
                                    heading: "Hair",
                                    fontSize: 12,
                                    color: ThemeProvider.blackColor,
                                    fontFamily: "ManropeRegular",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                              SizedBox(width: 0.2.w),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 0.02.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image(image: AssetImage("assets/images/pb_img1.png")),
                  ),
                  SizedBox(height: 0.04.h),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: CommonTextWidget(
                        heading: "Trending",
                        fontSize: 18,
                        color: ThemeProvider.blackColor,
                        fontFamily: "ManropeSemiBold",
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Container(
                    height: 0.4.h,
                    child: ListView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return IntrinsicHeight(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 0.36.h,
                                  width: 0.3.w,
                                  decoration: BoxDecoration(
                                    color: ThemeProvider.whiteColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height:  0.20.h,
                                        width:  0.3.h,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              "assets/images/ps_img1.png",
                                            ),
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height:  0.01.h),
                                      CommonTextWidget(
                                        heading: "FOR MEN & WOMEN",
                                        fontSize: 12,
                                        color: ThemeProvider.appColor,
                                        fontFamily: "ManropeRegular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                      SizedBox(height:  0.01.h),
                                      CommonTextWidget(
                                        heading: "Bridal Makeup",
                                        fontSize: 14,
                                        color: ThemeProvider.blackColor,
                                        fontFamily: "ManropeSemiBold",
                                        fontWeight: FontWeight.w800,
                                      ),
                                      SizedBox(height: 0.01.h),
                                      Row(
                                        children: [
                                          CommonTextWidget(
                                            heading: "Haircut, Spa, Massage . ",
                                            fontSize: 14,
                                            color: ThemeProvider.greyColor,
                                            fontFamily: "ManropeSemiBold",
                                            fontWeight: FontWeight.w800,
                                          ),
                                          Image(
                                            image: AssetImage("assets/images/ps_img2.png"),
                                            height:  0.1.h,
                                            width: 0.2.w,
                                            color: ThemeProvider.whiteColor,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 0.02.w),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }
}


