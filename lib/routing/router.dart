import 'package:flutter/material.dart';
import '/pages/packges/packge.dart';
import '/pages/places/places.dart';
import '../pages/hotel/add_hotel.dart';
import '../pages/hotel/hotel_screen.dart';
import '../pages/settings/settings.dart';
import '../pages/users/users.dart';
import '/pages/clients/clients.dart';
import '/pages/drivers/drivers.dart';
import '/pages/overview/overview.dart';
import '/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case overviewPageRoute:
      return _getPageRoute(OverviewPage());
    // case driversPageRoute:
    //   return _getPageRoute(DriversPage());
    case clientsPageRoute:
      return _getPageRoute(ClientsPage());
    case placesPageRoute:
      return _getPageRoute(PlacesScreen());
    case packgesPageRoute:
      return _getPageRoute(PackgeScreen());
    case hotelPageRoute:
      return _getPageRoute(HotelsScreen());
    // case userPageRoute:
    //   return _getPageRoute(UserScreen());
    case settingsPageRoute:
      return _getPageRoute(SettingsScreen());
    default:
      return _getPageRoute(OverviewPage());
  }
}


PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
