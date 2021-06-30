import 'package:devquiz_nlw/challenge/challenge_controller.dart';
import 'package:devquiz_nlw/challenge/widget/awnser/awnserWidget.dart';
import 'package:devquiz_nlw/core/app_colors.dart';
import 'package:devquiz_nlw/shared/models/awnser_model.dart';
import 'package:devquiz_nlw/shared/models/question_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Quiz extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback onChange;
  const Quiz({Key? key, required this.question, required this.onChange}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  int? indexSelected;
  int? qtdRight;

  AwnserModel awnsers(int index) => widget.question.awnsers[index];

  @override
  Widget build(BuildContext context) {
    int awnstersRight = 0;
    if(qtdRight != null){
          awnstersRight = qtdRight!;
    }

    return Column(
      children: [
        SizedBox(
          height: 64,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 20, right: 20),
          child: Text(
            widget.question.title,
            style: GoogleFonts.notoSans(
                color: AppColors.darkPurple,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        for (var i = 0; i < widget.question.awnsers.length; i++)
            Awnser(
             awnser: awnsers(i),
              isSelected: indexSelected == i,
              disabled: indexSelected != null,
              qtdRight: awnstersRight,
              onTap: (value){
                indexSelected = i;
                widget.onChange();
                setState(() {
                  qtdRight = value;
                  if(qtdRight == null){
                    print("é nullo");
                  }else {
                    print("Não é nulo ${qtdRight}");
                  }

                });
                print("final ${qtdRight} ${value}");
                // Future.delayed(Duration(seconds: 3)).then((value) => widget.onChange());
              },
            ),
        // SingleChildScrollView(
        //   child: Column(
        //     children: widget.question.awnsers
        //         .map((e) => Awnser(
        //               title: e.title,
        //               isRight: e.isRight,
        //             ))
        //         .toList(),
        //   ),
        // )
      ],
    );
  }
}
