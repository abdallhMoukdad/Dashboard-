import 'package:flutter/material.dart';
import '/constants/controllers.dart';
import '/helpers/reponsiveness.dart';
import '/pages/clients/widgets/clients_table.dart';
import '/widgets/custom_text.dart';
import 'package:get/get.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage() ;

  @override
  Widget build(BuildContext context) {
         return Container(
                child: Column(
                children: [
                 Obx(() => Row(
                    children: [
                      Container(
                          padding: EdgeInsets.only(top: 30),
                        margin: EdgeInsets.only(top:
                        ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                        child: CustomText(text: menuController.activeItem.value, size: 24, weight: FontWeight.bold,)),
                    ],
                  ),),

                  Expanded(child: ListView(
                    children: [
                      Clientstable(),
                    ],
                  )),

                  ],
                ),
              );
  }
}