import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startup/controllers/todo.dart';
import '../styles/styles.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Todo.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          padding: const EdgeInsets.all(5),
          child: Obx(() => Todo.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0),
                  itemCount: Todo.list.length,
                  itemBuilder: ((context, index) {
                    print(index);
                    return InkWell(
                        onTap: () {
                          Todo.updateStatus(index);
                        },
                        child: todoContainer(Todo.list[index]));
                  }),
                ))),
    );
  }
}
