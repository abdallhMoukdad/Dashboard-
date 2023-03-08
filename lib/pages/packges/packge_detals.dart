import 'package:flutter/material.dart';

import '../../constants/data.dart';
import '../../constants/server_url.dart';
import '../../widgets/custom_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
class PackgeDetals extends StatelessWidget {
   PackgeDetals({Key? key, required this.data}) : super(key: key);
  final data;
// late  String start = DateFormat("yyyy-MM-dd").format(data.startDate);
//  late  String end = DateFormat("yyyy-MM-dd").format(data.endDate);
//
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("packge detals"),centerTitle: true,backgroundColor: Color(0xFF414865),),
      body: Center(
          child: Container(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 35,
                ),
                CustomImage(
                //  data["image"],
               //   data.packageImage,
                  '${Server.photo}'+'${data.packageImage.split('/').last}',
                  radius: 0,
                  height: 300,
                  width: 360,
                ),
              ],
            ),
            Positioned(
              top: 300,
              // right: 60,
              //left: 20,
              child: Container(
                //color: Colors.deepPurple,
                height: 500,
                width: 370,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(75),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 45,
                    ),
                     Padding(
                      padding: EdgeInsets.only(right: 190),
                      child: Text(
                        data.name,

                        //  "Casa Las Tanjero",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 12,
                        ),
                        RatingBar.builder(
                          initialRating: data.rating.toDouble(),
                        //  minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 21,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                         Text(
                          //"374 Review",
                           data.rating.toString(),

                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 12,
                        ),
                        Icon(
                          Icons.location_on_rounded,
                          color: Colors.cyan,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Fraince ,paris",
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:  [
                        Text(
                        //  "start date: 2018-1-1",
                           "start date ${data.startDate}"
                              // "start date ${start}"

                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Text(
                        //  "end date: 2018-1-1",
                            "end date ${data.endDate}"
                              //  "end date ${end}"


                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:  [
                        Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: Text(
                           // "duration 15 days",
                            "duration ${data.duration} days",


                          ),
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Text(
                        //  "number of people 14",
                        "number of people ${data.noPeople}"
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:  [
                        Padding(
                          padding: const EdgeInsets.only(right: 100),
                          child: Text(
                            // "duration 15 days",
                            "transport company : ${data.companyName}",


                          ),
                        ),
                        SizedBox(
                          width: 35,
                        ),
                     /*   Text(
                          //  "number of people 14",
                            "transport type ${data.transportType}"
                        ),*/
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 190),
                      child: Text(
                        //  "number of people 14",
                          "transport type : ${data.transportType}"
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 193),
                      child: Text(
                        //  "number of people 14",
                          "Hotel name : ${data.hotelName}"
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:  [
                        Padding(
                          padding: EdgeInsets.only(right: 255),
                          child: Text(
                            "Description",
                            style: TextStyle(
                                color: Colors.cyan,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          // "It is not cheap or easy to reach,\n"
                          //     " but this isolated paradise between \n"
                          //     "the Arabian and Laccadive seas is the personification of a dreamy tropical\n"
                              // " vacation. In this South Asian destination,\n"
                              // " which is made up of more than 1,000 islands, thatched-roof bungalows sit above the bright aquamarine sea,\n"
                              // " providing easy water access and a romantic atmosphere.\n"
                              // " Fill your days with beach trips, spa treatments and snorkeling or scuba diving excursions"
                          data.description,

                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
