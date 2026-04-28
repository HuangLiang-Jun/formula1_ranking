import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:formula1_ranking/models/open_f1_driver.dart';
import 'package:formula1_ranking/repository/f1_repository.dart';

class AppData {
  late final F1Repository respository;
  static final AppData _instance = AppData._internal();
  factory AppData() => _instance;
  AppData._internal();

  late List<Openf1Driver> drivers = [];
  late int latestSessionKey = 9904;
  Map<String, String> teamColors = {};

  Future<void> init(F1Repository? repo) async {
    respository = repo ?? F1Repository();
    try {
      await getLatestSession();
      final res = await respository.getDriverAvatar(latestSessionKey);
      final decoded = jsonDecode(res);
      if (decoded is List) {
        drivers = decoded
          .map((e) => Openf1Driver.fromJson(e as Map<String, dynamic>))
          .toList();
        for (Openf1Driver driver in drivers) {
          teamColors[driver.teamName] = driver.teamColor;
        }
      }
    } catch (e) {
      debugPrint("AppData init error: $e");
      // Keep defaults if failed
    }
  }

  Future<void> getLatestSession() async {
    try {
      final String year = DateTime.now().year.toString();
      final res = await respository.getLatestSession(year);
      final sessions = jsonDecode(res);
      if (sessions is List && sessions.isNotEmpty) {
        final lastSession = sessions.last as Map<String, dynamic>;
        latestSessionKey = lastSession['session_key'] as int? ?? 9904;
      } else {
        latestSessionKey = 9904;
      }
    } catch (e) {
      debugPrint("getLatestSession error: $e");
      latestSessionKey = 9904;
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