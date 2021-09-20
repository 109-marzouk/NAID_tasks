import 'package:http/http.dart';
import '../../controllers/user.dart';

import '../Constants.dart';

// Singleton Pattern
class ApiServices {
  static ApiServices? _apiServices;

  ApiServices._instance();

  factory ApiServices() {
    _apiServices ??= ApiServices._instance();
    return _apiServices!;
  }

  Future<List<User>?> getUsers() async {
    String url =
        "${Constants.BASE_URL}/users";
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      try {
        return userFromMap(response.body);
      } catch (e) {
        print("Error while parsing the data");
      }
    } else {
      print('Connection Error: ${response.statusCode}');
    }
  }
}
