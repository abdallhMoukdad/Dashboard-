import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '/add_place/text_filed.dart';
import '/pages/packges/packges_controller.dart';

import '../places/places_controller.dart';
import 'add_transport.dart';

class AddPackge extends StatefulWidget {
  const AddPackge({Key? key}) : super(key: key);

  @override
  State<AddPackge> createState() => _AddPackgeState();
}

class _AddPackgeState extends State<AddPackge> {
  final PlacseController _placseController = Get.put(PlacseController(),permanent: true);
   PackgesController _packgesController=Get.find();
  var packgeNameController = TextEditingController();

  var priceController = TextEditingController();

  var daysController = TextEditingController();
  var startDateController=TextEditingController();
  var endDateController=TextEditingController();


  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();

  // Implementing the image picker
  File? _image;

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
       // _image!.path.split('/').first
        _packgesController.pimage=_image!.path;
      //  _placseController.postPlacse9999(image: _image);
      }
    });
  }

  // Initial Selected Value
  String dropdownvalue = 'Restaurant';

  // List of items in our dropdown menu
  var items = [
    'Restaurant',
    'Bars & Cafés',
    'Nightclubs',
    'Travel Agents',
    'Hotels',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 70,
        height: 80,
        child: FloatingActionButton(
          child: const Icon(Icons.arrow_forward),
          backgroundColor: Colors.deepPurple,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // If the form is valid, display a snackbar. In the real world,
              // you'd often call a server or save the information in a database.
              // Get.bottomSheet(Container(
              //     color: Colors.white,
              //     width: 100,
              //     height: 100,
              //     child: Text('Processing Data')));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Processing Data')),
              );
              Future.delayed(const Duration(milliseconds: 700), () {
                // Here you can write your code
                final reslute = Get.off(
                    AddTransport(
                        packgeName: packgeNameController.text,
                        packgePrice: priceController.text,
                        packeDays: daysController.text,
                        packeImage: _image!.path,
                        packgeStartDate: startDateController.text,
                      packgeEndDate: endDateController.text,
                    ),
                    transition: Transition.native);

                setState(() {
                  // Here you can write your code for open new view
                });
              });
            }
          },
          tooltip: 'Add Packge',
        ),
      ),
      appBar: AppBar(
        // backgroundColor: Colors.deepPurple,
        backgroundColor: Color(0xFF414865),

        title: const Text("Add Packge"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormFiledWidget(
                      lapleText: "Packge name",
                      //  helpertext: "the name of property",
                      icon: Icons.drive_file_rename_outline,
                      hintText: "Ocine",
                      onChange: (value) {
                        print(value);
                      },
                      onSave: (value) {
                        packgeNameController.text = value!;
                      },
                      textInputType: TextInputType.text,
                      textEditingController: packgeNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Cann\'t Be Empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormFiledWidget(
                      icon: Icons.money_off_csred_sharp,
                      // helpertext: "the country name",
                      lapleText: "Price",
                      hintText: "123\$",
                      onChange: (value) {
                        print(value);
                      },
                      onSave: (value) {
                        priceController.text = value!;
                      },
                      textInputType: TextInputType.number,
                      textEditingController: priceController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Cann\'t Be Empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormFiledWidget(
                      //  helpertext: "the city name",
                      icon: Icons.access_alarm_rounded,
                      hintText: "7",
                      lapleText: "Days",
                      onChange: (value) {
                        print(value);
                      },
                      onSave: (value) {
                        daysController.text = value!;
                      },
                      textInputType: TextInputType.number,
                      textEditingController: daysController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Cann\'t Be Empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormFiledWidget(
                      //  helpertext: "the city name",
                      icon: Icons.date_range,
                      hintText: "2018-1-1",
                      lapleText: "Satrt Date",
                      onChange: (value) {
                        print(value);
                      },
                      onSave: (value) {
                        startDateController.text = value!;
                      },
                      textInputType: TextInputType.datetime,
                      textEditingController: startDateController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Cann\'t Be Empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormFiledWidget(
                      //  helpertext: "the city name",
                      icon: Icons.date_range,
                      hintText: "2018-2-2",
                      lapleText: "End Date",
                      onChange: (value) {
                        print(value);
                      },
                      onSave: (value) {
                        endDateController.text = value!;
                      },
                      textInputType: TextInputType.datetime,
                      textEditingController: endDateController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Cann\'t Be Empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    _image != null
                        ? Container(
                            child: kIsWeb
                                ? Image.network(_image!.path)
                                : Image.file(File(_image!.path)),
                          )
                        : Container(
                            constraints: const BoxConstraints(
                                maxWidth: 500, minWidth: 300, minHeight: 250),
                            child: TextButton(
                              onPressed: _openImagePicker,
                              child: Row(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      const Text(
                                        "to chose an image",
                                        style:
                                            TextStyle(color: Colors.blueGrey),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            "Click here",
                                            style: TextStyle(
                                              color: Colors.deepPurple,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            Icons.photo_camera_back,
                                            color: Colors.deepPurple,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
