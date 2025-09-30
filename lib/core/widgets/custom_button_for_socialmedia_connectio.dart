
import 'package:flutter/material.dart';
import 'package:pizza_app/core/utils/styles.dart';

class CustomButtonForSocialMediaConnection extends StatelessWidget {
  const CustomButtonForSocialMediaConnection({
    super.key,
    required this.backgroundcolor,
    required this.textcolor,
    this.borderRadius,
    required this.text,
    this.fontsize,
    this.onPressed,
    required this.icon,
  });

  final Color backgroundcolor;
  final Color textcolor;
  final BorderRadius? borderRadius;
  final String text;
  final double? fontsize;
  final void Function()? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundcolor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 30,
                width: 30,
                margin: const EdgeInsets.only(left: 5), // padding from edge
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(icon, size: 15, color: const Color(0xff385998)),
              ),
            ),

            Text(
              text,
              textAlign: TextAlign.center,
              style: Styles.textStyle16.copyWith(
                color: textcolor,
                fontWeight: FontWeight.w500,
                fontSize: fontsize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
