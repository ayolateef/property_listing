import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterflow_test/features/root/root.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/asset_images.dart';
import '../../../utils/colors.dart';
import '../../../utils/container.dart';
import '../../../utils/string_resources.dart';
import '../model/property_model.dart';

class BuyPage extends StatefulWidget {
  const BuyPage({super.key});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  int selectedIndex = 0;

  bool selected = true;
  List<String> itemText = [
    StringResources.GHANA,
    StringResources.NIGERIA,
    StringResources.DUBIA,
  ];

  List<PropertyModel> propertyData = [
    PropertyModel(
        backgroundImage: AssetResources.house2,
        moneyInfo: StringResources.MONEY,
        location: StringResources.LEKKI,
        bedroomInfo: StringResources.FOUR_BEDROOMS),
    PropertyModel(
        backgroundImage: AssetResources.house3,
        moneyInfo: StringResources.MONEY2,
        location: StringResources.IKOYI,
        bedroomInfo: StringResources.THREE_BEDROOMS),
    PropertyModel(
        backgroundImage: AssetResources.house4,
        moneyInfo: StringResources.MONEY,
        location: StringResources.LEKKI,
        bedroomInfo: StringResources.FOUR_BEDROOMS),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(AssetResources.category_icon),
                  ),
                  InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(AssetResources.search_icon),
                  ),
                ],
              ),
            ),
            30.verticalSpace,
            Container(
              width: 306.w,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringResources.DISCOVER_OUR_EXQUISITE,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.outfit(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  20.verticalSpace,
                  Text(
                    StringResources.DISCOVER_PLACES,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  20.verticalSpace,
                ],
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(itemText.length, (index) {
                  return SelectableContainer(
                    text: itemText[index],
                    isSelected: selectedIndex == index,
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        setState(() {});
                      });
                    },
                  );
                }),
              ),
            ),
            SizedBox(
                height: 420.h,
                child: ListView.builder(
                  itemCount: propertyData.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ReusablePropertyContainer(
                      backgroundImage: propertyData[index].backgroundImage,
                      bedroomInfo: propertyData[index].bedroomInfo,
                      moneyInfo: propertyData[index].moneyInfo,
                      location: propertyData[index].location,
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
