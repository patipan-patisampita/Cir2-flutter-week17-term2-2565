import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List list=[];
  ///===========Read Data============
  Future ReadData() async{
    final url ="http://192.168.1.110/flutter-api/controllers/readData.php";
    final res = await http.get(Uri.parse(url));

    if(res.statusCode == 200){
        final red = jsonDecode(res.body);

        setState(() {
          list.addAll(red);
          print(list);
        });
    }
    //return ReadData();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async{
    await ReadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Flutter API"),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("username"),
            subtitle: Text("มาร์ก เอลเลียต ซักเคอร์เบิร์ก"),
            leading: CircleAvatar(
              radius: 20.0,
              child: Text("An"),
            ),
            trailing: Container(
              width: 100.0,
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit,color: Colors.teal)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.delete,color: Colors.red)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
