import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '/pages/users/post.dart';
import '/pages/users/user_service.dart';
import 'package:get/get.dart';

import 'controller.dart';
class UserScreen extends StatelessWidget {
   UserScreen({Key? key}) : super(key: key);

   final cont _cont=Get.put(cont());
   final Service _service=Get.find();
//  void data()async{
// //   final res=await _service.getUser();
//    final List<Post>? res1=await _service.fetchUser();
//    for(var v in res1!){
//      print(v.id);
//    }
//   // print(res.body);
//   // print(res1);
//    //debugPrint(res);
//  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(40),
              child: TextButton(
                child:Text("click me") ,
                onPressed:_cont.f2 ,

              ),
            ),
            Expanded(
              child: Obx((){
                if (_cont.isLoading.value) {
                  return const Center(child:  CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: _cont.postList.length,
                    itemBuilder: (BuildContext context,int index){
                      return ListTile(
                          leading: Icon(Icons.list),
                          trailing:  Text("GFG",
                            style: TextStyle(
                                color: Colors.green,fontSize: 15),),
                          title:Text(_cont.postList[index].title!)
                      );
                    }
                );
                }
              })

              ),

          ],
        ),
      ),
    );
  }
}
