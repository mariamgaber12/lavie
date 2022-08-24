import 'package:flutter/material.dart';
import 'package:la_vie/cubit_lavie/exam_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit_lavie/exam_state.dart';
import '../../models/question_model.dart';


class ExamPage extends StatelessWidget {
  final List<QuestionModel> test;

  ExamPage(this.test, {Key? key}) : super(key: key);

  Color mainColor = const Color(0xffa9c1f7);
  Color secondColor = const Color(0xff576dca);
  bool isPress = false;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    var examCubit = LaVieExamCubit.get(context);
    return BlocConsumer<LaVieExamCubit, LaVieExamStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: mainColor,
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: PageView.builder(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (page) {LaVieExamCubit.get(context).isPress;},
                itemCount: test.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              "السؤال ${index + 1}/ ${test.length}",
                              style: const TextStyle(
                                color: Color(0xff0f1954),
                                fontSize: 25.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          const Divider(
                            color: Colors.white,
                            height: 8.0,
                            thickness: 1.0,
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          //بيعرض السؤال اللى فى الملف
                          Text(
                            test[index].question!,
                            style: const TextStyle(
                              fontSize: 22.0,
                              color: Colors.white,
                              //fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          //بيعرض الاجابات اللى موجودة فى الملف
                          for (int i = 0; i < test[index].answer!.length; i++)
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(bottom: 15.0),
                              child: MaterialButton(
                                shape: const StadiumBorder(),
                                color: secondColor,
                                padding:
                                const EdgeInsets.symmetric(vertical: 15.0),
                                //هنا بعد ما يجاوب بيشوف انا واقفة فين لو لسه فيه اسئلة بيكمل ولو وصلت لاخر سؤال بيعرض النتيجة
                                onPressed: () {
                                  print(examCubit.resultScore);
                                    _controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.linear);
                                },
                                //الاجابات نفسها
                                child: Text(
                                  test[index].answer!.keys.toList()[i],
                                  style: const TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        );
      },
    );
  }
}
