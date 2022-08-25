import 'package:flutter/material.dart';
import 'package:la_vie/cubit_lavie/exam_cubit.dart';
import 'package:la_vie/layout/home_layout.dart';
import 'package:la_vie/modules/home/home_page.dart';
import 'package:la_vie/shared/components/components.dart';
import '../../models/question_model.dart';

class ExamResult extends StatefulWidget {
  const ExamResult( {Key? key, required this.points}) : super(key: key);

  final int points;

  @override
  State<ExamResult> createState() => _ExamResultState();
}

class _ExamResultState extends State<ExamResult> {
  bool isPress = false;
  final PageController _controller = PageController();
  static int? _value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
        ),
        title: const Text(
          'Result',
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Thank you for your interesting ❤',
            textAlign: TextAlign.center,
            style: textstyle.copyWith(
                color: Colors.green[200], fontSize: 25, fontWeight: FontWeight.w500),
          ),

          const SizedBox(height: 45,),

          Center(
            child: Text(
              'Your points now are ${widget.points}',
              style: textstyle.copyWith(
                  color: Colors.green, fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),

          const SizedBox(height: 45,),

          buildLoginButton(
              onPressed: () {
                navigateTo(context, const HomeLayout());
              },
              name: 'Done',
              width: double.infinity)
        ],
      ),
    );
  }
}
