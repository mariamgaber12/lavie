import 'package:flutter/material.dart';
import 'package:la_vie/login/login_page.dart';
import 'package:la_vie/login/signup_page.dart';
import '../../shared/components/components.dart';
import '../layout/home_layout.dart';

class ForgetPassPage extends StatefulWidget {
  const ForgetPassPage({Key? key, }) : super(key: key);

  @override
  State<ForgetPassPage> createState() => _ForgetPassPageState();
}

class _ForgetPassPageState extends State<ForgetPassPage> {
  TextEditingController controlleremail = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextStyle textstyle = const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontSize: 20,
      fontFamily: 'Uchen',
      decorationStyle: TextDecorationStyle.solid,
      letterSpacing: 0.11);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => ListView(
          children: [
            Expanded(
              child: buildDesign(
                  align:AlignmentDirectional.topEnd,
                  mainAxis: MainAxisAlignment.end,
                  img: const AssetImage('assets/images/rup.png')),
            ),
            const SizedBox(height: 120),
            Expanded(child: buildLogo()),
            const SizedBox(height: 105),
            Expanded(
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    defaulttaskFormField(
                      hint: 'Email',
                      type: TextInputType.emailAddress,
                      controller: controlleremail,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your email.';
                        } else {
                          return null;
                        }},),


                    buildLoginButton(
                    width: double.infinity,
                      onPressed: () {
                        if (!formkey.currentState!.validate()) {
                          return;
                        }
                        /* Scaffold.of(context).showSnackBar(const SnackBar(
                              content: Text('Got your user name'),
                            ));*/
                        print(controlleremail.text);
                        navigateTo(context, LoginPage());
                      },
                      name: 'Reset',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 150,),
            Expanded(
              child: buildDesign(mainAxis:MainAxisAlignment.start,
                  align:AlignmentDirectional.bottomStart,
                  img: const AssetImage('assets/images/ldown.png')),
            ),
          ],
        ),
      ),
    );
  }
}
