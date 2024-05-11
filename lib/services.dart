import 'dart:convert';
import 'package:employee_details/models.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<DummyUser> userData() async {
  Response res = await http.get(Uri.parse('https://dummyjson.com/users'));

  try {
    if (res.statusCode == 200) {
      var results = jsonDecode(res.body);

      print(results);

      return DummyUser.fromJson(json.decode(res.body));
    } else {
      print('Data is there but something went wrong');
      return DummyUser();
    }
  } catch (e) {
    print(e.toString());
    return DummyUser();
  }
}
