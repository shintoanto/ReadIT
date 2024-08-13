import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyApi extends StatefulWidget {
  const MyApi({super.key});

  @override
  State<MyApi> createState() => _MyApiState();
}

final textControllerone = TextEditingController();

class _MyApiState extends State<MyApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Api"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textControllerone,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter input number"),
            ),
            ElevatedButton(
              onPressed: () {
                myApiWidget();
              },
              child: const Text('APi call'),
            ),
            Text(textControllerone.text)
          ],
        ));
  }

  Future<List<dynamic>> fetchUsers() async {
    var response = await http.get(
      Uri.parse("https://randomuser.me/api/?results=20"),
    );

    return jsonDecode(response.body)[0];
  }

  var response;

  @override
  void initState() {
    response = fetchUsers();
    super.initState();
  }

  myApiWidget() {
    return FutureBuilder(
      future: response,
      builder: (ctx, snpashot) {
        if (snpashot.hasData) {
          return ListView.builder(itemBuilder: (ctx, index) {
            return const Text("snapshot");
          });
        } else {
          return const Text('empy');
        }
      },
    );
  }
}
