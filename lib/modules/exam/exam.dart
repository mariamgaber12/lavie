import 'package:flutter/material.dart';
import 'package:la_vie/cubit_lavie/exam_cubit.dart';
import 'package:la_vie/layout/home_layout.dart';
import 'package:la_vie/modules/exam/exam_result.dart';
import 'package:la_vie/modules/home/home_page.dart';
import 'package:la_vie/shared/components/components.dart';
import '../../models/question_model.dart';


class Exam extends StatefulWidget {
  final List<QuestionModel> test;

  const Exam(this.test, {Key? key}) : super(key: key);

  @override
  State<Exam> createState() => _ExamState();
}

class _ExamState extends State<Exam> {
  bool isPress = false;
  final PageController _controller = PageController();
  static int? _value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back,color: Colors.white,size: 2,),
        title: const Text(
          'Exam',
        ),
        centerTitle: true,
      ),
      body: PageView.builder(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (page) {
            LaVieExamCubit.get(context).isPress;
          },
          itemCount: widget.test.length,
          itemBuilder: (context, index) {
            return ListView(

              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Question ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        " ${index + 1}",
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),

                //بيعرض السؤال اللى فى الملف
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    widget.test[index].question!,
                    style: const TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                      //fontWeight: FontWeight.w300,
                    ),
                  ),
                ),

                //بيعرض الاجابات اللى موجودة فى الملف
                for (int i = 0; i < widget.test[index].answer!.length; i++)
                  Container(
                    width: 350,
                    height: 60,
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.green)),
                    child: ListTile(
                      autofocus: true,
                      selectedColor: Colors.green,
                      trailing: Radio(
                        value: i,
                        groupValue: _value,
                        activeColor: Colors.green,
                        onChanged: i == 5
                            ? null
                            : (int? value) {
                                setState(() {
                                  _value = value!;
                                });
                              },
                      ),
                      title: Text(
                        widget.test[index].answer!.keys.toList()[i],
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),


                backButton(index: index),
              ],
            );
          }),
    );
  }

  Widget backButton({required int index}) {
    if (index == 0) {
      return buildLoginButton(
        width: 100,
          onPressed: () {
            _controller.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut);
            _value=null;
          },
          name: 'Next');
    } else {
      return Row(
        children: [
          buildLoginButton(
            width: 100,
              onPressed: () {
                _controller.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut
                );
                _value=null;
              },
              name: 'back'),
          buildLoginButton(
            width: 100,
              onPressed: () {
               if(index==2) {
                 navigateTo(context, const ExamResult(points: 20,));
              }else{
                 _controller.nextPage(
                     duration: const Duration(milliseconds: 300),
                     curve: Curves.easeInOut);
              }
              _value=null;
              },
              name: 'Next'),
        ],
      );
    }
  }
}
