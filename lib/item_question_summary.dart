import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemQuestionSummary extends StatelessWidget {
  const ItemQuestionSummary({
    super.key,
    required this.data,
  });

  final Map<String, Object> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: const Color.fromARGB(255, 230, 120, 193),
              child: Text(((data['question_index'] as int) + 1).toString()),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(data['question'] as String,
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 16,
                      )),
                ),
                Text(data['user_answer'] as String,
                    style: GoogleFonts.lato(
                      color: data['user_answer'] == data['correct_answer'] ? Colors.green : Colors.red,
                      fontSize: 15,
                    )),
                Text(data['correct_answer'] as String,
                    style: GoogleFonts.lato(
                      color: const Color.fromARGB(255, 97, 72, 238),
                      fontSize: 15,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
