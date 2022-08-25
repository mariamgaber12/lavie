import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/cubit_lavie/cubit.dart';
import 'package:la_vie/cubit_lavie/state.dart';
import 'package:la_vie/shared/components/components.dart';
import '../../shared/components/constant.dart';
import '../../shared/network/end_points.dart';
import 'details_blog.dart';

class BlogsPage extends StatefulWidget {
  const BlogsPage({Key? key}) : super(key: key);

  @override
  State<BlogsPage> createState() => _BlogsPageState();
}

class _BlogsPageState extends State<BlogsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          LaVieCubit()..getProducts(PRODECTS, TOKEN!),
      child: BlocConsumer<LaVieCubit, LaVieStates>(
          builder: (context, state) {
            var cubit = LaVieCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 2,
                    color: Colors.white,
                  ),
                ),
                title: const Text('Blogs'),
                centerTitle: true,
              ),
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                cubit.products.data!.isEmpty
                    ? const Center(child: CircularProgressIndicator(color: Colors.green))
                    : ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return buildBlogCart(
                            blogTitle: 'Saguaro Cactus Blossom',
                            blogImage:
                                'https://lavie.orangedigitalcenteregypt.com/uploads/76cf5190-3183-44bc-8d52-093f1de5eb87.png',
                            blogDesc:
                                'Arizona achieved statehood',
                            blogTime: '2 days ago',
                            onTap: () {
                              setState(
                                () => navigateTo(
                                  context,
                                  const DetailsBlog(
                                    blogTitle: 'Saguaro Cactus Blossom',
                                    blogImage:
                                    'https://lavie.orangedigitalcenteregypt.com/uploads/76cf5190-3183-44bc-8d52-093f1de5eb87.png',
                                    blogDesc:
                                    'Arizona achieved statehood',
                                    blogTime: '2 days ago',
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: 7,
                      ),
              ]),
            );
          },
          listener: (context, state) {}),
    );
  }

  Widget buildBlogCart(
      {required onTap,
      required blogImage,
      required blogTitle,
      required blogDesc,
      required blogTime}) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: onTap,
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
                  child: Image.network(
                      "https://lavie.orangedigitalcenteregypt.com$blogImage"),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$blogTime',
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$blogTitle',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '''$blogDesc \n\n $blogDesc ''',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.w200),
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
}
