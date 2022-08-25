import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/cubit_lavie/cubit.dart';
import 'package:la_vie/cubit_lavie/state.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:la_vie/login/login_page.dart';
import 'package:la_vie/models/Cart_model.dart';
import 'package:la_vie/shared/components/constant.dart';

import '../../shared/components/components.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final double coverHeight = 300;
  final double profileHeight = 130;

  @override
  Widget build(BuildContext context) {
    final top1 = coverHeight / 2;
    final bottom1 = profileHeight / 2;

    return BlocConsumer<LaVieCubit, LaVieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LaVieCubit.get(context);
       /* var userImage = cubit.datauser.data!.user!.imageUrl;
        if (cubit.datauser.data!.user!.imageUrl != null) {
          //for (int i = 0; i < userImage!.length; i++) {
          userImage = Image.memory(const Base64Decoder()
              .convert(userImage.toString().substring(22))) as String?;
        }*/
        return Scaffold(
          body: Column(
            children: [
              Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: coverHeight,
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(5))),
                          child: Image.network(
                            '${cubit.datauser.data!.user!.imageUrl}',
                            width: double.infinity,
                            height: coverHeight,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.80),
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25))),
                          width: double.infinity,
                          height: coverHeight,
                        ),
                      ],
                    ),
                    Positioned(
                      top: top1-22,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: profileHeight / 2,
                            backgroundColor: Colors.grey.shade100,
                            backgroundImage: NetworkImage(
                                '${cubit.datauser.data!.user!.imageUrl}'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              '${cubit.datauser.data!.user!.firstName} ${cubit.datauser.data!.user!.lastName} ',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ]),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(55),
                        bottomRight: Radius.circular(55),
                        topLeft: Radius.circular(55),
                        topRight: Radius.circular(55))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Image.asset(
                                  'assets/images/points.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                'You have 0 points',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(22.0),
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    buildProfileCart(title: 'Change Name', onPressed: () {},icon:Icons.arrow_forward),
                    buildProfileCart(title: 'Change Email', onPressed: () {},icon: Icons.arrow_forward),
                    buildProfileCart(title: 'Logout',icon: Icons.logout_rounded,onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => const LoginPage()));}),

                  ]
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildProfileCart({required icon,required title, required onPressed}) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          borderOnForeground: true,
          elevation: 6,
          shadowColor: Colors.grey[100],
          child: ListTile(
            title: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: IconButton(
              onPressed: onPressed,
              icon: Icon(
                icon,
                color: Colors.teal.shade900,
              ),
            ),
            leading: SvgPicture.asset(
              ('assets/images/p_sell.svg'),
            ),
          ),
        ),
      );
}
