class Location {
  String locName;
  String countAvail;

  Location({ this.locName, this.countAvail });

  factory Location.fromJSON(Map<dynamic, dynamic> parsedJson) {
    return Location(locName: parsedJson['locName'], countAvail: parsedJson['locSlot']);
  }
}

class LocationList {
  List<Location> locationList;

  LocationList({ this.locationList });

  factory LocationList.fromJSON(Map<dynamic, dynamic> json) {
    return LocationList(locationList: parselocation(json));
  }

  static List<Location> parselocation(locationJSON) {
    var locList = locationJSON['browseList'] as List;
    List<Location> locationList = locList.map((data) => Location.fromJSON(data)).toList();
    return locationList;
  }
}