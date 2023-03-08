import 'dart:convert';
import 'dart:io';
import 'package:get/get_connect/http/src/status/http_status.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '/pages/places/places_controller.dart';
import '../constants/server_msg.dart';
import '../constants/server_url.dart';
import '../pages/authentication/auth_controller.dart';
import 'text_filed.dart';

class AddPlace extends StatefulWidget {
  AddPlace(
      {Key? key,
      this.packgeName,
      this.packgePrice,
      this.packeDays,
      this.packeImage,
      this.transportName,
      this.tansportType,
      this.hotelName})
      : super(key: key);
  final packgeName;
  final packgePrice;
  final packeDays;
  final dynamic packeImage;
  final transportName;
  final tansportType;
  final hotelName;

  @override
  State<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  final PlacseController _placseController = Get.put(PlacseController());

  var nameController = TextEditingController();
  var descController = TextEditingController();

  var countryController = TextEditingController();

  var cityController = TextEditingController();

  var typeController = TextEditingController();

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
  AuthController controller = Get.find();

  fun() async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer +${controller.token}'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse(Server.domainNameServer + Server.addPlaces));
    request.fields.addAll({
      'name': nameController.text,
      'description': descController.text,
      'country_id': '1',
      'city': cityController.text,
      'rating': '4'
    });
    request.files.add(await http.MultipartFile.fromPath('image', _image!.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final msg = ServerMsg.fromJson(
          json.decode(await response.stream.bytesToString()));
      print(msg.message);
      Get.defaultDialog(
        //  middleText: msg!.message!,
          middleText: 'added Successfuly',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });

      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      print(await response.stream.bytesToString());

      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: 'cant add the place!',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });

      throw Exception('Failed to Add the place');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 50,
            ),
            FloatingActionButton(
              heroTag: 'first',
              onPressed: () {
                setState(() {
                  nameController.text = '';
                  descController.text = '';
                  cityController.text = '';
                  countryController.text = '';
                  _image = null;
                });
              },
              child: Icon(
                Icons.add,
              ),
              backgroundColor: Colors.deepPurple,
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 60,
              height: 60,
              child: FloatingActionButton(
                heroTag: 'second',
                child: const Icon(Icons.navigate_next),
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
                    // _placseController.postPlacse1(
                    //   name: nameController.text,
                    //   rating: 'f',
                    //   description: 'gjghjhgjj',
                    //   city: 'hggh',
                    //   image: _image,
                    // );
                    fun();

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                    Future.delayed(const Duration(milliseconds: 700), () {
                      // Here you can write your code
                      //  Get.back();

                      setState(() {
                        // Here you can write your code for open new view
                      });
                    });
                  }
                },
                tooltip: 'Add placse',
              ),
            ),
          ],
        ),
      ),

      appBar: AppBar(
        // backgroundColor: Colors.deepPurple,
        backgroundColor: Color(0xFF414865),

        title: const Text("add Place"),
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

                    /*  ElevatedButton(
                      onPressed: () {},
                      child: Text("Chose an image"),
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:MaterialStateProperty.all<Color>(Colors.deepPurple) ,
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered))
                              return Colors.deepPurple.withOpacity(0.04);
                            if (states.contains(MaterialState.focused) ||
                                states.contains(MaterialState.pressed))
                              return Colors.deepPurple.withOpacity(0.12);
                            return null; // Defer to the widget's default.
                          },
                        ),
                        minimumSize:
                            MaterialStateProperty.all(const Size(70, 70)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            // side: BorderSide(color: Colors.red)
                          ),
                        ),
                      ),
                    ),*/
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormFiledWidget(
                      lapleText: "property name",
                      //  helpertext: "the name of property",
                      icon: Icons.drive_file_rename_outline,
                      hintText: "sahet bosura",
                      onChange: (value) {
                        print(value);
                      },
                      onSave: (value) {
                        nameController.text = value!;
                      },
                      textInputType: TextInputType.text,
                      textEditingController: nameController,
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
                      icon: Icons.location_on,
                      // helpertext: "the country name",
                      lapleText: "country",
                      hintText: "syria",
                      onChange: (value) {
                        print(value);
                      },
                      onSave: (value) {
                        countryController.text = value!;
                      },
                      textInputType: TextInputType.text,
                      textEditingController: countryController,
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
                      icon: Icons.location_on,
                      hintText: "daraa",
                      lapleText: "city",
                      onChange: (value) {
                        print(value);
                      },
                      onSave: (value) {
                        cityController.text = value!;
                      },
                      textInputType: TextInputType.text,
                      textEditingController: cityController,
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

                    /* TextFormFiledWidget(
                      icon: Icons.account_balance,
                      hintText: "the type",
                      lapleText: "the type",
                     // helpertext: "the type",
                      onChange: (value) {
                        print(value);
                      },
                      onSave: (value) {
                        typeController.text = value!;
                      },
                      textInputType: TextInputType.text,
                      textEditingController: typeController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Cann\'t Be Empty';
                        } else {
                          return null;
                        }
                      },
                    ),*/
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormFiledWidget(
                      icon: Icons.app_registration_rounded,
                      hintText: " ",
                      lapleText: "Description",
                      // helpertext: "the type",
                      maxl: 5,
                      mline: 4,
                      onChange: (value) {
                        print(value);
                      },
                      onSave: (value) {
                        descController.text = value!;
                      },
                      textInputType: TextInputType.text,
                      textEditingController: descController,
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
                    Row(
                      children: [
                        const Icon(Icons.account_balance,
                            color: Colors.deepPurple),
                        const SizedBox(
                          width: 30,
                        ),
                        const Text(
                          "chose the type",
                          style: const TextStyle(fontSize: 17),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        DropdownButton(
                          // Initial Value
                          value: dropdownvalue,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ],
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
