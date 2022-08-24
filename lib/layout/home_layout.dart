import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/shared/network/end_points.dart';
import '../cubit_lavie/cubit.dart';
import '../cubit_lavie/state.dart';



class HomeLayout extends StatelessWidget {
   const HomeLayout({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
     /*bool isChange1=false;
     bool isChange2=false;
     bool isChange3=false;
     bool isChange4=false;
     bool isChange5=false;*/
    return BlocConsumer<LaVieCubit, LaVieStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LaVieCubit.get(context);
          return Scaffold(
            body: cubit.homeScreens[cubit.homeIndex],
            bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    spreadRadius: 5,
                    blurRadius: 100,
                    offset: const Offset(0,3),
                  ),],
                ),
                child: CurvedNavigationBar(
                  onTap:(index){
                    cubit.changeBottomNavBar(index);
                    /* isChange1!=isChange1;
                     isChange2!=isChange2;
                     isChange3!=isChange3;
                     isChange4!=isChange4;
                     isChange5!=isChange5;*/
                  },
                  backgroundColor: Colors.transparent,
                  buttonBackgroundColor: Colors.green,
                  color:Colors.white,
                  index: 2,
                  animationDuration: const Duration(milliseconds: 250),
                  height:60,
                  items:  [
                    Image.asset('assets/images/leave.png',height: 23,width: 21),
                   /* Icon(
                      Icons.energy_savings_leaf_outlined,
                      color: isChange1==true? Colors.white:Colors.black,
                    ),*/
                    Image.asset('assets/images/qr_scan.png',height: 20,width: 18),

                    const Icon(
                      Icons.home_outlined,
                      size: 28,
                      //color: isChange3==true? Colors.white:Colors.black,
                    ),
                    const Icon(
                      Icons.notifications_none_rounded,
                     size: 27,
                      // color: isChange4==true? Colors.white:Colors.black,
                    ),
                    const Icon(
                      Icons.person_outline_outlined,
                      size: 27,
                      //color: isChange5==true? Colors.white:Colors.black,
                    ),
                  ],
                )
            ),

          );
        });
  }
}