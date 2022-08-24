import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/cubit_lavie/state.dart';
import 'package:la_vie/modules/cart/cart_page.dart';
import 'package:la_vie/modules/exam/exam_page.dart';
import 'package:la_vie/shared/components/components.dart';
import 'package:la_vie/shared/network/end_points.dart';
import '../../constant.dart';
import '../../cubit_lavie/cubit.dart';
import '../../models/question_model.dart';
import 'search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controllerSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int cartIndex = 0;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width / .63;

    return BlocProvider(
      create: (context) => LaVieCubit()..getProducts(PRODECTS, TOKEN!),
      child: BlocConsumer<LaVieCubit, LaVieStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var myCubit = LaVieCubit.get(context);
          return DefaultTabController(
            initialIndex: 0,
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                title: Image.asset(
                  'assets/images/logoo.png',
                  fit: BoxFit.cover,
                  height: 50,
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      navigateTo(context, ExamPage(questions1));
                    },
                    child: const CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.question_mark_outlined,
                          size: 25,
                          color: Colors.white,
                        )),
                  ),
                ],
                centerTitle: true,
                bottom: PreferredSize(
                  preferredSize: const Size(200, 150),
                  child: Column(
                    children: [
                      //search
                      Row(
                        children: [
                          buildSearch(
                              onSubmit: () {
                                debugPrint('Okay');
                              },
                              isAuto: false,
                              controller: controllerSearch,
                              onTap: () {
                                navigateTo(context, SearchPage());
                              }),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                                height: 47,
                                width: 45,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: IconButton(
                                    onPressed: () {
                                      navigateTo(
                                          context,
                                          CartPage(
                                            cartIndex: cartIndex,
                                          ));
                                    },
                                    icon: const Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.white,
                                    ))),
                          )
                        ],
                      ),
                      //topics
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: TabBar(
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            border: Border.all(
                                color: Colors.green), // Creates border
                            color: Colors.transparent,
                          ),
                          splashBorderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          labelColor: Colors.green,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: Colors.transparent,
                          tabs: const <Widget>[
                            Tab(
                              text: 'All',
                            ),
                            Tab(
                              text: 'Plants',
                            ),
                            Tab(
                              text: 'Seeds',
                            ),
                            Tab(
                              text: 'Tools',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  //all
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: width / height),
                    itemCount: myCubit.products.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildPlantsCard(
                        number: cartIndex,
                        minPressed: () => myCubit.decrement(number: cartIndex),
                        addPressed: () => myCubit.increment(number: cartIndex),
                        context: context,
                        onPressed: () {},
                        productImage: myCubit.products.data![index].imageUrl,
                        productPrice: myCubit.products.data![index].price,
                        productName: myCubit.products.data![index].name,
                      );
                    },
                  ),
                  //plants
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: width / height),
                    itemCount: myCubit.products.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildPlantsCard(
                        number: cartIndex,
                        minPressed: () => myCubit.decrement(number: cartIndex),
                        addPressed: () => myCubit.increment(number: cartIndex),
                        context: context,
                        onPressed: () {},
                        productImage: myCubit.products.data![index].imageUrl,
                        productPrice: myCubit.products.data![index].price,
                        productName: myCubit.products.data![index].name,
                      );
                    },
                  ),
                  //seeds
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: width / height),
                    itemCount: myCubit.products.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildPlantsCard(
                        number: cartIndex,
                        minPressed: () => myCubit.decrement(number: cartIndex),
                        addPressed: () => myCubit.increment(number: cartIndex),
                        context: context,
                        onPressed: () {},
                        productImage: myCubit.products.data![index].imageUrl,
                        productPrice: myCubit.products.data![index].price,
                        productName: myCubit.products.data![index].name,
                      );
                    },
                  ),
                  //tools
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: width / height),
                    itemCount: myCubit.products.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildPlantsCard(
                        number: cartIndex,
                        minPressed: () => myCubit.decrement(number: cartIndex),
                        addPressed: () => myCubit.increment(number: cartIndex),
                        context: context,
                        onPressed: () {},
                        productImage: myCubit.products.data![index].imageUrl,
                        productPrice: myCubit.products.data![index].price,
                        productName: myCubit.products.data![index].name,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
