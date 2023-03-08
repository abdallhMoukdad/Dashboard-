
import 'package:flutter/material.dart';
import '/pages/packges/packges_screen.dart';
import '/constants/controllers.dart';
import '/helpers/reponsiveness.dart';
import '/widgets/custom_text.dart';
import 'package:get/get.dart';

import 'add_packge.dart';
import 'packges_controller.dart';

class PackgeScreen extends StatelessWidget {
   PackgeScreen()  ;
  final PackgesController _packgeController = Get.put(PackgesController(),permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 70,
        height: 80,
        child: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.deepPurple,
          onPressed: () {
            Get.to(AddPackge());
          },
          tooltip: 'Add Packge',
        ),
      ),
      body: RefreshIndicator(
        onRefresh: ()async{
          await Future.delayed(Duration(milliseconds: 1500));
          _packgeController.fetchB();
        },
        child: Container(
          child: Column(
            children: [
              Obx(() => Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(top:
                      ResponsiveWidget.isSmallScreen(context) ? 100 : 6),
                      child: CustomText(text: menuController.activeItem.value, size: 24, weight: FontWeight.bold,)),
                ],
              ),),

              PackgesScreen(),

            ],
          ),
        ),
      ),
    );
  }
}