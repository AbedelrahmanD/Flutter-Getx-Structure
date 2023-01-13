import 'package:get/get.dart';
import 'package:startup/controllers/http.dart';

class Todo extends GetxController {
  static var list = [].obs;
static var isLoading=false.obs;
  static get() async {
    isLoading.value=true;
    list.value =await Http.get("todos");
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

  static removeAll(){
    list.value=[];
    list.refresh();
  }
}
