import 'package:flutter/material.dart';
import '/pages/overview/widgets/chart_section_small.dart';
import '/pages/users/controller.dart';
import '/helpers/reponsiveness.dart';
import '/constants/controllers.dart';
import '/pages/overview/widgets/available_drivers_table.dart';
import '/pages/overview/widgets/overview_cards_large.dart';
import '/pages/overview/widgets/overview_cards_medium.dart';
import '/pages/overview/widgets/overview_cards_small.dart';
import '/pages/overview/widgets/revenue_section_large.dart';
import '/widgets/custom_text.dart';
import 'package:get/get.dart';

import 'widgets/overview_controller.dart';
import 'widgets/revenue_section_small.dart';

class OverviewPage extends StatelessWidget {
  final cont _cont = Get.put(cont());
    OverViewController _overViewController= Get.put(OverViewController());

  @override
  Widget build(BuildContext context) {
    return Container(
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

          Expanded(
              child: ListView(
            children: [
              if (ResponsiveWidget.isLargeScreen(context) ||
                  ResponsiveWidget.isMediumScreen(context))
                if (ResponsiveWidget.isCustomSize(context))
                  OverviewCardsMediumScreen()
                else
                  OverviewCardsLargeScreen()
              else
                OverviewCardsSmallScreen(),
              if (!ResponsiveWidget.isSmallScreen(context))
                RevenueSectionLarge()
              else
                ChartSectionSmall(),
              RevenueSectionSmall(),

              // AvailableDriversTable(),
            ],
          ))
        ],
      ),
    );
  }
}
