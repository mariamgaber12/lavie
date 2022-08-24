import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/models/about_user.dart';
import 'package:la_vie/models/products_models.dart';
import 'package:la_vie/modules/home/home_page.dart';
import 'package:la_vie/modules/notifications/notifactions_page.dart';
import '../constant.dart';
import '../layout/home_layout.dart';
import '../models/blog_model.dart';
import '../models/user_data.dart';
import '../modules/blogs/blogs_page.dart';
import '../modules/scan_code/scan_code_page.dart';
import '../modules/user_profile/user_profile_page.dart';
import '../shared/network/dio_helper.dart';
import '../shared/network/end_points.dart';
import 'state.dart';

class LaVieCubit extends Cubit<LaVieStates> {

  LaVieCubit() : super(LaVieInitialState());

  static LaVieCubit get(context) => BlocProvider.of(context);

  List<Widget> homeScreens = [
    const BlogsPage(),
     ScanCodePage(),
    const HomePage(),
    const NotificationsPage(),
    const UserProfilePage(),
  ];


  int homeIndex = 2;
  void changeBottomNavBar(int index) {
    homeIndex = index;
    if(index==0) {
      BlogsPage;
    }
    if(index==1) {
       ScanCodePage();
    }
    if(index==2) {
      const HomePage();
    }
    if(index==3) {
      const NotificationsPage();
    }
    if(index==4) {
      const UserProfilePage();
    }
    emit(LaVieBottomNavState());
  }


  int increment({required number}) => number++;
  int decrement({required number}) => number--;

  UserData datauser = UserData();

  Future<void> signup(String firstName,String lastName,String email, String password,context) async
  {
    var data = {"firstName": firstName,"lastName": lastName,"email": email,"password": password};
    await DioHelper.postData(
      url: SIGNUP,
      data: data,
    ).then((value) {
      if (value.statusCode == 200) {
        // debugPrint(value.data);
        datauser = UserData.fromJson(value.data);
        debugPrint(datauser.data!.accessToken);
        TOKEN = datauser.data!.accessToken.toString();
        //debugPrint(TOKEN);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeLayout() as Widget,
          ),
        );
        debugPrint(datauser.data!.user!.lastName);
        // debugPrint(datauser.data!.user!.imageUrl);
        // navigate to new screen
      } else {
        debugPrint("error${value.statusCode}");
      }
    });
  }

  AboutUser users = AboutUser();
  Future<void> getUserData(String USER, String TOKEN) async {
    await DioHelper.getData(url: USER, token: TOKEN).then((value) {
      users = User.fromJson(value.data) as AboutUser;
    });
  }

  Future<void> login(String email, String password,context) async {
    var data = {"email": email, "password": password};
    await DioHelper.postData(
      url: LOGIN,
      data: data,
    ).then((value) {
      if (value.statusCode == 200) {
        // debugPrint(value.data);
        datauser = UserData.fromJson(value.data);
        // debugPrint(datauser.data!.accessToken);
        TOKEN = datauser.data!.accessToken.toString();
        debugPrint(TOKEN);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  const HomeLayout() as Widget,
          ),
        );
        //navigateTo(context, HomeLayout);
        //debugPrint(datauser.data!.user!.lastName);
        // debugPrint(datauser.data!.user!.imageUrl);
        // navigate to new screen
      }
      else if(value.statusCode==400){
        debugPrint('we are in login${value.statusMessage}');
      }
      else {
        debugPrint("error Login !!!!!!!!!!${value.statusCode}");
      }
    });
  }

  Products products = Products(data: []);
  Future<void> getProducts(String PRODUCTS, String TOKEN) async {
    await DioHelper.getData(url: PRODUCTS, token: TOKEN).then((value) {
        products = Products.fromJson(value.data);
      debugPrint(products.data![0].name);
    });
  }
/*
  Plant plants = Plant();
  Future<void> getPlants(String PLANTS, String TOKEN) async {
    await DioHelper.getData(url: PLANTS, token: TOKEN).then((value) {
      plants = Plant.fromJson(value.data);
      debugPrint(plants.data![0].name);
    });
  }

  Seed seeds = Seed();
  Future<void> getSeeds(String SEEDS, String TOKEN) async {
    await DioHelper.getData(url: SEEDS, token: TOKEN).then((value) {
      seeds = Seed.fromJson(value.data);
      debugPrint(seeds.data![0].name);
    });
  }

  Tool tools = Tool();
  Future<void> getTools(String TOOLS, String TOKEN) async {
    await DioHelper.getData(url: TOOLS, token: TOKEN).then((value) {
      tools = Tool.fromJson(value.data);
      debugPrint(tools.data![0].name);
    });
  }
*/
  Blog blogs = Blog(data: []);
  Future<void> getBlogs(String BLOGS, String TOKEN) async {
    await DioHelper.getData(url: BLOGS, token: TOKEN).then((value) {
      blogs = Blog.fromJson(value.data);
      //debugPrint(blogs.data![0]);
    });
  }


}