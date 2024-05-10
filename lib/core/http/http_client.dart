import 'package:http/http.dart';
import 'package:catbreeds/core/constants/constants.dart';

class HttpClient {
  const HttpClient({required this.client});

  final Client client;
  final baseUrl = 'https://api.thecatapi.com/v1';
  final headers = const {
    'x-api-key': AppConstants.apiKey,
  };
}
