import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startup/controllers/post.dart';
import 'package:startup/controllers/todo.dart';
import 'package:startup/components/app.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  void initState() {
    super.initState();
    Post.get();
  }

  @override
  Widget build(BuildContext context) {
    return appDirection(
        child: Scaffold(
      appBar: appBar(title: "Posts", action: [
        IconButton(
          onPressed: () {
            Todo.removeAll();
            appAlert(
                context,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "All Todos Were Removed",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24),
                    ),
                   const SizedBox(height: 10,),
                    MaterialButton(
                      onPressed: () {
                        Get.back();
                        Get.back();
                      },
                      color: Colors.blueAccent,
                      child: const Text(
                        "ok",
                        style: TextStyle(color: Colors.white),
                      ),

                    )
                  ],
                ));
          },
          icon: const Icon(Icons.delete_forever),
        )
      ]),
      body: Obx(() => Post.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : Container(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: Post.list.length,
                itemBuilder: ((context, index) => Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: ListTile(
                        title: Text(Post.list[index]["title"]),
                        subtitle: Text(Post.list[index]["body"]),
                      ),
                    )),
              ),
            )),
    ));
  }
}
