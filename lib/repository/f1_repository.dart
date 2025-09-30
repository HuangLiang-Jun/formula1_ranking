import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class F1Repository {
  final String baseUrl = dotenv.env['BASE_URL'] ?? "";
  final String openF1Url = dotenv.env['OPENF1_URL'] ?? "";

  Future<String> getDrivers(String year) async {
    final response = await http.get(
      Uri.parse('$baseUrl/$year/driverstandings'),
    );
    _checkStatusCode(response);
    return response.body;
  }

  Future<String> getTeams(String year) async {
    final response = await http.get(
      Uri.parse('$baseUrl/$year/constructorstandings'),
    );
    _checkStatusCode(response);
    return response.body;
  }

  Future<String> getDriverAvatar(int sessionKey) async {
    final response = await http.get(
      Uri.parse('$openF1Url/drivers?session_key=$sessionKey')
    );
    _checkStatusCode(response);
    return response.body;
  }

  Future<String> getLatestSession(String year) async {
    final response = await http.get(
      Uri.parse('$openF1Url/sessions?year=$year')
    );
    _checkStatusCode(response);
    return response.body;
  }

  void _checkStatusCode(http.Response response) {
    if (response.statusCode != 200) {
      throw Exception('${response.request?.url.toString() ?? 'some api request'} error!');
    }
  }
}