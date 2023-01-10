import 'package:get/get.dart';
class App extends GetxController{
  static var lang="en".obs;
  static var dirc="ltr".obs;
  static var directions={
    "en":"ltr",
    "ar":"rtl"
  };

  static setLang(newLang){
    lang.value=newLang;
    dirc.value=directions[newLang]??"ltr";
  }

  static changeLang(){
    if(lang.value=="en"){
      setLang("ar");
    }else{
      setLang("en");
    }
  }
}