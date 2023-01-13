import 'package:get/get.dart';
import 'package:startup/controllers/http.dart';
class Post{
  static var isLoading=false.obs;
  static var list=[].obs;

  static get()async {
    isLoading.value=true;
    list.value=await Http.get("posts");
    isLoading.value=false;
  }


}