class Driver {
  final String id;
  final String number;
  final String code;
  final String firstName;
  final String lastName;
  String avator = '';

  Driver({
    required this.id,
    required this.number,
    required this.code,
    required this.firstName,
    required this.lastName
  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json['driverId'],
      number: json['permanentNumber'],
      code: json['code'],
      firstName: json['givenName'],
      lastName: json['familyName'],
    );
  }

  String get fullName => '$firstName ${lastName.toUpperCase()}';
}