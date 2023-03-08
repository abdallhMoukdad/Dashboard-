import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '/pages/clients/clients_controller.dart';
import '/constants/style.dart';
import '/widgets/custom_text.dart';
import 'package:get/get.dart';

/// Example without datasource
class Clientstable extends StatelessWidget {
  ClientController _clientController = Get.put(ClientController());

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: active.withOpacity(.4), width: .5),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 6),
                color: lightGrey.withOpacity(.1),
                blurRadius: 12)
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
        margin: EdgeInsets.only(bottom: 30),
        child: Obx((){
          return  DataTable2(
            //    onSelectAll: (val)=>print("hii"),
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 600,
            columns: [
              DataColumn2(
                label: Text("Name".tr),
                size: ColumnSize.L,
              ),
              DataColumn2(
                label: Text("Email".tr),
                size: ColumnSize.L,
              ),
              DataColumn(
                label: Text('number'.tr),
              ),
              /*   DataColumn(
                  label: Text('Rating'),
                ),*/
              DataColumn(
                label: Text('Action'.tr),
              ),
            ],
            /*  rows: List<DataRow>.generate(
                  15,
                  (index) => DataRow(
                  //    onSelectChanged:(val) =>print("hi"),

                      cells: [

                        DataCell(CustomText(text: "mahmoud"),
                      /*  showEditIcon: true*/),
                        DataCell(CustomText(text: "abdallh@gmail.com")),
                        DataCell(CustomText(text: "Ocean eyes")),
                      /*  DataCell(Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.deepOrange,
                              size: 18,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CustomText(
                              text: "4.5",
                            )
                          ],
                        )),*/
                        DataCell(Container(
                            decoration: BoxDecoration(
                              color: light,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: active, width: .5),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            child: CustomText(
                              text: "Block",
                              color: active.withOpacity(.7),
                              weight: FontWeight.bold,
                            ))),
                      ]))),*/
            rows: _clientController.clientList.value
                .map((data) => DataRow(cells: [
              DataCell(
                CustomText(text: data.name), /*  showEditIcon: true*/
              ),
              DataCell(CustomText(text: data.email)),
              DataCell(CustomText(text:data.mobile)),
              /*  DataCell(Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.deepOrange,
                              size: 18,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CustomText(
                              text: "4.5",
                            )
                          ],
                        )),*/
              DataCell(Container(
                  decoration: BoxDecoration(
                    color: light,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: active, width: .5),
                  ),
                  padding:
                  EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: CustomText(
                    text: "Block",
                    color: active.withOpacity(.7),
                    weight: FontWeight.bold,
                  ))),
            ]))
                .toList(),
          );
        })
    );
  }
}
