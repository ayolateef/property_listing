import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class SelectableContainer extends StatefulWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectableContainer({
    super.key,
    required this.text,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  State<SelectableContainer> createState() => _SelectableContainerState();
}

class _SelectableContainerState extends State<SelectableContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 55.h,
        width: 135.w,
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0.sp),
        decoration: BoxDecoration(
          color: widget.isSelected ? AppColors.black : Colors.grey[300],
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
                color: widget.isSelected ? AppColors.white : AppColors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18.sp),
          ),
        ),
      ),
    );
  }
}

class CustomInfoContainer extends StatelessWidget {
  final String text;

  const CustomInfoContainer({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 152.w,
      height: 54,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Outfit',
            fontSize: 19.sp,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.04,
          ),
        ),
      ),
    );
  }
}
