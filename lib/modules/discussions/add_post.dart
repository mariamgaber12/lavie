import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:la_vie/cubit_lavie/state.dart';
import 'package:la_vie/shared/components/components.dart';

import '../../cubit_lavie/cubit.dart';
import '../../shared/network/end_points.dart';

class NewPost extends StatefulWidget {
  NewPost({Key? key}) : super(key: key);

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  File? _file;

  Future pickCamera() async {
    final myCamPic = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _file = File(myCamPic!.path);
    });
  }

  Future pickGallery() async {
    final myGalPic = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _file = File(myGalPic!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LaVieCubit(),
      child: BlocConsumer<LaVieCubit,LaVieStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context,  state) {
          var cubit=LaVieCubit.get(context);
          return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
            title: const Text(
              'Create New Post',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              const SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 136,
                  width: 136,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.green),
                  ),
                  child: _file == null
                      ? Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              showBottomSheet();
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.green,
                              size: 20,
                            )),
                        const SizedBox(
                          height: 7,
                        ),
                        const Text(
                          'Add Photo',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  )
                      : changeImage(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 25, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Title',
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey[500]!),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.newline,
                    textAlign: TextAlign.start,
                    controller: titleController,
                    decoration: InputDecoration(
                      filled: false,
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
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Description',
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey[500]!),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.start,
                    controller: descController,
                    textInputAction: TextInputAction.newline,
                    maxLines: 99,
                    decoration: InputDecoration(
                      filled: false,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: buildLoginButton(
                    onPressed: () {
                      final bytes = File(_file!.path).readAsBytesSync();
                      String base64Image =  "data:image/png;base64,${base64Encode(bytes)}";
                      //print("img_pan : $base64Image");
                      cubit.postPosts(context,POSTS, titleController.text, descController.text, base64Image);
                    },
                    name: 'Post',
                    width: double.infinity),
              ),
            ],
          ),
        ); },
      )
    );
  }

  Future<void> showBottomSheet() => showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.grey[500]!,
            ),
            color: Colors.transparent,
          ),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                        onPressed: () {
                          pickCamera();
                        },
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          size: 40,
                          color: Colors.green,
                        )),
                    const SizedBox(
                      width: 30,
                    ),
                    IconButton(
                        onPressed: () {
                          pickGallery();
                        },
                        icon: const Icon(
                          Icons.filter_outlined,
                          size: 40,
                          color: Colors.green,
                        )),
                  ],
                ),
                buildLoginButton(
                    onPressed: () {
                      Navigator.pop(context);
                      print('photo added');
                    },
                    name: 'Add',
                    width: 100),
              ],
            ),
          ),
        );
      });

  Widget changeImage() {

    return SizedBox(
      height: 150,
      width: 150,
      child: Stack(children: [
        Image.file(
          _file!,
          height: 150,
          width: 150,
          fit: BoxFit.cover,
        ),
        Align(
          //alignment: AlignmentDirectional.bottomEnd,
          alignment: AlignmentDirectional.bottomEnd,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: (){
                showBottomSheet();
              },
              icon: Icon(Icons.edit,size: 25,color: Colors.green,),
            ),
          ),
        ),
      ]),
    );
  }
}
