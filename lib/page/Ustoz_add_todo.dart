import 'package:flutter/material.dart';
import 'package:todolist/style/Ustoz_style.dart';
class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {

  bool isEmpty = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Todo", style: Style.textStyleSemiBold(textColor:Style.whiteColor),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: TextFormField(
            maxLines: 2,

            decoration: InputDecoration(
              


              labelText: "Text",
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(),
              errorBorder: OutlineInputBorder(),
              disabledBorder: OutlineInputBorder(),

            ),
          ),
        ),
      ),


      // buttonni centerga qo'yish
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      floatingActionButton: Container(
        margin:  EdgeInsets.symmetric(horizontal: 24),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          gradient: isEmpty ? Style.primaryDisableGradient : Style.primaryGradient,
          borderRadius: BorderRadius.all(Radius.circular(100),),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: (){
            Navigator.pop(context);
          },

          child: Center(
            child: Text("Add", style: Style.textStyleNormal(textColor: Style.whiteColor, size: 20),),
          ),
        ),
      ),
    );
  }
}
