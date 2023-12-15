import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterflow_test/features/root/route/route.dart';
import 'package:flutterflow_test/utils/config/app_startup.dart';
import 'package:flutterflow_test/utils/navigation/navigation_service.dart';

import '../../../utils/asset_images.dart';
import '../../../utils/colors.dart';
import '../../../utils/container.dart';
import '../../../utils/string_resources.dart';

class InvestPage extends StatefulWidget {
  const InvestPage({super.key});

  @override
  State<InvestPage> createState() => _InvestPageState();
}

class _InvestPageState extends State<InvestPage> {
  int selectedIndex = 0;
  bool selected = false;
  List<String> itemText = [
    StringResources.GHANA,
    StringResources.NIGERIA,
    StringResources.DUBIA,
  ];
  List<InvestData> containerDataList = [
    InvestData(
      backgroundImage: [AssetResources.house3],
      topText: 'Airport',
      title: 'Lakeshore Blvd West',
      amount: '\$320k',
      bottomText: 'Rental Income: \$2,300 monthly',
    ),
    InvestData(
      backgroundImage: [AssetResources.house3],
      topText: 'Labone',
      title: 'Wilmington Blvd East',
      amount: '\$190k',
      bottomText: 'Rental Income:\$1,100 monthly',
    ),
    InvestData(
      backgroundImage: [
        AssetResources.house3,
      ],
      topText: 'Beach',
      title: 'Wilmington Blvd East',
      amount: '\$190k',
      bottomText: 'Rental Income:\$3,100 monthly',
    ),
    InvestData(
      backgroundImage: [AssetResources.house3],
      topText: 'Park',
      title: 'Wilmington Blvd East',
      amount: '\$390k',
      bottomText: 'Rental Income:\$2,400 monthly',
    ),
    // Add more data for other containers
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
          30.verticalSpace,
          Text(
            StringResources.INVEST_IN_PLACE,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 28.sp,
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(itemText.length, (index) {
                return SelectableContainer(
                  text: itemText[index],
                  isSelected: index == selectedIndex,
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      selected != selected;
                    });
                  },
                );
              }),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: containerDataList.length,
              itemBuilder: (context, index) {
                return buildContainer(containerDataList[index]);
              },
            ),
          )
        ],
      ),
    ));
  }
}

Widget buildContainer(InvestData data) {
  return GestureDetector(
    onTap: () {
      getIt<NavigationService>().to(routeName: RootRoutes.rentPage);
    },
    child: Container(
      height: 350.h,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(data.backgroundImage.first),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(32.r),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              width: 80.w,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(120.r),
              ),
              child: Center(
                child: Text(
                  data.topText,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 20,
            child: Container(
              width: 292,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        data.amount,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    data.bottomText,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class InvestData {
  final List<String> backgroundImage;
  final String topText;
  final String title;
  final String amount;
  final String bottomText;

  InvestData({
    required this.backgroundImage,
    required this.topText,
    required this.title,
    required this.amount,
    required this.bottomText,
  });
}
