class Team {
  final String id;
  final String name;
  String teamColor = '000000';

  Team({
    required this.id,
    required this.name
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['constructorId'],
      name: json['name']
    );
  }
}