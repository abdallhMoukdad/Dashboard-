import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/controllers.dart';
import '../../helpers/reponsiveness.dart';
import '../../translation/langauges.dart';
import '../../translation/langauges_controller.dart';
import '../../widgets/custom_text.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final LangaugesController _controller = Get.put(LangaugesController());


  String x = 'xx';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // actions: [],
      //   title: Text('Settings'.tr),
      // ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(
                () => Row(
              children: [
                Container(
                    padding: EdgeInsets.only(top: 30),
                    margin: EdgeInsets.only(
                        top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                    child: CustomText(
                      text: menuController.activeItem.value,
                      size: 24,
                      weight: FontWeight.bold,
                    )),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 120,top: 30), child: languageChooser()),
          // Text('rrrr'.tr),
        /*  Padding(
            padding: EdgeInsets.only(top: 30, left: 0, right: 100),
            child: IconButton(
              onPressed: () {
              },
              icon: Icon(
                Icons.logout_outlined,
                size: 50,
              ),
            ),
          ),*/
         // Text('logout'.tr),
        ],
      ),
    );
  }

  DropdownButton languageChooser() {
    return DropdownButton<String>(
        isExpanded: false,
        hint: Text('change language'),
        // Not necessary for Option 1
        value: _controller.selectedLanguage?.value,
        onChanged: (symbol) {
          _controller.changeLanguage = symbol;
        },
        items: languages.map((LanguageModel _language) {
          print(_language.language);
          return DropdownMenuItem<String>(
            child: new Text(_language.language),
            value: _language.symbol,
          );
        }).toList());
  }
}
