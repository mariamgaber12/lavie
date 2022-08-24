import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/cubit_lavie/cubit.dart';
import 'package:la_vie/cubit_lavie/state.dart';
import 'package:la_vie/shared/components/components.dart';
import 'details_blog.dart';

class BlogsPage extends StatefulWidget {
  const BlogsPage({Key? key}) : super(key: key);

  @override
  State<BlogsPage> createState() => _BlogsPageState();
}

class _BlogsPageState extends State<BlogsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaVieCubit, LaVieStates>(
        builder: (context, state) {
          var cubit = LaVieCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              title: const Text('Blogs'),
              centerTitle: true,
            ),
            body: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return buildBlogCart(
                  blogTitle: '${cubit.blogs.data!.length}',
                  blogImage: '${cubit.blogs.data!.length}',
                  blogDesc:  '${cubit.blogs.data!.length}',
                  blogTime:  '${cubit.blogs.data!.length}',
                  onTap: () {
                    setState(
                      () => navigateTo(
                        context,
                        DetailsBlog(
                            blogTitle: "${cubit.blogs.data!.length}",
                            blogDesc: "${cubit.blogs.data!.length}",
                            blogImage: "${cubit.blogs.data!.length}",
                            blogTime: "${cubit.blogs.data!.length}"),
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
              itemCount: 10,
            ),
          );
        },
        listener: (context, state) {});
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
                  child: Image.asset(blogImage),
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
