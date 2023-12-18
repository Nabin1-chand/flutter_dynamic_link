import 'dart:convert';
import 'dart:developer';

import 'package:deep_linking/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailsScreen extends StatefulWidget {
  final String id;
  const DetailsScreen({super.key, required this.id});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  static Future<FakeData> getData({required id}) async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/todos/$id");
    final response =
        await http.get(url, headers: {"Content-Type": "application/json"});
    log(response.body);
    return FakeData.fromJson(json.decode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<FakeData>(
          // future: getData(id: widget.id),
          future: getData(id: widget.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              final posts = snapshot.data!;
              return buildPosts(posts);
            } else {
              return const Text("No data available");
            }
          },
        ),
      ),
    );
  }

  Widget buildPosts(FakeData posts) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      height: 100,
      width: double.maxFinite,
      child: Row(
        children: [
          Expanded(flex: 3, child: Text(posts.title ?? '')),
        ],
      ),
    );
  }
}
