import 'package:emagtask/UI/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../Controller/DetailScreenController.dart';
import '../MenuProvider.dart';

class DetailScreen extends GetView<DetailScreenController> {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DetailScreenController controller = Get.put(DetailScreenController());
    controller.userProvider = Provider.of<MenuProvider>(context, listen: false);
    List<String> getValues = Provider.of<MenuProvider>(context).getDataList;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 55,
          backgroundColor: Color(0xFF20AAA0),
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainScreen()),
              );
            },
            child: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
              size: 30,
            ),
          ),
          title: Text(
            'Detail Screen',
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[],
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              child: ListView.builder(
                itemCount: getValues.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.only(left: 15, bottom: 0),
                    title: Text(
                      getValues[index],
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
