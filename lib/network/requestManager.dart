import 'package:http/http.dart' as http;

class HttpRequests{
  String? url;
  dynamic body;
  Map<String, String>? headers;

  HttpRequests({url, body, headers}){
    this.url = url;
    this.body = body;
    this.headers = headers;
  }

  Future<dynamic> get() async{
    final response = await http.get(Uri.parse(url!), headers: headers);
    return response;
  }

  Future<dynamic> post() async{
    final response = await http.post(Uri.parse(url!), body: body, headers: headers);
    return response;
  }

  Future<dynamic> put() async{
    final response = await http.put(Uri.parse(url!), body: body, headers: headers);
    return response;
  }

  Future<dynamic> patch() async{
    final response = await http.patch(Uri.parse(url!), body: body, headers: headers);
    return response;
  }

  Future<dynamic> delete() async{
    final response = await http.delete(Uri.parse(url!), headers: headers);
    return response;
  }

  // Future<dynamic> multipartRequest() async{
  //   final response = await http.;
  //   return response;
  // }
}