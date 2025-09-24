import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class F1Repository {
  final String baseUrl = dotenv.env['BASE_URL'] ?? "";

  Future<String> getDrivers(String year) async {
    final response = await http.get(
      Uri.parse('$baseUrl$year/driverstandings'),
    );
    if (response.statusCode != 200) {
      throw Exception('Get Drivers Failure');
    }
    return response.body;
  }

  Future<String> getTeams(String year) async {
    final response = await http.get(
      Uri.parse('$baseUrl$year/constructorstandings'),
    );
    if (response.statusCode != 200) {
      throw Exception('Get Drivers Failure');
    }
    return response.body;
  }
}