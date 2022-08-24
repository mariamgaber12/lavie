import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  TextEditingController controllerSearch = TextEditingController();
  bool isOpen = false;
  late bool isBack ;
  @override
  Widget build(BuildContext context) {
    int totalSearch = 0;
    int cartIndex = 0;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width / .63;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: ListView(
          children: [
            buildSearch(
              sufixIcon: SizedBox(
                  height: 2.5,
                  width: 2.5,
                  child: Image.asset(
                    'assets/images/filter.png',
                    height: 2,
                    width: 2,
                  )),
              isAuto: true,
              controller: controllerSearch,
              onSubmit: () {
                if(controllerSearch.text.isEmpty) {
                  isBack=false;
                } else {
                  isBack = true;
                  isOpen=true;
                }
              },
            ),
            //ck(totalSearch: totalSearch,width: width,height: height,cartIndex: cartIndex),
          ],
        ),
      ),
    );
  }

/*
  Future<Widget> Back({totalSearch,width,height,cartIndex}) async {
    if (isOpen==true && isBack==true) {
      return buildEmptySearchPage(totalSearch: totalSearch);
    } else if (isOpen==true && isBack==false) {
      return Container(height: 600,color: Colors.white);
    } else if(isOpen==false && isBack==true) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: width / height),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return buildPlantsCard(
              context: context,
              onPressed: () {
                cartIndex++;
              });
        },
      );
    }
  }
*/

  buildEmptySearchPage({required int totalSearch}) {
    return SizedBox(
      height: 600,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Results for ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  '"${controllerSearch.text}"',
                  style: const TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                Text(
                  '$totalSearch found',
                  style: const TextStyle(
                      color: Colors.green,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Expanded(flex: 3, child: buildEmptyCartBody()),
        ],
      ),
    );
  }
}
