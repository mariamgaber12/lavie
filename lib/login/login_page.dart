import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/login/forget_pass_page.dart';
import '../../shared/components/components.dart';
import '../cubit_lavie/cubit.dart';
import '../cubit_lavie/state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKeyL = GlobalKey<FormState>();
  final GlobalKey<FormState> formkeyS = GlobalKey<FormState>();
  
  TextEditingController controllerLEmail = TextEditingController();
  TextEditingController controllerLPass = TextEditingController();
  TextEditingController controllerSEmail = TextEditingController();
  TextEditingController controllerSPass = TextEditingController();
  TextEditingController controllerFName = TextEditingController();
  TextEditingController controllerLName = TextEditingController();
  TextEditingController controllerCPass = TextEditingController();

  TextStyle textstyle = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w800,
    fontSize: 20,
    fontFamily: 'Uchen',
    decorationStyle: TextDecorationStyle.solid,
  );


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaVieCubit, LaVieStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LaVieCubit.get(context);
          return Stack(
            children: [
              DefaultTabController(
                initialIndex: 1,
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    bottom: PreferredSize(
                      preferredSize: const Size(100, 200),
                      child: Column(
                        children: [
                          buildLogo(),
                          const SizedBox(
                            height: 22,
                          ),
                          const TabBar(
                            splashBorderRadius:
                                BorderRadius.all(Radius.circular(15)),
                            labelColor: Colors.green,
                            unselectedLabelColor: Colors.grey,
                            indicatorColor: Colors.green,
                            indicatorSize: TabBarIndicatorSize.label,
                            tabs: <Widget>[
                              Tab(
                                text: 'Sign up',
                              ),
                              Tab(
                                text: 'Login',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  body: TabBarView(
                    children: <Widget>[
                      //signup
                      ListView(
                        children: [
                          Expanded(
                            child: Form(
                              key: formkeyS,
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
                                          } else if (value.isNotEmpty &&
                                              value.length < 3) {
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
                                          } else if (value.isNotEmpty &&
                                              value.length < 3) {
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
                                    controller: controllerSEmail,
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
                                    controller: controllerSPass,
                                    validate: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter your password.';
                                      } else if (value.isNotEmpty &&
                                          value.length < 6) {
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
                                          value != controllerSPass.text) {
                                        return 'Not same to password';
                                      }
                                      return null;
                                    },
                                  ),
                                  buildLoginButton(
                                      width: double.infinity,
                                      onPressed: () async{
                                        if (!formkeyS.currentState!.validate()) {
                                          return;
                                        }

                                        await cubit.signup(
                                          controllerFName.text.toString(),
                                          controllerLName.text.toString(),
                                          controllerSEmail.text.toString(),
                                          controllerSPass.text.toString(),
                                          context
                                        );
                                        //debugPrint(controllerFName.text);
                                        //debugPrint(controllerLName.text);
                                        //debugPrint(controllerPass.text);
                                        //debugPrint(controllerCPass.text);
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
                              buildSigninWithOther(
                                  onGTap: () {}, onFPressed: () {}),
                            ],
                          ),
                        ],
                      ),

                      ListView(
                        children: [
                          Expanded(
                            child: Form(
                              key: formKeyL,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 11,
                                  ),
                                  defaulttaskFormField(
                                    hint: 'Email',
                                    type: TextInputType.emailAddress,
                                    controller: controllerLEmail,
                                    validate: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter your email.';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  defaulttaskFormField(
                                    hint: 'Password',
                                    type: TextInputType.visiblePassword,
                                    controller: controllerLPass,
                                    validate: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter your password.';
                                      } else if (value.isNotEmpty &&
                                          value.length < 6) {
                                        return 'Password is less than 6 characters.';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  buildLoginButton(
                                    width: double.infinity,
                                    onPressed: () async{
                                      if (!formKeyL.currentState!.validate()) {
                                        return;
                                      }
                                      /* Scaffold.of(context).showSnackBar(const SnackBar(
                                      content: Text('Got your user name'),
                                    ));*/
                                      await cubit.login(controllerLEmail.text, controllerLPass.text,context);
                                      debugPrint(controllerLEmail.text);
                                      debugPrint(controllerLPass.text);
                                    },
                                    name: 'Login',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildLoginDivider(),
                              buildSigninWithOther(
                                  onGTap: () {}, onFPressed: () {}),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        navigateTo(
                                            context, const ForgetPassPage());
                                      },
                                      child: Text(
                                        'Forgotten Password?',
                                        style: textstyle.copyWith(
                                            color: Colors.grey, fontSize: 13),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 575,
                left: 250,
                //right: 22,
                child: buildDesign(
                    mainAxis: MainAxisAlignment.end,
                    img: const AssetImage('assets/images/rup.png'),
                    align: Alignment.topRight),
              ),
              Positioned(
                top: 605,
                right: 250,
                child: buildDesign(
                    align: AlignmentDirectional.bottomStart,
                    mainAxis: MainAxisAlignment.start,
                    img: const AssetImage('assets/images/ldown.png')),
              ),
            ],
          );
        });
  }
}
