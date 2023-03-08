import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '/add_place/text_filed.dart';
import '/pages/packges/add_place/add_place.dart';

import '../places/places_controller.dart';

class AddTransport extends StatefulWidget {
  const AddTransport(
      {Key? key,
      this.packgeName,
      this.packgePrice,
      this.packeDays,
      this.packeImage, this.packgeStartDate, this.packgeEndDate})
      : super(key: key);
  final packgeName;
  final packgePrice;
  final packeDays;
  final dynamic packeImage;
  final packgeStartDate;
  final packgeEndDate;


  @override
  State<AddTransport> createState() => _AddTransportState();
}

class _AddTransportState extends State<AddTransport> {
  final PlacseController _placseController = Get.put(PlacseController());

  var transportNameController = TextEditingController();

  var hotelNameController = TextEditingController();

  var typeController = TextEditingController();
var numPController =TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();

  // Implementing the image picker
  File? _image;

  // Initial Selected Value
  String dropdownvalue = 'Ferries';

  //typeController.text=dropdownvalue;
  // List of items in our dropdown menu
  var items = [
    'Ferries',
    'Taxis',
    'Trams',
    'Trains',
    'plane',
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
                Get.off(
                    AddPlace(
                      packgeName: widget.packgeName,
                      packgePrice: widget.packgePrice,
                      packeDays: widget.packeDays,
                      packeImage: widget.packeImage,
                      packgeStartDate: widget.packgeStartDate,
                      packgeEndDate: widget.packgeEndDate,

                      tansportType: typeController.text,
                      transportName: transportNameController.text,
                      hotelName: hotelNameController.text,
                      numPeople: numPController.text,
                    ),
                    transition: Transition.native);

                setState(() {
                  // Here you can write your code for open new view
                });
              });
            }
          },
          tooltip: 'Add Transport',
        ),
      ),
      appBar: AppBar(
        // backgroundColor: Colors.deepPurple,
        backgroundColor: Color(0xFF414865),

        title: const Text("Add Transport"),
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
                      lapleText: "hotel name",
                      //  helpertext: "the name of property",
                      icon: Icons.drive_file_rename_outline,
                      hintText: "tadmor",
                      onChange: (value) {
                        print(value);
                      },
                      onSave: (value) {
                        hotelNameController.text = value!;
                      },
                      textInputType: TextInputType.text,
                      textEditingController: hotelNameController,
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
                      icon: Icons.people,
                      // helpertext: "the country name",
                      lapleText: "number of people",
                      hintText: "6",
                      onChange: (value) {
                        print(value);
                      },
                      onSave: (value) {
                        numPController.text = value!;
                      },
                      textInputType: TextInputType.text,
                      textEditingController: numPController,
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
                      lapleText: "transport name",
                      hintText: "Homelander",
                      onChange: (value) {
                        print(value);
                      },
                      onSave: (value) {
                        transportNameController.text = value!;
                      },
                      textInputType: TextInputType.text,
                      textEditingController: transportNameController,
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
                              typeController.text=newValue;
                            });
                          },
                        ),
                      ],
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
