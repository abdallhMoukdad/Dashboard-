import 'package:flutter/material.dart';
import '/pages/overview/widgets/info_card.dart';


class OverviewCardsLargeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   double _width = MediaQuery.of(context).size.width;

    return  Row(
              children: [
                InfoCard(
                  title: "Packages End",
                  value: "2",
                  onTap: () {},
                  topColor: Colors.orange,
                ),
                SizedBox(
                  width: _width / 64,
                ),
                InfoCard(
                  title: "Cancelled packges",
                  value: "3",
                  topColor: Colors.lightGreen,
                  onTap: () {},
                ),
                SizedBox(
                  width: _width / 64,
                ),
                InfoCard(
                  title: "packges will start",
                  value: "17",
                  topColor: Colors.redAccent,
                  onTap: () {},
                ),
                SizedBox(
                  width: _width / 64,
                ),
                // InfoCard(
                //   title: "Scheduled deliveries",
                //   value: "32",
                //   onTap: () {},
                // ),
              ],
            );
  }
}