import 'dart:developer';

import 'package:get/get.dart';
import '/pages/users/user_service.dart';

import 'ffff.dart';
import 'post.dart';

class cont extends GetxController {
  var isLoading = true.obs;
  var postList = <Post>[].obs;
  late Service _service;

  @override
  void onInit(){
    _service = Get.put(Service());
    f1();
    super.onInit();
  }

  void f() async {
    try {
      isLoading.value = true;
      var post = await _service.fetchUser();
      if (post != null) {
        postList.value = post;
      }
    } finally {
      isLoading.value = false;
      print(postList.length);
    }
  }


  void f1() async {
    try {
      isLoading.value = true;
      var post = await RemoteServices.fetchProducts();
      if (post != null) {
        postList.value = post;
      }
    } finally {
      isLoading.value = false;
      print(postList.length);
    }
  }

  void f2() {
    try {
      isLoading.value = true;
      _service.fetchUser().then((value) {
        var post = value;
        if (post != null) {
          postList.value = post as List<Post>;
          print(postList.length);
        }
      });
      // if(post!=null) {
      //   postList.value=post as List<Post>;
  //  }
  }

  finally{
  isLoading.value=false;
  print(postList.length);
  }

}

}
