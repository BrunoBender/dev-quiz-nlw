import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  LevelButtonWidget({Key? key, required this.label, required this.onTap})
      : assert(["Fácil", "Médio", "Difícil", "Perito"].contains(label)),
        super(key: key);

  final config = {
    "Fácil": {
      "color": Color(0x40B7A6F6),
      "border": Color(0xCC5B40C1),
      "fontColor": Color(0xCC5B40C1),
    },
    "Médio": {
      "color": Color(0x41B8FAB5),
      "border": Color(0xDD41B43A),
      "fontColor": Color(0xDD41B43A),
    },
    "Difícil": {
      "color": Color(0x40EFE690),
      "border": Color(0xFFC6A601),
      "fontColor": Color(0xFFC6A601),
    },
    "Perito": {
      "color": Color(0x40F6A6A6),
      "border": Color(0xFFFA4B4B),
      "fontColor": Color(0xFFFA4B4B),
    },
  };

  Color get color => config[label]!['color']!;
  Color get borderColor => config[label]!['border']!;
  Color get fontColor => config[label]!['fontColor']!;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: color,
          border: Border.fromBorderSide(
              BorderSide(color: borderColor)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 6),
          child: Text(
            label,
            style: GoogleFonts.notoSans(color: fontColor),
          ),
        ),
      ),
    );
  }
}
