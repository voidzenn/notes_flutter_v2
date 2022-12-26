import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiRequest {
  final String baseUrl = 'localhost:3000';
  final String path;

  ApiRequest({required this.path});

  httpUri({String? id}) {
    var newPath = id != null ? "$path/$id" : path;
    return Uri.http(baseUrl, newPath);
  }

  get() {
    var url = httpUri();
    return http.get(url);
  }

  post(Object bodyData) {
    var url = httpUri();
    return http.post(url, body: bodyData);
  }

  update(String dataId, Object bodyData) {
    var url = httpUri(id: dataId);
    return http.put(url, body: bodyData);
  }

  delete(String dataId) {
    var url = httpUri(id: dataId);
    return http.delete(url);
  }
}
