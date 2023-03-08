const rootRoute = "/";

const overviewPageDisplayName = "Overview";
const overviewPageRoute = "/overview";

// const driversPageDisplayName = "Drivers";
// const driversPageRoute = "/drivers";

const clientsPageDisplayName = "Clients";
const clientsPageRoute = "/clients";

const hotelPageDisplayName = "Hotel";
const hotelPageRoute = "/hotel";


const authenticationPageDisplayName = "Log out";
const authenticationPageRoute = "/auth";

const loginPageRoute = "/login";
const loginPageDisplayName = "Log out";


const placesPageDisplayName = "Places";
const placesPageRoute = "/places";

// const userPageDisplayName = "User";
// const userPageRoute = "/user";

const settingsPageDisplayName = "Settings";
const settingsPageRoute = "/settings";

const packgesPageDisplayName = "Packges";
const packgesPageRoute = "/packges";


class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItemRoutes = [
  MenuItem(overviewPageDisplayName, overviewPageRoute),
  // MenuItem(driversPageDisplayName, driversPageRoute),
  MenuItem(clientsPageDisplayName, clientsPageRoute),
  MenuItem(packgesPageDisplayName, packgesPageRoute),
  MenuItem(placesPageDisplayName, placesPageRoute),
  MenuItem(hotelPageDisplayName, hotelPageRoute),

  // MenuItem(userPageDisplayName, userPageRoute),
  MenuItem(settingsPageDisplayName, settingsPageRoute),
  MenuItem(authenticationPageDisplayName, authenticationPageRoute),
 // MenuItem(loginPageDisplayName, loginPageRoute),

];
