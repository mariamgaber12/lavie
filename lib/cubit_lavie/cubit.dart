import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/models/about_user.dart';
import 'package:la_vie/models/get_posts.dart';
import 'package:la_vie/models/plants_model.dart';
import 'package:la_vie/models/products_models.dart';
import 'package:la_vie/models/seed_model.dart';
import 'package:la_vie/modules/discussions/discussion_forums.dart';
import 'package:la_vie/modules/home/home_page.dart';
import 'package:la_vie/modules/notifications/notifactions_page.dart';
import '../models/tool_model.dart';
import '../shared/components/constant.dart';
import '../layout/home_layout.dart';
import '../models/blog_model.dart';
import '../models/post_model.dart';
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
    const DiscussionForums(),
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
    if(index==4){
      const DiscussionForums();
    }
    if(index==5) {
      const UserProfilePage();
    }
    emit(LaVieBottomNavState());
  }

  void increment(number) => (number+=1);
  void decrement(number) => (number-=1);



  UserData datauser = UserData();

  Future<void> signup(String firstName,String lastName,String email, String password,context) async {
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
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${value.statusMessage}")));
        debugPrint("error${value.statusCode}");
      }
    });
  }

  AboutUser users = AboutUser();
  Future<void> getUserData(String USER, String TOKEN) async {
    await DioHelper.getData(url: USER, token: TOKEN).then((value) {
      users = AboutUser.fromJson(value.data);
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
      else {
        ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text("${value.statusMessage}")));
        debugPrint("error Login !!!!!!!!!!${value.statusCode}");
      }
    });
  }

  Products products = Products(data: []);
  PlantModel plants = PlantModel(data: []);
  SeedModel seeds = SeedModel(data: []);
  ToolModel tools = ToolModel(data: []);
  Future<void> getProducts(String PRODUCTS, String TOKEN) async {
    await DioHelper.getData(url: PRODUCTS, token: TOKEN).then((value) {
        products = Products.fromJson(value.data);
        if(products.type=='plant'){
          plants = PlantModel.fromJson(value.data);
        } else if(products.type=='seed'){
          tools = ToolModel.fromJson(value.data);
        }else{
          seeds = SeedModel.fromJson(value.data);
        }
      debugPrint(products.data![0].name);
    });
  }



  Post posts = Post();
  Future<void> postPosts(context,String POSTS, String title,String description,String imageUrl) async {
    String userId= datauser.data!.user!.userId!;
    var data = {"title":title,"description":description,"imageUrl":imageUrl,"userId":userId};
    await DioHelper.postData(url: POSTS,data: data).then((value) {
      if(value.statusCode==200) {
        debugPrint(posts.data!.title);
        debugPrint('post add successfully');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${value.statusMessage}")));
        debugPrint("post can't post now ${value.statusMessage}");

      }
    });
  }


  GetPosts dataPosts = GetPosts();
  Future<void> getPosts(String POSTS, String TOKEN) async {
    await DioHelper.getData(url: POSTS, token: TOKEN).then((value) {
      dataPosts = GetPosts.fromJson(value.data);
      debugPrint(value.statusCode.toString());
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