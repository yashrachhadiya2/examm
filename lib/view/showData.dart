import 'package:examm/controller/homeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataShow extends StatefulWidget {
  const DataShow({Key? key}) : super(key: key);

  @override
  State<DataShow> createState() => _DataShowState();
}

class _DataShowState extends State<DataShow> {

  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
            itemCount: homeController.datalist.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading:
                Text("${homeController.datalist[0]}"),


              );
            }),
      ),
    );
  }
}
