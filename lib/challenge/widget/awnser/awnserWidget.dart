import 'package:devquiz_nlw/challenge/challenge_controller.dart';
import 'package:devquiz_nlw/core/app_colors.dart';
import 'package:devquiz_nlw/shared/models/awnser_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Awnser extends StatelessWidget {
  final AwnserModel awnser ;
  final bool isSelected;
  final ValueChanged<int> onTap;
  final bool disabled;
  final int qtdRight;

  const Awnser(
      {Key? key,
      required this.awnser,
        required this.onTap,
      this.isSelected = false,
      this.disabled = false,
      required this.qtdRight})
      : super(key: key);

  Color get _selectedBorderRight => awnser.isRight ? Colors.green : Color(0xFF94FD3333);
  Color get _selectedColorCardRight => awnser.isRight ? Color(0xFF94EEFFC7) : Color(0x94FFC7C7);
  Color get _selectedBorderCardRight => awnser.isRight ? Colors.lightGreen : Color(0xFFBA0000);
  Color get _selectedTextStyleRight => awnser.isRight ? Color(0xFF29682A) : Color(0xFFFFDC1D11);
  IconData get _selectedIconRight => awnser.isRight ? Icons.check : Icons.close;



  @override
  Widget build(BuildContext context) {
    int rightAwnser = this.qtdRight;
    if(awnser.isRight){
      rightAwnser += 1;
    }
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      // ignore: file_names, file_names
      child: IgnorePointer(
        ignoring: disabled,
        child: GestureDetector(
          onTap: (){
            onTap(rightAwnser);
          },
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: isSelected ? _selectedColorCardRight : Colors.white,
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.fromBorderSide(BorderSide(color: isSelected ? _selectedBorderRight : Color(0xFF848484)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 10,
                  child: Text(
                    awnser.title,
                    style: GoogleFonts.notoSans(color: isSelected ? _selectedTextStyleRight : AppColors.darkPurple),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 24,
                    height: 30,
                    decoration: BoxDecoration(
                        color: isSelected ? _selectedBorderCardRight : null,
                        borderRadius: BorderRadius.circular(500),
                        border: Border.fromBorderSide(
                            BorderSide(color: isSelected ? _selectedBorderCardRight : Color(0xFF848484)))),
                    child: isSelected ? Icon(_selectedIconRight, color: Colors.white,) : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
