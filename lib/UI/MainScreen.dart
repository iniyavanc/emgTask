import 'package:emagtask/MenuProvider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../Controller/MainScreenController.dart';
import 'DetailScreen.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainScreenController controller = Get.put(MainScreenController());
    controller.userProvider = Provider.of<MenuProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 55,
          backgroundColor: Color(0xFF20AAA0),
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
          ),
          title: Text(
            'Main Screen',
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
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 12,
                ),
                Text(
                  'Welcome to e- Mag',
                  style: TextStyle(
                    color: Color(0xFF20AAA0),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.38,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF20AAA0)),
                  ),
                  onPressed: () {
                    controller.userProvider.setDataList(controller.dataList);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailScreen()),
                    );
                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      'SUBMIT',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
