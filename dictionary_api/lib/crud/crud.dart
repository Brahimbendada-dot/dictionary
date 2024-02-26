import 'dart:convert';
import 'package:dictionary_api/enum/status.dart';
import 'package:http/http.dart' as http;

class Crud {
  static Status status = Status.alreadyExecute;
  static getRequest(String url) async {
    try {
      var link = Uri.parse(url);
      var response = await http.get(link);
      if (response.statusCode == 200) {
        status = Status.success;
        return jsonDecode(response.body);
      } else {
        switch (response.statusCode) {
          case 404:
            status = Status.notFound;
            break;
          case 429:
            status = Status.toManyReq;
            break;
        }
      }
    } catch (e) {
      print('catch error: ${e}');
    }
  }
}
