import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/cubit_lavie/state.dart';
import 'package:la_vie/login/login_page.dart';
import 'package:la_vie/login/splash_page.dart';
import 'package:la_vie/modules/discussions/discussion_forums.dart';
import 'package:la_vie/shared/network/dio_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'cubit_lavie/cubit.dart';

void main() async {
  DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

late Database database;

@override
void initState() async{
  initState();

}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LaVieCubit(),
      child: BlocConsumer<LaVieCubit, LaVieStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.green,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                titleSpacing: 22,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark),
                iconTheme: IconThemeData(color: Colors.black),
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            home: const SplashPage(),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
