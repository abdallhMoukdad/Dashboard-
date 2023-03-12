import 'package:flutter/material.dart';
import '/constants/style.dart';
import '/routing/routes.dart';
import 'package:get/get.dart';

class MenuController1 extends GetxController {
  static MenuController1 instance = Get.find();
  var activeItem = overviewPageDisplayName.obs;

  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isHovering(String itemName) => hoverItem.value == itemName;

  isActive(String itemName) => activeItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case overviewPageDisplayName:
        return _customIcon(Icons.trending_up, itemName);
      // case driversPageDisplayName:
      //   return _customIcon(Icons.drive_eta, itemName);
      case clientsPageDisplayName:
        return _customIcon(Icons.people_alt_outlined, itemName);
      case placesPageDisplayName:
        return _customIcon(Icons.place, itemName);
      case packgesPageDisplayName:
        return _customIcon(Icons.vpn_lock_sharp, itemName);
      case hotelPageDisplayName:
        return _customIcon(Icons.hotel, itemName);

      // case userPageDisplayName:
      //   return _customIcon(Icons.person, itemName);
      case settingsPageDisplayName:
        return _customIcon(Icons.settings, itemName);
      case authenticationPageDisplayName:
        return _customIcon(Icons.exit_to_app, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) return Icon(icon, size: 22, color: dark);

    return Icon(
      icon,
      color: isHovering(itemName) ? dark : lightGrey,
    );
  }
}
