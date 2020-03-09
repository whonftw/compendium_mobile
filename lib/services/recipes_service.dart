import 'package:http/http.dart' as http;

Future<http.Response> fetchAlbum() {
  return http.get('http://10.249.27.144:45456/api/Recipe');
}