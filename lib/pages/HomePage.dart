import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  dynamic data;
  bool isLoading = true;
  
  Future<void> getInformation() async {
    isLoading = true;
    setState(() {});
    final url = Uri.parse("http://universities.hipolabs.com/search?count=Uzbekistan");
    final res = await http.get(url);
    data = jsonDecode(res.body);
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    getInformation();
    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Universities"),
        ),
        body: isLoading ? const Center(child: CircularProgressIndicator(),)
        : ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: 16),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(32),),
                color: Colors.blueAccent.withOpacity(0.5),
              ),
                child: Text(data[index]["name"],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
            );
          },
        ));
  }
}
