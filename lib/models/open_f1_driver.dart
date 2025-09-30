class Openf1Driver {
  final int driverNumber;
  final String fullName;
  final String teamName;
  final String teamColor;
  final String avatarImgUrl;

  Openf1Driver({
    required this.driverNumber,
    required this.fullName,
    required this.teamName,
    required this.teamColor,
    required this.avatarImgUrl
  });

  factory Openf1Driver.fromJson(Map<String, dynamic> json) {
    return Openf1Driver(
      driverNumber: json['driver_number'] as int,
      fullName: json['full_name'],
      teamName: json['team_name'],
      teamColor: json['team_colour'],
      avatarImgUrl: json['headshot_url'] ?? ''
    );
  }
}