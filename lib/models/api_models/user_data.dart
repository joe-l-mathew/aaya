
class UserData {
  final int id;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final int phoneNumber;
  final String name;
  final String profileURL;
  final String fcmtoken;
  final int? currentLocationID;
  final CurrentLocation currentLocation;
  final bool isBlocked;
  final String token;

  UserData({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.phoneNumber,
    required this.name,
    required this.profileURL,
    required this.fcmtoken,
    this.currentLocationID,
    required this.currentLocation,
    required this.isBlocked,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['data']['ID'],
      createdAt: json['data']['CreatedAt'],
      updatedAt: json['data']['UpdatedAt'],
      deletedAt: json['data']['DeletedAt'],
      phoneNumber: json['data']['PhoneNumber'],
      name: json['data']['Name'],
      profileURL: json['data']['ProfileURL'],
      fcmtoken: json['data']['FCMTocken'],
      currentLocationID: json['data']['CurrentLocationID'],
      currentLocation:
          CurrentLocation.fromJson(json['data']['CurrentLocation']),
      isBlocked: json['data']['IsBlocked'],
      token: json['token'],
    );
  }
}

class CurrentLocation {
  final int id;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final int userID;
  final double latitude;
  final double longitude;
  final String locationName;

  CurrentLocation({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.userID,
    required this.latitude,
    required this.longitude,
    required this.locationName,
  });

  factory CurrentLocation.fromJson(Map<String, dynamic> json) {
    return CurrentLocation(
      id: json['ID'],
      createdAt: json['CreatedAt'],
      updatedAt: json['UpdatedAt'],
      deletedAt: json['DeletedAt'],
      userID: json['UserID'],
      latitude: json['Latitude'].toDouble(),
      longitude: json['Longitude'].toDouble(),
      locationName: json['LocationName'],
    );
  }
}
