import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Now extends StatelessWidget {
  const Now({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         centerTitle: true,
        title: Text("Weather"),
      ),
    );
  }
}
