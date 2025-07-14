import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inspire_me/core/constants/appcolors.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final double height;
  final double width;
  final bool loading;
  final Color bordercolor;

  const RoundButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.height = 50,
    this.width = 380,
    this.loading = false,
    this.bordercolor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? AppColors.accent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: bordercolor, width: 1.5.sp),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 5, offset: Offset(0, 3))],
        ),
        alignment: Alignment.center,
        child: loading
            ? CircularProgressIndicator(color: Colors.white)
            : Text(
                text,
                style: TextStyle(color: textColor ?? Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
