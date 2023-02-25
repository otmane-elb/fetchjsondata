// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fullapp/model/post_model.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key, required this.post});
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post Number :${post.id}')),
      body: Column(
        children: [
          Text(
            'Publisher id :${post.userId}',
            style: TextStyle(color: Colors.red, fontSize: 20),
          ),
          Text(
            post.title!,
            style: TextStyle(color: Colors.purple, fontSize: 25),
            textAlign: TextAlign.center,
          ),
          Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(border: Border.all()),
              child: Text(
                post.body!,
                style: TextStyle(fontSize: 30),
              ))
        ],
      ),
    );
  }
}
