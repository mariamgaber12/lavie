import 'package:bloc/bloc.dart';
import 'package:la_vie/models/Cart_model.dart';
import 'package:la_vie/modules/cart/cart_page.dart';
import 'package:sqflite/sqflite.dart';
import 'dbstates.dart';


class CartCubit extends Cubit<Cartstates> {
  CartCubit() : super(CartInitialState());

  Database? database;
  Cart cart = Cart();

//create DB in local
  void creatdb() {
    openDatabase(
      'cart.db',
      version: 1,
      onCreate: (database, version) {
        print('DataBase created');
        database
            .execute(
            'create TABLE Cart(id INTEGER PRIMARY KEY,image TEXT,title TEXT, date TEXT, time TEXT,price INT status TEXT)')
            .then((value) {
          print('Table created');
        }).catchError((error) {
          print('Error when created table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getdb(database);
        print('DataBase Opened');
      },
    ).then((value) {
      database = value;
      emit(CartCreateDB());
    });
  }
  int? id;

//insert  in local DB
  insertdb({
    required String image,
    required String name,
    required int price,
  }) async {
    await database!.transaction((txn) async {
      id = await txn
          .rawInsert(
          'INSERT INTO Cart ( image,name,price,status) VALUES ("$image,"$name","$price",new")')
          .then((value) {
        print('$value INSERT successfully');
        emit(CartInsertDB());
        getdb(database);
      }).catchError((error) {
        print('Error when Inserting NEW record ${error.toString()}');
      });
      return null;
    });
  }

 List Carts = [];
//get from local DB
  void getdb(database) {
    emit(CartGetDBloadingstate());
    database.rawQuery('SELECT * FROM Cart').then((value) {
      value.forEach((element) {
         Carts.add(element);
      });
      emit(CartGetDB());
    });
  }


  void deletDB({
    required int id,
  }) async {
    database!.rawDelete('DELETE FROM Cart WHERE id = ?', [id]).then((value) {
      getdb(database);
      emit(CartDeleteDB());
    });
  }

  Future close() async => database!.close();


}