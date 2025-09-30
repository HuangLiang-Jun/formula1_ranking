import 'dart:convert';

import 'package:formula1_ranking/models/open_f1_driver.dart';
import 'package:formula1_ranking/repository/f1_repository.dart';

class AppData {
  late final F1Repository respository;
  static final AppData _instance = AppData._internal();
  factory AppData() => _instance;
  AppData._internal();

  late List<Openf1Driver> drivers;
  late int latestSessionKey;
  Map<String, String> teamColors = {};

  Future<void> init(F1Repository? repo) async {
    respository = repo ?? F1Repository();
    await getLatestSession();
    final res = await respository.getDriverAvatar(latestSessionKey);
    drivers = (jsonDecode(res) as List<dynamic>)
      .map((e) => Openf1Driver.fromJson(e as Map<String, dynamic>))
      .toList();
    for (Openf1Driver driver in drivers) {
      teamColors[driver.teamName] = driver.teamColor;
    }
  }

  Future<void> getLatestSession() async {
    final String year = DateTime.now().year.toString();
    final res = await respository.getLatestSession(year);
    final sessions = jsonDecode(res) as List<dynamic>;
    if (sessions.lastOrNull == null) {
      latestSessionKey = 9904; // 隨便抓一場比較新的 key
    } else {
      latestSessionKey = (sessions.last as Map<String, dynamic>)['session_key'] as int;
    }
  }

  String getDriverAvatar(String fullName, int number) {
    for (Openf1Driver driver in drivers) {
      if (driver.fullName == fullName) {
        return driver.avatarImgUrl;
      }
    }

    for (Openf1Driver driver in drivers) {
      if (driver.driverNumber == number) {
        return driver.avatarImgUrl;
      }
    }
    return '';
  }

  String getDriverTeamColor(String fullName, int number) {
    for (Openf1Driver driver in drivers) {
      if (driver.fullName == fullName) {
        return driver.teamColor;
      }
    }

    for (Openf1Driver driver in drivers) {
      if (driver.driverNumber == number) {
        return driver.teamColor;
      }
    }
    return '';
  }

  String getTeamColor(String teamName) {
    return teamColors[teamName] ?? '000000';
  }
}