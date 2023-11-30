import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  QuestionsSummary({super.key, required this.summaryData});

  List<Map<String, dynamic>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
                (data) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start, // Align children to the start of the row
                crossAxisAlignment: CrossAxisAlignment.start, // Align children vertically centered
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0), // Adjust the padding as needed
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: (data['user_answer'] != data['correct_answer'])
                          ? Colors.pinkAccent
                          : Colors.blue,
                      child: Text(
                        "${(int.parse(data['question_index'].toString()) + 1)}",
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start of the column
                      children: [
                        Text(
                          "${data['question']}",
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${data['user_answer']}",
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 11,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "${data['correct_answer']}",
                          style: GoogleFonts.lato(
                            color: Colors.blue,
                            fontSize: 11,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }

}
