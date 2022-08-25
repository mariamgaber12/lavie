import 'package:flutter/material.dart';
import 'package:la_vie/shared/components/constant.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

Widget buildDesign({required mainAxis, required img, required align}) =>
    Container(
      color: Colors.transparent,
      height: 200,
      width: 130,
      child: Row(
        mainAxisAlignment: mainAxis,
        children: [
          Align(
            alignment: align,
            child: Image(
              image: img,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );

Widget buildLogo() => Stack(
      alignment: Alignment.center,
      children: const [
        Image(
            image: AssetImage(
              'assets/images/name.png',
            ),
            height: 44),
        Image(
          image: AssetImage(
            'assets/images/logo.png',
          ),
          height: 20,
          width: 23,
        ),
      ],
    );

TextStyle textstyle = const TextStyle(
  color: Colors.green,
  fontWeight: FontWeight.w600,
  fontSize: 17,
  fontFamily: 'Uchen',
  decorationStyle: TextDecorationStyle.solid,
);

Widget myLine(
        {double? left,
        double? right,
        required double width,
        required Color color,
        double top = 2.0}) =>
    Padding(
      padding: EdgeInsets.only(left: left!, right: right!, top: top, bottom: 5),
      child: Container(
        height: 1,
        width: width,
        color: color,
      ),
    );

Widget defaulttaskFormField({
  required TextEditingController controller,
  required TextInputType type,
  required validate,
  required String hint,
  bool isClickable = true,
  bool isPass = false,
  Widget? suffixIcon,
  double right = 45.0,
  double left = 45.0,
  double width = double.infinity,
}) =>
    Padding(
      padding: EdgeInsets.only(right: right, left: left, top: 15, bottom: 15),
      child: SizedBox(
        height: 44,
        width: width,
        child: TextFormField(
          controller: controller,
          autofocus: false,
          keyboardType: type,
          obscureText: isPass,
          textInputAction: TextInputAction.next,
          enabled: isClickable,
          validator: validate,
          decoration: InputDecoration(
            suffixIcon: suffixIcon!,
            labelText: hint,
            labelStyle: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontFamily: 'Uchen',
                fontWeight: FontWeight.w300),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.green),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.green),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.green),
            ),
          ),
        ),
      ),
    );

Widget buildLoginButton(
        {required onPressed, required name, required double width}) =>
    Padding(
      padding: const EdgeInsets.only(right: 45, left: 45, top: 15, bottom: 15),
      child: Container(
        height: 45,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.green,
        ),
        child: MaterialButton(
          splashColor: Colors.grey,
          onPressed: onPressed,
          child: Text(
            name,
            style: textstyle.copyWith(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );

Widget buildLoginDivider() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        myLine(
            right: 5, left: 30, top: 10, color: Colors.grey[400]!, width: 90),
        Text(
          'or continue with',
          style: TextStyle(fontSize: 12, color: Colors.grey[400]),
        ),
        myLine(
            right: 30, left: 5, top: 10, color: Colors.grey[400]!, width: 90),
      ],
    );

Widget buildSigninWithOther({required onFPressed, required onGTap}) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 30),
          child: GestureDetector(
            onTap: onGTap,
            child: const CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white,
              child: Image(
                image: AssetImage('assets/images/google.png'),
                height: 40,
                width: 40,
              ),
            ),
          ),
        ),
        CircleAvatar(
          radius: 44,
          backgroundColor: Colors.white,
          child: IconButton(
            onPressed: onFPressed,
            icon: Icon(
              Icons.facebook_outlined,
              size: 40,
              color: Colors.blue[900],
            ),
          ),
        ),
      ],
    );

Widget buildSearch({
  required TextEditingController controller,
  onTap,
  Function? onSubmit,
  bool isClickable = true,
  bool isAuto = false,
}) =>
    Padding(
      padding: const EdgeInsets.only(right: 3.5, left: 15, top: 15, bottom: 15),
      child: Container(
        width: 300,
        height: 47,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[100]!), // Creates border
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: TextFormField(
            onFieldSubmitted: onSubmit!(),
            controller: controller,
            autofocus: isAuto,
            keyboardType: TextInputType.text,
            //onFieldSubmitted: onSubmit(),
            onTap: onTap,
            //onSaved: onSaved,
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
                borderSide: BorderSide(color: Colors.grey[100]!)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey[100]!),
              ),
            ),
          ),
        ),
      ),
    );

Widget buildPlantsCard(
        {required minPressed,
        required addPressed,
        context,
        required number,
        required onPressed,
        required productName,
        required productPrice,
        required productImage}) =>
    Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
        top: 20,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 25,
            ),
            child: Container(
              height: 200,
              width: 180,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[100],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //number of plants
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 1, bottom: 30, right: 1, left: 48),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        IconButton(
                          onPressed: addPressed,
                          icon: const Icon(
                            Icons.add,
                            size: 20,
                          ),
                        ),
                        Text(
                          '$number',
                          style: textstyle.copyWith(color: Colors.black),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: IconButton(
                              onPressed: minPressed,
                              icon: const Icon(
                                Icons.minimize,
                                size: 20,
                              )),
                        ),
                      ],
                    ),
                  ),

                  //plants name & price
                  Padding(
                    padding: const EdgeInsets.only(left: 2, top: 5, right: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$productName',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '$productPrice EGP',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //button
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 10, left: 10, top: 5, bottom: 10),
                    child: Container(
                      height: 44,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ElevatedButton(
                          onPressed: onPressed,
                          child: const Text(
                            'Add To Cart',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -5,
            left: -22,
            child: Image.network(
              'https://lavie.orangedigitalcenteregypt.com$productImage',
              height: 105,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );


Widget buildNotifications() => Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.green,
                  backgroundImage: AssetImage( 'assets/images/me2.jpg',),

                ),
              ),
            ),
            Column(
              children: [
                const Text(
                  'mariam liked your photo',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: 'Uchen'),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${DateTime.now()}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

Widget buildEmptyCartBody() {
  return SizedBox(
    height: 555,
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/ecart.png',
          height: 250,
          width: 250,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 33,
        ),
        const Text(
          'Your cart is empty',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          'Sorry, the keyword you entered cannot be\n'
          'found, please check again or search with\n'
          '                       another keyword.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    ),
  );
}

Widget buildCartBody(
    {required double totalPrice,
    required price,
    required onDpress,
    required cartIndex,
    required image,
    required name}) {
  return SizedBox(
    height: 600,
    child: Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        shadowColor: Colors.grey[100],
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                height: 130,
                width: 140,
                color: Colors.transparent,
                child: Image.asset('$image'),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$name',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$price EGP',
                    style: const TextStyle(
                        color: Colors.green,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                color: Colors.green,
                                size: 20,
                              ),
                            ),
                            Text(
                              '$cartIndex',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.minimize,
                                    color: Colors.green,
                                    size: 20,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: onDpress,
                          icon: const Icon(
                            Icons.delete,
                            size: 25,
                            color: Colors.green,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
