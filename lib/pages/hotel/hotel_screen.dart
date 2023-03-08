import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/pages/packges/packge_card.dart';
import '/pages/packges/packge_detals.dart';
import '/pages/packges/packges_controller.dart';
import '/widgets/custom_image.dart';

import '../../constants/controllers.dart';
import '../../constants/data.dart';
import '../../helpers/reponsiveness.dart';
import '../../widgets/custom_text.dart';
import '../places/widgets/grid_builder.dart';
import 'add_hotel.dart';
import 'hotel_card.dart';
import 'hotel_controller.dart';

class HotelsScreen extends StatelessWidget {
  HotelsScreen({Key? key}) : super(key: key);
  final HotelController _hotelController = Get.put(HotelController(),permanent: true);

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
            Get.to(AddHotel());
          },
          tooltip: 'Add Hotel',
        ),
      ),
      body: RefreshIndicator(
        onRefresh: ()async{
          await Future.delayed(Duration(milliseconds: 1500));
          _hotelController.fetchHotel();
        },
        child: Column(
          children: [
            Obx(
                  () => Row(
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 30),
                      margin: EdgeInsets.only(
                          top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                      child: CustomText(
                        text: menuController.activeItem.value,
                        size: 24,
                        weight: FontWeight.bold,
                      )),
                ],
              ),
            ),
            Obx(() {
              if (_hotelController.isLoading.value) {
                Future.delayed(const Duration(seconds: 2), () {
                  _hotelController.isLoading.value = false;
                });

                return const Padding(
                  padding: EdgeInsets.only(top: 270),
                  child: Center(child: CircularProgressIndicator()),
                );
              } else {
                return Expanded(
                    child: ListView.builder(
                      //  itemCount: courses.length,
                        itemCount: _hotelController.hotelList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 300,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: HotelCard(
                                //  data: courses[index],
                                data: _hotelController.hotelList[index],
                                onTap: () {

                                },
                              ),
                            ),
                          );
                        }));
              }
            }),
          ],
        ),
      ),
    );
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
