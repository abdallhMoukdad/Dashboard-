import 'package:flutter/material.dart';
import '/pages/overview/widgets/info_card.dart';


class OverviewCardsMediumScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   double _width = MediaQuery.of(context).size.width;

    return  Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
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
                  //   InfoCard(
                  //     title: "Packages delivered",
                  //     value: "17",
                  // topColor: Colors.lightGreen,
                  //
                  //     onTap: () {},
                  //   ),
                  //
                  ],
                ),
            SizedBox(
                      height: _width / 64,
                    ),
                  Row(
                  children: [
             
                    InfoCard(
                      title: "Cancelled packges",
                      value: "3",
                  topColor: Colors.redAccent,

                      onTap: () {},
                    ),
                    SizedBox(
                      width: _width / 64,
                    ),
                    InfoCard(
                      title: "packges will start",
                      value: "17",
                      onTap: () {},
                    ),
                
                  ],
                ),
      ],
    );
  }
}