import 'dart:ffi';

import 'package:devquiz_nlw/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizCard extends StatefulWidget {
  final String title;
  final int numberQuestions;
  final int awnseredQuestions;
  final VoidCallback onTap;

  const QuizCard({Key? key,
    required this.title,
    required this.numberQuestions,
    required this.awnseredQuestions,
    required this.onTap})
      : super(key: key);


  @override
  _QuizCardState createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard>{

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: 175,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.fromBorderSide(
                  BorderSide(color: Color(0xFFD5C6C6C6)))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.access_alarms_sharp,
                  size: 35,
                  color: Color(0xFF58228D),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.title,
                  style: GoogleFonts.notoSans(
                      textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2F2E2E))),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        "${widget.awnseredQuestions}/${widget.numberQuestions}",
                        style: GoogleFonts.notoSans(
                            textStyle:
                            TextStyle(fontSize: 11, color: Colors.grey)),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ProgressIndicatorWidget(
                        value: widget.awnseredQuestions /
                            widget.numberQuestions,),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


