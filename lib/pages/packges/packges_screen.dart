import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/pages/packges/packge_card.dart';
import '/pages/packges/packge_detals.dart';
import '/pages/packges/packges_controller.dart';
import '/widgets/custom_image.dart';

import '../../constants/data.dart';
import '../../helpers/reponsiveness.dart';
import '../places/widgets/grid_builder.dart';

class PackgesScreen extends StatelessWidget {
  PackgesScreen({Key? key}) : super(key: key);
  // final PackgesController _packgeController = Get.put(PackgesController(),permanent: true);
   PackgesController _packgeController =Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_packgeController.isLoading.value) {
        Future.delayed(const Duration(seconds: 2), () {
          _packgeController.isLoading.value = false;
        });

        return const Padding(
          padding: EdgeInsets.only(top: 270),
          child: Center(child: CircularProgressIndicator()),
        );
      } else {
        return Expanded(
            child: ListView.builder(
              //  itemCount: courses.length,
                  itemCount: _packgeController.packgesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: PackgeCard(
                      //  data: courses[index],
                        data: _packgeController.packgesList[index],
                        onTap: () {
                          Get.to(PackgeDetals(
                           // data: courses[index],
                            data :_packgeController.packgesList[index],
                          ));
                        },
                      ),
                    ),
                  );
                }));
      }
    });
  }
}
/*Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Center(
                      child: Container(
                        constraints:BoxConstraints(maxWidth: 700,),
                        height: 100,
                        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                          color: Colors.teal[100],

                      ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            onTap: (){
                              Get.to(PackgeDetals( data: courses[index],));
                            },
                              leading: CustomImage(
                               courses[index]["image"],
                              // _packgeController.packgesList[index].im
                                radius: 15,
                                width: 100,
                                height: 100,
                              ),

                              trailing:  Text(
                              "${courses[index]["price"]}\$",
                              style: TextStyle(color: Colors.green, fontSize: 15),
                          ),
                          title: Text("Packge number $index"),
                            subtitle: Text("${courses[index]["country"]}"),
                          ),
                        ),
                      ),
                    ),
                  );*/
