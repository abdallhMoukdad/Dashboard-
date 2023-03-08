import 'package:flutter/material.dart';
import '/pages/places/places_controller.dart';

import '../../add_place/add_place.dart';
import '../../constants/controllers.dart';
import '../../helpers/reponsiveness.dart';
import '../../widgets/custom_text.dart';
import 'widgets/grid_builder.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PlacesScreen extends StatelessWidget {
  PlacesScreen({Key? key}) : super(key: key);
  final PlacseController _placseController = Get.put(PlacseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: ()async{
          await Future.delayed(Duration(milliseconds: 1500));
          _placseController.fetchPlaces();
        },

        child: Container(
          child: Column(
            children: [
              Obx(
                () => Row(
                  children: [
                    Container(
                        padding: EdgeInsets.only(top: 30),
                        margin: EdgeInsets.only(
                            top:
                                ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                        child: CustomText(
                          text: menuController.activeItem.value,
                          size: 24,
                          weight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              Obx(() {
                if (_placseController.isLoading.value) {
                  Future.delayed(const Duration(seconds: 2), () {
                    _placseController.isLoading.value = false;

                  });

                  return const Padding(
                    padding: EdgeInsets.only(top: 270),
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return Expanded(child: LayoutBuilder(
                    builder: (context, dimens) {
                      if (dimens.maxWidth <= 500) {
                        return  Grid(
                          CrossCount: 1,
                          CrossSpacing: 15,
                          AspectR: 40 / 40,
                        );
                      } else if (dimens.maxWidth > mediumScreenSize &&
                          dimens.maxWidth <= customScreenSize) {
                        return  Grid(
                          CrossCount: 3,
                          CrossSpacing: 15,
                          AspectR: 200 / 230,
                        );
                      } else if (dimens.maxWidth >= customScreenSize) {
                        return  Grid(
                          CrossCount: 4,
                          CrossSpacing: 15,
                          AspectR: 250 / 295,
                        );
                      } else {
                        return  Grid(
                          CrossCount: 2,
                          CrossSpacing: 15,
                          AspectR: 100 / 100,
                        );
                      }
                    },
                  ));
                }
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 80,
        child: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.deepPurple,
          onPressed: () {
            Get.to(AddPlace());
          },
          tooltip: 'Add placse',
        ),
      ),
    );
  }
}
