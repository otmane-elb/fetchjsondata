import 'package:flutter/material.dart';
import 'package:fullapp/data/fetchdata.dart';
import 'package:fullapp/model/post_model.dart';
import 'package:fullapp/view/post_view.dart';
import 'package:fullapp/view/specificPostView.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Post> posts = <Post>[];

  late Future<Post> futurepost;
  test(String text) {
    if (text.length > 2) text = text.substring(0, 2);
  }

  int length = 0;
  bool end = false;
  @override
  void initState() {
    Getdata.fetch().then((value) {
      setState(() {
        posts.addAll(value);
        length = 10;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts Page'),
      ),
      body: NotificationListener<ScrollEndNotification>(
        onNotification: (scrollEnd) {
          final metrics = scrollEnd.metrics;
          if (metrics.atEdge) {
            bool isTop = metrics.pixels == 0;
            if (isTop) {
              print('At the top');
              const snackBart = SnackBar(
                content: Text('You have reached the top of the page '),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBart);
            } else {
              print('At the bottom');
              setState(() {
                if (length < posts.length - 4) {
                  length = length + 5;
                  print(length);
                  const snackBara = SnackBar(
                    content: Text('5 Posts added to your page '),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBara);
                } else {
                  print('end of page');
                  end = true;
                  const snackBar = SnackBar(
                    content: Text('You have reached the end of the page '),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              });
            }
          }
          return true;
        },
        child: ListView.builder(
          itemCount: length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailView(post: posts[index]),
                  ),
                );
              },
              child: PostView(
                  userId: posts[index].userId,
                  id: posts[index].id,
                  title:
                      '${posts[index].title!.split(" ").elementAt(0)} ${posts[index].title!.split(" ").elementAt(1)} ...',
                  body: posts[index].body),
            );
          },
        ),
      ),
    );
  }
}



/* FutureBuilder<Post>(
          future: futurepost,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GestureDetector(
                onTap: () {
                  //here i will put the popping page
                },
                child: PostView(
                  userId: snapshot.data!.userId,
                  id: 1,
                  body: '${snapshot.data!.body}',
                  title:
                      '${snapshot.data!.title!.split(" ").elementAt(0)} ${snapshot.data!.title!.split(" ").elementAt(1)} ...',
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        )*/