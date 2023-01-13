import 'package:get/get.dart';

class Http {
  static String api = "https://jsonplaceholder.typicode.com/";

  static request(String endPoint, {var body}) async {
    Response response;
    String url = "$api$endPoint";
    if (body == null) {
      response = await GetConnect().get(url);
    } else {
      response = await GetConnect().post(url, body);
    }
    return response.body;
  }

  static get(String endPoint) async {
    var response = await request(endPoint);
    return response;
  }

  static post(String endPoint,var body) async {
    var response = await request(endPoint,body: body);
    return response;
  }
}
