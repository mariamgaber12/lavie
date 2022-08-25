import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  TextEditingController controllerSearch = TextEditingController();
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    int cartIndex = 1;
    int plsNumber = 0;
    int minNumber = 0;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width / .63;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            buildSearch(
              isAuto: true,
              controller: controllerSearch,
              onSubmit: () {
                  isOpen = false;
              },
            ),
            isOpen == false
                ? buildEmptySearchPage(totalSearch: 0)
                : Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: width / height),
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return buildPlantsCard(
                          minPressed: () => minNumber--,
                          addPressed: () => plsNumber++,
                          context: context,
                          onPressed: () {
                            cartIndex += plsNumber - minNumber;
                          },
                          number: cartIndex += plsNumber - minNumber,
                          productImage: "assets/images/plants.png",
                          productPrice: "200",
                          productName: "American Marigold",
                        );
                      },
                    ),
                ),
          ],
        ),
      ),
    );
  }

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
