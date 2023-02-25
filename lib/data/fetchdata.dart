import 'dart:convert';

import 'package:fullapp/model/post_model.dart';
import 'package:http/http.dart' as http;

class Getdata {
  static Future<List<Post>> fetch() async {
    final result =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var posts = <Post>[];
    if (result.statusCode == 200) {
      var postsJson = jsonDecode(result.body);
      for (var postjson in postsJson) {
        posts.add(Post.fromJson(postjson));
      }
    }

    return posts;
  }
}
