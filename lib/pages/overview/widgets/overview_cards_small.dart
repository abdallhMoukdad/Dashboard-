import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'info_card_small.dart';
import 'overview_controller.dart';

class OverviewCardsSmallScreen extends StatelessWidget {
// final Function() action;

   OverviewCardsSmallScreen({
    Key? key,
    /*required this.action*/
  }) : super(key: key);
  OverViewController _overViewController =Get.find();
  // @override
   // void initState() {
   //    _overViewController =Get.find();
   // }
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

   // return Obx((){
      return Container(
        height: 400,
        child: Column(
          children: [
            InfoCardSmall(
              title: "Packages number",

            //  value: "${_overViewController.data?.value.numberOfPackages}",
               value: "27",
              onTap: () {},
              isActive: true,
            ),
            SizedBox(
              height: _width / 64,
            ),
            InfoCardSmall(
              title: "Packages will start",
              value: "17",
             // value: "${_overViewController.data?.value.numberOfPackagesOpened}",
              onTap: () {},
            ),
            SizedBox(
              height: _width / 64,
            ),
            InfoCardSmall(
              title: "Packages End",
              value: "3",
             // value: "${_overViewController.data?.value.numberOfPackagesFinished}",
              onTap: () {},
            ),
            SizedBox(
              height: _width / 64,
            ),
            // InfoCardSmall(
            //   title: "Scheduled deliveries",
            //   value: "32",
            //   onTap: () {},
            // ),
          ],
        ),
      );
  //  }
  //  );
  }
}
