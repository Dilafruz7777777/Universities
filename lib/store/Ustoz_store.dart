import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStore{

  LocalStore._();
  static setListTodo(List<String> todos) async {
    SharedPreferences store = await SharedPreferences.getInstance();
    store.setStringList("todo", todos);
  }

  static Future<List<String>> getListTodo() async {
    SharedPreferences store = await SharedPreferences.getInstance();
    return store.getStringList("todo") ?? [];
  }

}