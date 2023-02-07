import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();

  List list = [];

  ///===========Read Data============
  Future<void> ReadData() async {
    final url = "http://192.168.1.110/flutter-api/controllers/readData.php";
    final res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      final red = jsonDecode(res.body);

      setState(() {
        list.addAll(red);
        print(list);
      });
    }
    //return ReadData();
  }

  ///===========Add Data============
  Future<void> AddData() async {
    final url = "http://192.168.1.110/flutter-api/controllers/readData.php";
    final res = await http.post(Uri.parse(url),body:{
      'username':username.text,
      'password':password.text,
      'name':name.text,
      'address':address.text,
    });

    if(res.statusCode == 200) {
      final red = jsonDecode(res.body);
      print(red);
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    await ReadData();
  }

  ///===========Add User Data============
  AddUser() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: 300,
            child: Column(
              children: [
                TextFormField(
                  controller: username,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Please input Email',
                    prefixIcon: Icon(Icons.email),
                    suffixIcon: Icon(Icons.check),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Please input Password',
                    prefixIcon: Icon(Icons.visibility),
                    suffixIcon: Icon(Icons.check),
                  ),
                  keyboardType: TextInputType.name,
                ),
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Please input Name',
                    prefixIcon: Icon(Icons.account_box),
                    suffixIcon: Icon(Icons.check),
                  ),
                  keyboardType: TextInputType.text,
                ),
                TextFormField(
                  controller: address,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    hintText: 'Please input Address',
                    prefixIcon: Icon(Icons.location_on),
                    suffixIcon: Icon(Icons.check),
                  ),
                  keyboardType: TextInputType.text,
                ),
                ElevatedButton(onPressed: () {
                  print(username.text);
                  print(password.text);
                  print(name.text);
                  print(address.text);
                  AddData();
                }, child: Text("Send"))
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Flutter API"),
        actions: [
          IconButton(
              onPressed: () {
                AddUser();
              },
              icon: Icon(Icons.add_location_outlined, size: 30.0))
        ],
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(list[index]['username']),
            subtitle: Text(list[index]['name']),
            leading: CircleAvatar(
              radius: 20.0,
              child: Text(list[index]['username']
                  .toString()
                  .substring(0, 2)
                  .toUpperCase()),
            ),
            trailing: Container(
              width: 100.0,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit, color: Colors.teal)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete, color: Colors.red)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
