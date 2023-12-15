import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterflow_test/features/root/route/route.dart';
import 'package:flutterflow_test/features/root/widget/AuthPage/auth_page.dart';
import 'package:flutterflow_test/utils/asset_images.dart';
import 'package:flutterflow_test/utils/navigation/navigation_service.dart';
import 'package:flutterflow_test/utils/string_resources.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/button.dart';
import '../../../utils/colors.dart';
import '../../../utils/config/app_startup.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(AssetResources.house1, fit: BoxFit.cover,),
                    Container(
                      margin: EdgeInsets.only(top: 350.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.0.sp),
                          topRight: Radius.circular(50.0.sp),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Image.asset(AssetResources.SPLASH_IMAGE),
                            const SizedBox(height: 18.0),
                            Text(StringResources.FIND_PEFECT,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.outfit(
                                  textStyle: const TextStyle(
                                    fontSize: 34.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )),
                            const SizedBox(height: 18.0),
                            Text(
                              StringResources.DISCOVER_DREAM,
                              textAlign: TextAlign.center,
                              textScaleFactor: 1.1,
                              style: GoogleFonts.outfit(
                                textStyle: TextStyle(
                                    fontSize: 19.0.sp,
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),

                            SizedBox(height: 20.0.h),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0.sp, vertical: 20.sp),
                              child: AppButton(
                                  height: 71.sp,
                                  radius: 120.r,
                                  width: 339.sp,
                                  color: AppColors.black,
                                  onPressed: () async {
                                    try {
                                      await authService.signInWithGoogle();
                                      getIt<NavigationService>()
                                          .to(routeName: RootRoutes.root);
                                    } catch (error) {

                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          AssetResources.google_icon),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Text(
                                        StringResources
                                            .CONTINUE_WITH_GOOGLE,
                                        textScaleFactor: 1.1,
                                        style: GoogleFonts.outfit(
                                          textStyle: TextStyle(
                                            fontSize: 19.0.sp,
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),

                            Text(
                              StringResources.OR,
                              style: GoogleFonts.outfit(
                                textStyle: TextStyle(
                                    fontSize: 19.0.sp,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),

                            Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: 20.sp),
                              child: AppButton(
                                  height: 71.sp,
                                  radius: 120.r,
                                  width: 339.sp,
                                  color: AppColors.black,
                                  onPressed: () {
                                    getIt<NavigationService>()
                                        .to(routeName: RootRoutes.signIn);
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          AssetResources.email_icon),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Text(
                                        StringResources.CONTINUE_WITH_EMAIL,
                                        textScaleFactor: 1.1,
                                        style: GoogleFonts.outfit(
                                          textStyle: TextStyle(
                                              fontSize: 19.0.sp,
                                              color: AppColors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            SizedBox(height: 20.0.h),

                            Text.rich(
                              textAlign: TextAlign.center,
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text:
                                          'By creating an account you agree to our\n',
                                      style: TextStyle(
                                          fontSize: 14.0.sp,
                                          color: AppColors.grey,
                                          fontWeight: FontWeight.w500)),
                                  TextSpan(
                                    text: 'Terms of Service',
                                    style: TextStyle(
                                        decoration:
                                            TextDecoration.underline,
                                        fontSize: 14.0.sp,
                                        color: AppColors.grey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
