import 'package:devquiz_nlw/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final Color overlayColor;
  final VoidCallback onTap;
  final bool bold;

  const NextButtonWidget({
    Key? key,
    required this.label,
    required this.backgroundColor,
    required this.fontColor,
    required this.borderColor,
    required this.overlayColor,
    required this.onTap,
    required this.bold,
  }) : super(key: key);

  NextButtonWidget.green({
    required String label,
    required VoidCallback onTap,
  })  : this.onTap = onTap,
        this.backgroundColor = AppColors.buttonGreen,
        this.fontColor = Colors.white,
        this.borderColor = AppColors.buttonGreen,
        this.overlayColor = Color(0x6A559A33),
        this.label = label,
        this.bold = false;

  NextButtonWidget.white({
    required String label,
    required VoidCallback onTap,
  })  : this.onTap = onTap,
        this.backgroundColor = Colors.white,
        this.borderColor = Colors.grey,
        this.fontColor = Color(0xFF727272),
        this.overlayColor = Color(0x4ACECECE),
        this.label = label,
        this.bold = true;

  NextButtonWidget.purple({
    required String lavel,
    required VoidCallback onTap,
  })  : this.onTap = onTap,
        this.backgroundColor = AppColors.purple,
        this.borderColor = AppColors.purple,
        this.fontColor = Colors.white,
        this.overlayColor = Color(0xFF624A99),
        this.label = lavel,
        this.bold = false;


  Text get isBold => !this.bold ? Text(label,
      style: GoogleFonts.notoSans(
        fontWeight: FontWeight.w600,
        fontSize: 15,
        color: fontColor,
      )) : Text(label,
      style: GoogleFonts.notoSans(
        fontWeight: FontWeight.w900,
        fontSize: 15,
        color: fontColor,
      ));

  @override
  Widget build(BuildContext context) {

    return Container(
        height: 48,
        child: TextButton(
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(overlayColor),
              backgroundColor: MaterialStateProperty.all(backgroundColor),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
              side: MaterialStateProperty.all(BorderSide(color: borderColor))),
          onPressed: onTap,
          child:
          this.isBold,
        ));
  }
}
