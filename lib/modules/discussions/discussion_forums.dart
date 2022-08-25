import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/cubit_lavie/cubit.dart';
import 'package:la_vie/cubit_lavie/state.dart';
import 'package:la_vie/modules/discussions/add_post.dart';
import 'package:la_vie/shared/components/components.dart';
import '../../shared/components/constant.dart';
import '../../shared/network/end_points.dart';

class DiscussionForums extends StatefulWidget {
  const DiscussionForums({Key? key}) : super(key: key);

  @override
  State<DiscussionForums> createState() => _DiscussionForumsState();
}

class _DiscussionForumsState extends State<DiscussionForums> {
  TextEditingController searchController = TextEditingController();
  bool isPress = false;
  int lNum = 0;
  int cNum = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer <LaVieCubit,LaVieStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=LaVieCubit.get(context)..getPosts(POSTS, TOKEN!);
        return DefaultTabController(
          initialIndex: 1,
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              ),
              title: const Text(
                'Discussion Forums',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              centerTitle: true,
              bottom: PreferredSize(
                preferredSize: const Size(30, 133),
                child: Column(
                  children: [
                    search(controller: searchController),
                    Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: 250,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            bottom: 15,
                          ),
                          child: TabBar(
                            indicator: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.green),
                              color: Colors.green,
                            ),
                            splashBorderRadius:
                            const BorderRadius.all(Radius.circular(55)),
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.grey,
                            indicatorColor: Colors.green,
                            tabs: const <Widget>[
                              Tab(
                                text: 'All',
                              ),
                              Tab(
                                text: 'My Forums',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                ListView.builder(
                  itemCount: 11,
                  itemBuilder: (context, index) {
                    return buildPosts(
                      title: '5 ways to save plants',
                      desc: '5 ways to save plants',
                      image: 'assets/images/blog.png',
                      userFName: 'Mariam',
                      userLName: 'Gaber',
                      userPic: 'assets/images/me2.jpg',
                      onLPressed: () {
                        setState(() {
                          isPress != isPress;
                          lNum++;
                        });
                      },
                      lNum: lNum,
                      isColor: isPress,
                      onCPressed: () {
                        setState(() {
                          isPress != isPress;
                          cNum++;
                        });
                      },
                      cNum: cNum,
                    );
                  },
                ),
                ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return buildPosts(
                      title: cubit.dataPosts.data![index].title!,
                      desc: cubit.dataPosts.data![index].description!,
                      image: cubit.dataPosts.data![index].imageUrl!,
                      userFName: cubit.dataPosts.data![index].user!.firstName!,
                      userLName: cubit.dataPosts.data![index].user!.lastName!,
                      userPic: cubit.dataPosts.data![index].user!.imageUrl!,
                      onLPressed: () {
                        setState(() {
                          isPress != isPress;
                          lNum++;
                        });
                      },
                      lNum: lNum,
                      isColor: isPress,
                      onCPressed: () {
                        setState(() {
                          cNum++;
                        });
                      },
                      cNum: cNum,
                    );
                  },
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                navigateTo(context, NewPost());
              },
              splashColor: Colors.grey,
              backgroundColor: Colors.green,
              elevation: 1.5,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget search({
    required TextEditingController controller,
  }) =>
      Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[100]!), // Creates border
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontFamily: 'Uchen',
                    fontWeight: FontWeight.w300),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                filled: true,
                fillColor: Colors.grey[100],
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey[100]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey[100]!),
                ),
              ),
            ),
          ),
        ),
      );

  Widget buildPosts(
      {required String userPic,
      required String userFName,
      required String userLName,
      required String desc,
      required String title,
      required String image,
      required onLPressed,
      required onCPressed,
      lNum = 0,
      cNum = 0,
      required isColor}) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 5, bottom: 5),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            width: 370,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[400]!),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(userPic),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$userFName $userLName',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '${DateTime.now()}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    desc,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12.5,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            image,
            alignment: Alignment.center,
            fit: BoxFit.cover,
            width: 370,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: onLPressed,
                        icon: Icon(
                          isColor == false
                              ? Icons.favorite_outline_rounded
                              : Icons.favorite,
                          color: isColor == false
                              ? Colors.grey[500]
                              : Colors.green,
                        )),
                    Text(
                      '$lNum likes',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 35,
              ),
              SizedBox(
                width: 100,
                child: Row(
                  children: [
                    TextButton(
                      onPressed: onCPressed,
                      child: Text(
                        '$cNum replies',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
