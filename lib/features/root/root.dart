import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterflow_test/features/root/widget/buy_tab.dart';
import 'package:flutterflow_test/features/root/widget/rent_tab.dart';

import 'package:flutterflow_test/utils/asset_images.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/bottomnav.dart';
import '../../utils/colors.dart';
import 'widget/invest_tab.dart';

class PropertyPage extends StatefulWidget {
  const PropertyPage({super.key});

  @override
  State<PropertyPage> createState() => _PropertyPageState();
}

class _PropertyPageState extends State<PropertyPage> {
  PageController pageController = PageController(initialPage: 0);
  int selectedIndex = 0;

  List<NavItem> navItems = [
    NavItem(
      iconPath: AssetResources.buy_icon,
      index: 0,
      label: "Buy",
    ),
    NavItem(
      iconPath: AssetResources.rent_icon,
      index: 1,
      label: "Rent",
    ),
    NavItem(
      iconPath: AssetResources.invest_white_icon,
      index: 2,
      label: "invest",
    ),
  ];

  List<Widget> pages = const [
    BuyPage(),
    Center(
      child: Text("Rent"),
    ),
    InvestPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: pages,
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomNavigationBar(
                navItems: navItems,
                onItemTapped: (int v) {
                  pageController.jumpToPage(v);
                  setState(() {
                    selectedIndex = v;
                  });
                },
              ),
            ),
          )
        ],
      )),
    );
  }
}

class ReusablePropertyContainer extends StatelessWidget {
  final String backgroundImage;
  final String bedroomInfo;
  final String moneyInfo;
  final String location;

  const ReusablePropertyContainer({
    super.key,
    required this.backgroundImage,
    required this.bedroomInfo,
    required this.moneyInfo,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 273.w,
      // height: 320.h,
      margin: EdgeInsets.all(15.h),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bedroomInfo,
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.w600,
                    fontSize: 21.sp,
                    color: AppColors.white,
                  ),
                ),
                15.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    moneyInfo,
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w600,
                      fontSize: 21.sp,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Row(
              children: [
                SvgPicture.asset(
                  AssetResources.location_white_icon,
                ),
                10.horizontalSpace,
                Text(
                  location,
                  style: GoogleFonts.outfit(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(right: 10.0, bottom: 10.0),
              child: Row(
                children: [
                  Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: AppColors.white,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        AssetResources.like_icon,
                        height: 21.h,
                        width: 21.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
