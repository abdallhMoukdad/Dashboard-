import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/constants/data.dart';
import '/pages/places/places_modle.dart';

import '../../../constants/color.dart';
import '../../../constants/server_url.dart';
import '../../../widgets/custom_image.dart';
import 'package:http/http.dart' as http;

import '../../authentication/auth_controller.dart';
class PlacseCard extends StatelessWidget {
  PlacseCard(
      {Key? key, required this.data, this.width = 280, this.height = 290, this.onTap})
      : super(key: key);
  final Place data;
  final double width;
  final double height;
  final GestureTapCallback? onTap;

  AuthController controller = Get.find();

  delete(var id) async {
   var headers = {
     'Accept': 'application/json',
     'Authorization': 'Bearer +${controller.token}'
   };
   var request = http.Request('DELETE', Uri.parse(Server.domainNameServer+Server.deletePlaces+'$id'));

   request.headers.addAll(headers);

   http.StreamedResponse response = await request.send();

   if (response.statusCode == 200) {
     Get.defaultDialog(
       //  middleText: msg!.message!,
         middleText: 'palce has been delete it',
         textConfirm: 'OK',
         confirmTextColor: Colors.white,
         onConfirm: () {
           Get.back();
         });
     print(await response.stream.bytesToString());
   }
   else {
     Get.defaultDialog(
       //  middleText: msg!.message!,
         middleText: 'something went wrong',
         textConfirm: 'OK',
         confirmTextColor: Colors.white,
         onConfirm: () {
           Get.back();
         });
   print(response.reasonPhrase);
   }


 }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 5, top: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            CustomImage(
              // data["image"],
              //data.image,
              '${Server.photo}'+'${data.image.split('/').last}',
              width: double.infinity,
              height: 190,
              radius: 15,
            ),
            // Positioned(
            //   top: 170, right: 15,
            //   child: Container(
            //     padding: EdgeInsets.all(10),
            //     decoration: BoxDecoration(
            //       color: primary,
            //       borderRadius: BorderRadius.circular(20),
            //       boxShadow: [
            //         BoxShadow(
            //           color: shadowColor.withOpacity(0.05),
            //           spreadRadius: 1,
            //           blurRadius: 1,
            //           offset: Offset(0, 0),
            //         ),
            //       ],
            //     ),
            //     //if the placse free replace the price with free
            //     child: Text(data["price"],
            //       style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            //     ),
            //   ),
            // ),
            Positioned(
              top: 210,
              child: Container(
                width: width - 20,
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                             //data["name"],
                            data.name!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 17,
                                color: textColor,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                               // "(${data["country"]} ,${data["city"]})",
                            "(${data.country_id} ,${data.city})".tr,                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                const TextStyle(fontSize: 14, color: textColor),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: ElevatedButton(
                            child: const Text("Delete"),
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  // side: BorderSide(color: Colors.red)
                                ))),
                            onPressed: () {
                              // courses.map((e) {
                              //   if(e['id']==data['id']){
                              //     courses.remove(e);
                              //   }
                              //
                              // });
                              delete(data.id.toString());


                            },
                          ),
                        ),
                        // getAttribute(Icons.play_circle_outlined, labelColor, data["session"]),
                        const SizedBox(
                          width: 12,
                        ),
                        Container(
                          child: ElevatedButton(
                            child: const Text("update"),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  // side: BorderSide(color: Colors.red)
                                ),
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        // getAttribute(Icons.schedule_rounded, labelColor, data["duration"]),
                        const SizedBox(
                          width: 12,
                        ),
                        getAttribute(Icons.star, yellow,
                            data.rating.toString()),
                        const SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  getAttribute(IconData icon, Color color, String info) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: color,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          info,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: labelColor, fontSize: 13),
        ),
      ],
    );
  }
}
