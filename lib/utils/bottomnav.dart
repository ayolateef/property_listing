import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'colors.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final List<NavItem> navItems;

  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.navItems,
    required this.onItemTapped,
  });

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: BottomNavigationBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          items: _buildNavItems(),
          currentIndex: selectedIndex,
          selectedItemColor: AppColors.black,
          unselectedItemColor: AppColors.grey,
          onTap: onItemTapped,
        ),
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      widget.onItemTapped(selectedIndex);
    });
  }

  List<BottomNavigationBarItem> _buildNavItems() {
    return widget.navItems.map((navItem) {
      return BottomNavigationBarItem(
        icon: _buildNavItem(navItem),
        label: '',
      );
    }).toList();
  }

  Widget _buildNavItem(NavItem navItem) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:
            selectedIndex == navItem.index ? Colors.white : Colors.transparent,
      ),
      padding: EdgeInsets.all(20.sp),
      child: Column(children: [
        SvgPicture.asset(navItem.iconPath,
            color: selectedIndex != navItem.index
                ? Colors.white
                : AppColors.black),
        Text(navItem.label,
            style: TextStyle(
                color: selectedIndex != navItem.index
                    ? Colors.white
                    : AppColors.black)),
      ]),
    );
  }
}

class NavItem {
  final String iconPath;
  final String label;
  final int index;

  NavItem({
    required this.iconPath,
    required this.label,
    required this.index,
  });
}
