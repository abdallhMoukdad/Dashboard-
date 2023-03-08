class DigestAuthSuccess {
  DigestAuthSuccess({
    required this.numberOfPackages,
    required this.numberOfPackagesOpened,
    required this.numberOfPackagesFinished,
    required  this.day,
    required  this.week,
    required  this.month,
    required  this.year,
  });

  int numberOfPackages;
  String numberOfPackagesOpened;
  String numberOfPackagesFinished;
  String day;
  String week;
  String month;
  String year;

  factory DigestAuthSuccess.fromJson(Map<String, dynamic> json) => DigestAuthSuccess(
    numberOfPackages: json["number of packages:"],
    numberOfPackagesOpened: json["number of packages opened:"],
    numberOfPackagesFinished: json["number of packages finished:"],
    day: json["day"],
    week: json["week"],
    month: json["month"],
    year: json["year"],
  );

  Map<String, dynamic> toJson() => {
    "number of packages:": numberOfPackages,
    "number of packages opened:": numberOfPackagesOpened,
    "number of packages finished:": numberOfPackagesFinished,
    "day": day,
    "week": week,
    "month": month,
    "year": year,
  };
}
