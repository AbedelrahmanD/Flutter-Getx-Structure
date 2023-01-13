import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/app.dart';
import '../controllers/todo.dart';
appDirection({required Widget child}) {
  return Obx(() => Directionality(
      textDirection: App.dirc.value == "ltr" ? TextDirection.ltr : TextDirection.rtl,
      child: child));
}

appBar({
  String title="",
   List <Widget>? action
}){
  return AppBar(
    title:  Text(title),
    actions: [
      Obx(()=>Center(
        child: Text(Todo.list.length.toString()),
      ) ),
      Row(
        children: action??[],
      ),
      const SizedBox(width: 10,),
      InkWell(
        onTap: (){
          App.changeLang();
        },
        child:Container(
            padding:const  EdgeInsets.all(12),
            child: const Icon(Icons.language)),
      )
    ],
  );
}

appAlert(dynamic context,Widget widget){
  Get.dialog(
      Material(
        color: Colors.transparent,
          child: Stack(
            alignment: Alignment.center,
            children: [
              InkWell(
                onTap: ()=>Get.back(),
              ),
              Positioned(
                  child:Container(
                    constraints: const BoxConstraints(maxWidth: 500, minHeight: 150,maxHeight: 180),
                    width: MediaQuery.of(context).size.width*0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: widget,
                  ) )
            ],
          )
      ));
}

