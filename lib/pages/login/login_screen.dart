// import 'package:flutter/material.dart';
//
// import 'button.dart';
// import 'checkbos.dart';
// import 'login_controller.dart';
// import 'mytextfield.dart';
// import 'package:get/get.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
//
// class LogIn extends StatelessWidget {
//   bool _obsecureText = true;
//   LoginController controller = Get.put(LoginController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.black),
//         leading: const Icon(
//           Icons.arrow_back_ios_new,
//           color: Colors.grey,
//         ),
//         title: const Text(
//           'Login',
//           style: TextStyle(color: Colors.grey),
//         ),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Center(
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
// // ignore: prefer_const_literals_to_create_immutables
//                 children: [
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const Center(
//                     child:  Text(
//                       'Welcome back',
//                       style:  TextStyle(
//                           color: Colors.black,
//                           fontSize: 28,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   const Text(
//                     'Sign in with your email and password \n or countinue with social media',
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 50),
//                   Center(
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: MyTextField(
//                         hintText: 'enter your email',
//                         icon: const Icon(Icons.email_sharp),
//                         onChanged: (value) {
//                           controller.email = value;
//                         },
//                         labelText: 'Email',
//                         keyboard: TextInputType.emailAddress,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: MyTextField(
//                         hintText: 'enter your password',
//                         icon: const Icon(Icons.lock),
//                         onChanged: (value) {
//                           controller.password = value;
//                         },
//                         labelText: 'Password',
//                         icon1: const Icon(Icons.remove_red_eye),
//                         keyboard: TextInputType.visiblePassword,
//                       )),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Obx(
//                           () {
//                             return CustomCheckbox(
//                               iconSize: 20,
//                               size: 20,
//                               isSelected: controller.checkBoxStatus.value,
//                               onTap: () {
//                                 controller.changeCheckBox();
//                               },
//                             );
//                           },
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         const Text('Remember me'),
//                         const Spacer(),
//                         GestureDetector(
//                           onTap: () {
//                             Get.toNamed('/forgetpass');
//                           },
//                           child: const Text(
//                             'Forget password',
//                             style:
//                                 TextStyle(decoration: TextDecoration.underline),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   MyButton(
//                     color: Colors.blue,
//                     onTap: () {
//                       onClickLogin();
//                       Get.toNamed('/signup');
//                     },
//                     title: 'Continue',
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       InkWell(
//                         // onTap: () => SignIn(),
//                         child: Container(
//                           padding: const EdgeInsets.all(20),
//                           decoration: const BoxDecoration(
//                             shape: BoxShape.circle,
//                           ),
//                           child:
//                               SvgPicture.asset('images/svgs/icons8-google.svg'),
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {},
//                         child: Container(
//                           padding: const EdgeInsets.all(20),
//                           decoration: const BoxDecoration(
//                             shape: BoxShape.circle,
//                           ),
//                           child: SvgPicture.asset(
//                               'images/svgs/icons8-twitter.svg'),
//                         ),
//                       ),
//                       InkWell(
//                         child: Container(
//                           padding: const EdgeInsets.all(20),
//                           decoration: const BoxDecoration(
//                             shape: BoxShape.circle,
//                           ),
//                           child: SvgPicture.asset(
//                               'images/svgs/icons8-facebook.svg'),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 5),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     // ignore: prefer_const_literals_to_create_immutables
//                     children: [
//                       const Text(
//                         "Don't have an account?",
//                       ),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       const Text(
//                         "Sign up",
//                         style: const TextStyle(color: Colors.blue),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void onClickLogin() async {
//     EasyLoading.show(status: 'loading...');
//     await controller.loginOnClick();
//     if (controller.loginStatuse) {
//       EasyLoading.showSuccess('done');
//       Get.offNamed('/verifycode');
//     } else {
//       EasyLoading.showError('there is an error',
//           duration: const Duration(seconds: 2), dismissOnTap: true);
//       print('error here');
//     }
//   }
// }
