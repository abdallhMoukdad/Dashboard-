import 'sector.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChartWidget extends StatelessWidget {
  final List<Sector> sectors;

  const PieChartWidget(this.sectors, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1.0,
          child: PieChart(

            PieChartData(
              sectionsSpace: 5.0,
              sections: _chartSections(sectors),
              centerSpaceRadius: 48.0,


            ),
          ),
        ),
        Column(
          children: industrySectors
              .map<Widget>((sector) => SectorRow(sector))
              .toList(),
        )
      ],
    );
  }

  List<PieChartSectionData> _chartSections(List<Sector> sectors) {
    final List<PieChartSectionData> list = [];
    for (var sector in sectors) {
      const double radius = 48.0;
      final data = PieChartSectionData(
        titlePositionPercentageOffset: 1.7,
    //    badgePositionPercentageOffset: 0,
        color: sector.color,
        value: sector.value,
        radius: radius,
      showTitle: false,
      //  title: sector.title,
      );
      list.add(data);
    }
    return list;
  }
}

class SectorRow extends StatelessWidget {
  const SectorRow(this.sector, {Key? key}) : super(key: key);
  final Sector sector;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(sector.title),
        SizedBox(
          width: 15,
        ),
        Text(sector.value.toStringAsFixed(2)),

        const Spacer(),
        SizedBox(
          width: 16,
          child: CircleAvatar(
            backgroundColor: sector.color,
          ),
        ),
        //const Spacer(),
     //   Text(sector.title),
      ],
    );
  }
}