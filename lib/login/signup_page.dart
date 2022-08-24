import 'package:flutter/material.dart';
import '../../shared/components/components.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, required this.buttonStyle}) : super(key: key);
  final TextStyle buttonStyle;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController controllerFName = TextEditingController();
  TextEditingController controllerpass = TextEditingController();
  TextEditingController controllerLName = TextEditingController();
  TextEditingController controllerCPass = TextEditingController();
  TextEditingController controlleremail = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextStyle textstyle = const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontSize: 20,
      fontFamily: 'Uchen',
      decorationStyle: TextDecorationStyle.solid,
      letterSpacing: 0.11);

  TextStyle textstyle1 = const TextStyle(
    color: Colors.green,
    fontWeight: FontWeight.w500,
    fontSize: 18,
    fontFamily: 'Uchen',
  );

  TextStyle textstyle2 = const TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.w400,
    fontSize: 18,
    fontFamily: 'Uchen',
  );

  late TextStyle styleButton = textstyle2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => ListView(
          children: [
            buildDesign(
                mainAxis: MainAxisAlignment.end,
                img: const AssetImage('assets/images/rup.png'), align:AlignmentDirectional.topEnd),
            buildLogo(),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        //navigateTo(context, const SignUpPage());
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'Sign up',
                          style: widget.buttonStyle,
                        ),
                        myLine(
                            right: 30,
                            left: 30,
                            width: 40,
                            color: Colors.green),
                      ],
                    )),
                const SizedBox(width: 40),
                TextButton(
                    onPressed: () {
                      setState(() {
                        styleButton = textstyle1;
                        navigateTo(
                            context, LoginPage());
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'Login',
                          style: textstyle2,
                        ),
                        myLine(
                            right: 30,
                            left: 30,
                            width: 40,
                            color: Colors.white),
                      ],
                    )),
              ],
            ),

            Expanded(
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 11,
                    ),
                    Row(
                      children: [
                        defaulttaskFormField(
                          right: 5,
                          width: 150,
                          hint: 'First Name',
                          type: TextInputType.name,
                          controller: controllerFName,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your First name.';
                            } else if (value.isNotEmpty && value.length < 3) {
                              return 'First name should be more than 3 characters';
                            }
                            return null;
                          },
                        ),
                        defaulttaskFormField(
                          left: 5,
                          width: 134,
                          hint: 'Last Name',
                          type: TextInputType.name,
                          controller: controllerLName,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your last name.';
                            } else if (value.isNotEmpty && value.length < 3) {
                              return 'Last name should be more than 3 characters';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),

                    defaulttaskFormField(
                      hint: 'Email',
                      type: TextInputType.emailAddress,
                      controller: controlleremail,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your email.';
                        }
                        return null;
                      },
                    ),

                    defaulttaskFormField(
                      hint: 'Password',
                      type: TextInputType.visiblePassword,
                      controller: controllerpass,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your password.';
                        } else if (value.isNotEmpty && value.length < 6) {
                          return 'Password is less than 6 characters.';
                        }
                        return null;
                      },
                    ),
                    defaulttaskFormField(
                      hint: 'Confirm Password',
                      type: TextInputType.visiblePassword,
                      controller: controllerCPass,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Please confirm your password.';
                        } else if (value.isNotEmpty &&
                            value != controllerpass) {
                          return 'Not same to password';
                        }
                        return null;
                      },
                    ),
                    buildLoginButton(
                    width: double.infinity,
                        onPressed: () {
                          if (!formkey.currentState!.validate()) {
                            return;
                          }
                          /* Scaffold.of(context).showSnackBar(const SnackBar(
                              content: Text('Got your user name'),
                            ));*/
                          print(controllerLName.text);
                          print(controllerpass.text);
                          print(controllerCPass.text);
                          print(controllerFName.text);
                        },
                        name: 'Sign up')
                  ],
                ),
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildLoginDivider(),
                buildSigninWithOther(onGTap: (){}, onFPressed: (){}),
              ],
            ),
            buildDesign(
                align:AlignmentDirectional.bottomStart,
                mainAxis: MainAxisAlignment.start,
                img: const AssetImage('assets/images/ldown.png')),          ],
        ),
      ),
    );
  }
}
