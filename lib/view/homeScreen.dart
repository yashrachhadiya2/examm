import 'package:examm/controller/homeController.dart';
import 'package:examm/controller/sqliteDatabase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Data();
  }

  void Data() async {
    Sqlite db = Sqlite();
    homeController.datalist = await db.readData();

    // homeController.studentList.value = await db.readData();
  }

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("APi"),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  var data = await homeController.apicalling();
                  homeController.datalist = data;
                  print(homeController.datalist[1].name);
                },
                child: Text("Api"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Sqlite sqlite = Sqlite();

                  sqlite.insertData(homeController.datalist[0],
                      homeController.datalist[0], homeController.datalist[0]);
                },
                child: Text("Sqlite"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/show');
                },
                child: Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
