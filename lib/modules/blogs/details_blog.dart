import 'package:flutter/material.dart';

class DetailsBlog extends StatelessWidget {
  const DetailsBlog(
      {Key? key,
      required this.blogTitle,
      required this.blogDesc,
      required this.blogImage,
      required this.blogTime})
      : super(key: key);

  final blogTitle;
  final blogDesc;
  final blogImage;
  final blogTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.asset(
              blogImage
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '      $blogTitle',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 5, left: 25, bottom: 9, top: 9),
                        child: Text(
                          '$blogDesc',
                          maxLines: 2,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: 6,
              //separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 10,); },
            ),
          ),
        ],
      ),
    );
  }
}
