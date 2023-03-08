import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/pages/places/places_controller.dart';
import '/pages/places/widgets/placse_card.dart';
import '../../../constants/data.dart';
import '../../../constants/size.dart';

class Grid extends StatelessWidget {
   Grid({Key? key, this.CrossCount, required this.CrossSpacing, this.AspectR}) : super(key: key);
  final CrossCount;
  final double CrossSpacing;
  final AspectR;
  final PlacseController _placseController = Get.find();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Obx((){
      return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //  crossAxisCount: 4,
        //  crossAxisSpacing: 15,
        // childAspectRatio: 250/280,
        //  mainAxisExtent: 3,
        // mainAxisSpacing: 50,
        // childAspectRatio: SizeConfig.screenHeight*25/SizeConfig.screenWidth*30,
        // childAspectRatio: SizeConfig.screenWidth*10/SizeConfig.screenHeight*10,

        crossAxisCount: CrossCount,
        crossAxisSpacing: CrossSpacing,
        childAspectRatio: AspectR,

      ),
          //physics: ScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(0),
          //  itemCount: 6,

          itemCount: _placseController.placseList.value.length,
          itemBuilder: (context, index) {

            return PlacseCard(data: _placseController.placseList[index]);
            // return PlacseCard(data:courses[index]);

          });
    });
  }
}
