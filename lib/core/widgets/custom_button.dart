import 'package:flutter/material.dart';
import 'package:pizza_app/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundcolor,
    required this.textcolor,
    this.borderRadius,
    required this.text,
    this.fontsize, this.onPressed,
  });

  final Color backgroundcolor;
  final Color textcolor;
  final BorderRadius? borderRadius;
  final String text;
  final double? fontsize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundcolor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Styles.textStyle16.copyWith(
            color: textcolor,
            fontWeight: FontWeight.w700,
            fontSize: fontsize,
          ),
        ),
      ),
    );
  }
}
