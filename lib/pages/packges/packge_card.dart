
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/server_url.dart';
import '../../widgets/custom_image.dart';
import 'package:http/http.dart' as http;

import '../authentication/auth_controller.dart';
class PackgeCard extends StatelessWidget {
  PackgeCard({ Key? key, required this.data, this.onTap}) : super(key: key);
  final data;
  final GestureTapCallback? onTap;
 late final photo=  data.packageImage.split('/').last;
  AuthController controller = Get.find();

  delete(var id) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer +${controller.token}'
    };
    var request = http.Request('DELETE', Uri.parse(Server.domainNameServer+Server.deletePackge+'$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Get.defaultDialog(
        //  middleText: msg!.message!,
          middleText: 'packge has been delete it',
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
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.all(10),
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1, 1), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              CustomImage(
                //data["image"],
               // data.packageImage,
// 'http://192.168.205.105:8000/products/1660067182image_picker2078731726680504464.png',
             // 'https://images.unsplash.com/photo-1533587851505-d119e13fa0d7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80',
              //  "${Server.photo}+${data.packageImage.split('/').last}",
                '${Server.photo}'+'${data.packageImage.split('/').last}',

                radius: 15,
                height: 80,
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.name/*data["name"]*/, maxLines: 1, overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Color(0xFF333333), fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 5,),
                  Text("${data.price.toString()}\$"/*data["price"]*/, style: TextStyle(fontSize: 14, color: Color(0xFF333333)),),
                  SizedBox(height: 15,),

                  Row(
                    children: [
                      Icon(Icons.schedule_rounded, color: Color(0xFF8A8989), size: 14,),
                      SizedBox(width: 2,),
                      Text(data.duration/*data["duration"]*/, style: TextStyle(fontSize: 12, color: Color(0xFF8A8989)),),
                      SizedBox(width: 20,),
                      Icon(Icons.star, color: Color(0xFFf5ba92), size: 14,),
                      SizedBox(width: 2,),
                      Text(data.rating.toString()/*data["review"]*/, style: TextStyle(fontSize: 12, color: Color(0xFF8A8989)),)
                     , Padding(
                       padding: const EdgeInsets.only(left: 30),
                       child: Container(
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
                     ),

                    ],
                  )
                ],
              )
            ],
          )
      ),
    );
  }
}