import 'package:http/http.dart' as http;

class HttpService{
  Future<http.Response>getMethod(String url, Map<String, String> headers)async{
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: headers);
    return response;
  }
}