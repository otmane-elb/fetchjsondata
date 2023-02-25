import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PostView extends StatelessWidget {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostView(
      {super.key,
      required this.userId,
      required this.id,
      required this.title,
      required this.body});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 100,
        decoration: BoxDecoration(border: Border.all(width: 1)),
        child: Column(
          children: [
            Text(
              '$title',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              '$body',
              style: const TextStyle(fontSize: 15),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
