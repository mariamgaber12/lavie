import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class CartPage extends StatelessWidget {
  final int cartIndex;

  const CartPage({Key? key, required this.cartIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: cartIndex == 0
            ? null
            : IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: cartIndex == 0 ? false : true,
      ),
      body: ListView(
        children: [
          back(),
        ],
      ),
      bottomNavigationBar: cartIndex == 0 ? null : buildBottomBar(),
    );
  }

  Widget back() {
    if (cartIndex == 0) {
      return buildEmptyCartBody();
    } else {
      return buildCartBody(totalPrice:cartIndex*200.0, cartIndex: cartIndex);
    }
  }

  Widget buildBottomBar({double totalPrice= 1000.00 }) {
    return Container(
      height: 120,
      padding: const EdgeInsets.only(right: 15, left: 8, bottom: 5, top: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const Text(
                '     Total',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.green),
                // maxLines: 2,
                // overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Text(
                '$totalPrice EGP',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.green),
                // maxLines: 2,
                // overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const SizedBox(height: 15,),
          SizedBox(
            width: 300,
            height: 45,
            child: MaterialButton(
              animationDuration: const Duration(milliseconds: 200),
              onPressed: () {},
              color: Colors.green,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              child: const Text(
                'Checkout',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
