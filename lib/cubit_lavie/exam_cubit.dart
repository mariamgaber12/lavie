import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/question_model.dart';
import '../modules/exam/exam.dart';
import 'exam_state.dart';

class LaVieExamCubit extends Cubit<LaVieExamStates> {
  LaVieExamCubit() : super(LaVieExamInitialState());

  static LaVieExamCubit get(context) => BlocProvider.of(context);
  int totalResult = 0;
  int resultScore = 0;
  int testIndex = 0;
  var questions;
  String? testName;
  bool isPress = false;
  String? messageText;
  final PageController _controller = PageController();
  String? resultText;




  takeTest() {
    if (testIndex == 0) {
      emit(LaVieExamTakenState());
      return Exam(questions1);
    }
  }


}