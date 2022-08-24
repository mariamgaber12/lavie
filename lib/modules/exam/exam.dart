import 'package:flutter/material.dart';
import 'package:la_vie/cubit_lavie/exam_cubit.dart';
import 'package:la_vie/shared/components/components.dart';
import '../../models/question_model.dart';

/*
/*
class ExamPage extends StatelessWidget {
  const ExamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //const List<String> values = [];
    //String selectedValue = values.first;
    //const selectedColor = Colors.green;
    //const unselectedColor = Colors.green;
    late int questnum = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Course Exam',
          style: textstyle.copyWith(color: Colors.black, fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Question ',
                style: textstyle.copyWith(color: Colors.black, fontSize: 18),
              ),
              Text(
                '$questnum',
                style: textstyle.copyWith(color: Colors.green, fontSize: 18),
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 5, right: 5, top: 15, bottom: 15),
            child: Text(
              'What is the user experience?',
              style: textstyle.copyWith(color: Colors.black, fontSize: 16),
            ),
          ),

          ListTile(
            tileColor: Colors.grey[200],
            leading: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                '""',
                style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold),
              ),
            ),
            title: const Text(
             "",
              style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold),
            ),
            //trailing: Radio,
          ),
        ],
      ),
    );
  }

*/
/*

  Widget buildRadios() => Column(
        children: values.map(
              (value) {
            final selected = selectedValue == value;
            final color = selected ? selectedColor : unselectedColor;

            return RadioListTile<String>(
                value: value,
                groupValue: selectedValue,
                title: Row(
                  children: [
                    Image(image: NetworkImage(value), height: 50, width: 50,),
*//*

*/
/*
              Text(
                value,
                style: TextStyle(color: color),
              ),
*//*
*/
/*


                  ],
                ),
                activeColor: selectedColor,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value!;
                  });
                }
            );
          },
        ).toList(),
      );

*//*


}
*/
*/

class Exam extends StatefulWidget {
  final List<QuestionModel> test;

  Exam(this.test, {Key? key}) : super(key: key);

  @override
  State<Exam> createState() => _ExamState();
}

class _ExamState extends State<Exam> {
  bool isPress = false;
  final PageController _controller = PageController();
  static int? _value;

  @override
  Widget build(BuildContext context) {
    //var examCubit = LaVieExamCubit.get(context);
    return Scaffold(
      appBar: AppBar(
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

                      onTap: () {},
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
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear);
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
                    curve: Curves.linear);
                _value=null;
              },
              name: 'back'),
          buildLoginButton(
            width: 100,
              onPressed: () {
              _controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linear);
              _value=null;
              },
              name: 'Next'),
        ],
      );
    }
  }
}
