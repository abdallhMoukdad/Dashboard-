import 'package:flutter/material.dart';
import '/pages/overview/widgets/chart.dart';
import '/constants/style.dart';
import '/pages/overview/widgets/bar_chart.dart';
import '/pages/overview/widgets/revenue_info.dart';
import '/widgets/custom_text.dart';
import 'sector.dart';

class  ChartSectionSmall extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        border: Border.all(color: lightGrey, width: .5),
      ),
      child: Column(
        children: [
          PieChartWidget(industrySectors),


        ],
      ),
    );
  }
}