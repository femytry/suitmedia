import 'package:get/get.dart';

class ApiProvider extends GetConnect{
  // var _baseUrl = "";
  var _reqResUrl = "https://reqres.in/api";

  Future<Response> getReqRes(String path) => get(_reqResUrl+path);
}