import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/asset_images.dart';
import '../../../utils/button.dart';
import '../../../utils/colors.dart';
import '../../../utils/container.dart';
import '../../../utils/string_resources.dart';

class RentPage extends StatefulWidget {
  const RentPage({super.key});

  @override
  State<RentPage> createState() => _RentPageState();
}

class _RentPageState extends State<RentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Image.asset(AssetResources.house6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 14.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(10.sp),
                        child: SvgPicture.asset(AssetResources.back_arrow),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(110.r),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 13.w, vertical: 10.h),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AssetResources.ROTATION_ICON,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              StringResources.THREESIXY,
                              style: TextStyle(
                                  fontSize: 18.sp, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 250,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 25.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.r),
                    topRight: Radius.circular(50.r)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 238,
                    child: Text(
                      StringResources.FOUR_BEDROOMS,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w800,
                        height: 1.7,
                        // letterSpacing: 0.04,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      SvgPicture.asset(AssetResources.location_icon),
                      10.horizontalSpace,
                      Text(
                        StringResources.LEKKI,
                        style: GoogleFonts.outfit(
                            fontSize: 19,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomInfoContainer(text: '4 bedroom'),
                        10.horizontalSpace,
                        const CustomInfoContainer(text: '3 bathrooms'),
                        10.horizontalSpace,
                        const CustomInfoContainer(text: '2 toilets'),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.h),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          StringResources.CHARMING_HOUSE,
                          textAlign: TextAlign.left,
                          textScaleFactor: 1.2,
                          style: TextStyle(
                              fontFamily: 'Outfit',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.1,
                              wordSpacing: 2.0),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 129.h,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.r),
                          topRight: Radius.circular(50.r)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$150,000',
                          textScaleFactor: 1.5,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        AppButton(
                          onPressed: () {},
                          text: 'Buy',
                          color: AppColors.black,
                          height: 66.h,
                          radius: 70.r,
                          width: 160.w,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
