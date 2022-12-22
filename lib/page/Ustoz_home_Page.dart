import 'package:flutter/material.dart';
import 'package:todolist/page/Ustoz_add_todo.dart';
import 'package:todolist/store/Ustoz_store.dart';
import 'package:todolist/style/Ustoz_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> listOfTodo = [];

  @override
  void initState() {
    super.initState();
  }

  Future getInfo() async {
    listOfTodo = await LocalStore.getListTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Todo List",
          style: Style.textStyleNormal(),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        itemCount: listOfTodo.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Checkbox(
                  value: true,
                  onChanged: (value) {

                  }),
              Text(
                listOfTodo[index],
                style: Style.textStyleNormal(isDone: false),
              ),
            ],
          );
        },
      ),
      floatingActionButton: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_){
            return AddTodoPage();
          },),);
        },
        child: Container(
          height: 64,
          width: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: Style.primaryGradient,
          ),
          child: Icon(
            Icons.add,
            color: Style.whiteColor,
          ),
        ),
      ),
    );
  }
}
