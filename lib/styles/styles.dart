import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todo.dart';
import '../controllers/app.dart';

appDirection({required Widget child}) {
  return Obx(() => Directionality(
      textDirection: App.dirc.value == "ltr" ? TextDirection.ltr : TextDirection.rtl,
      child: child));
}

todoContainer(var todo) {
  return Container(
    padding: const EdgeInsets.all(12),
    margin: const EdgeInsets.fromLTRB(0, 5, 5, 0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: todo["completed"] ? Colors.blueAccent : Colors.redAccent),
    child: Center(
        child: Column(
      children: [
        Text(
          todo["title"],
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Todo.remove(todo);
              },
              child: const Icon(
                Icons.remove_circle,
                color: Colors.white,
              ),
            )
          ],
        ))
      ],
    )),
  );
}
