import 'dart:convert';
import 'package:examm/modal/PostModal.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

class HomeController extends GetxController{


  List datalist =[].obs;



  String apilink = "https://jsonplaceholder.typicode.com/users";

  Future<dynamic> apicalling()async{

    var jasonstring = await http.get(Uri.parse(apilink),);
    var json = jsonDecode(jasonstring.body);

   return json.map((e)=>PostModal.fromJson(e)).toList();

  }


}
