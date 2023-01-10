import 'package:get/get.dart';

class Todo extends GetxController {
  static var list = [].obs;
static var isLoading=false.obs;
  static get() async {
    isLoading.value=true;
    var response =
        await GetConnect().get("https://jsonplaceholder.typicode.com/todos");
    list.value=response.body;
    isLoading.value=false;
  }

  static updateStatus(index){
    list[index]["completed"]=!list[index]["completed"];
    list.refresh();
  }
  static remove(item){
    list.remove(item);
    list.refresh();
  }
}
