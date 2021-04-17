part of 'services.dart';

class UserServices {
  static Future<bool> hasToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') != null;
  }

  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static void persistToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    User.token = token;
  }

  static void deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', null);
    User.token = null;
  }

  static Future<ApiReturnValue<User>> signIn(String email, String password,
      {http.Client client}) async {
    try {
      client ??= http.Client();

      String url = baseUrl + 'login';
      var uri = Uri.parse(url);
      var response = await client
          .post(
            uri,
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(
              <String, String>{"email": email, "password": password},
            ),
          )
          .timeout(Duration(seconds: 25));

      if (response.statusCode != 200) {
        return ApiReturnValue(message: "Please try again");
      }

      var data = jsonDecode(response.body);

      persistToken(data['data']['access_token']);
      User value = User.fromJson(data['data']['user']);

      return ApiReturnValue(value: value);
    } on SocketException {
      return ApiReturnValue(message: "Check your internet connection");
    } on TimeoutException {
      return ApiReturnValue(message: "Please try again");
    } on Error catch (e) {
      return ApiReturnValue(message: "error : $e");
    }
  }

  static Future<ApiReturnValue<String>> signOut({http.Client client}) async {
    try {
      client ??= http.Client();

      String url = baseUrl + 'login';
      var uri = Uri.parse(url);
      var response = await client.post(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${User.token}"
        },
      ).timeout(Duration(seconds: 25));

      if (response.statusCode != 200) {
        return ApiReturnValue(message: "Please try again");
      }

      deleteToken();

      return ApiReturnValue(value: "Sign out success");
    } on SocketException {
      return ApiReturnValue(message: "Check your internet connection");
    } on TimeoutException {
      return ApiReturnValue(message: "Please try again");
    } on Error catch (e) {
      return ApiReturnValue(message: "error : $e");
    } on Exception {
      return ApiReturnValue(message: "Something went wrong");
    }
  }

  static Future<ApiReturnValue<User>> getCurrentUser(
      {http.Client client}) async {
    try {
      client ??= http.Client();

      String url = baseUrl + 'user';
      var uri = Uri.parse(url);
      print(User.token);

      var response = await client.get(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${User.token}"
        },
      ).timeout(Duration(seconds: 25));

      if (response.statusCode != 200) {
        return ApiReturnValue(message: "Please try again");
      }

      var data = jsonDecode(response.body);

      User value = User.fromJson(data['data']);

      return ApiReturnValue(value: value);
    } on SocketException {
      return ApiReturnValue(message: "Check your internet connection");
    } on TimeoutException {
      return ApiReturnValue(message: "Please try again");
    } on Error catch (e) {
      return ApiReturnValue(message: "error : $e");
    } on Exception {
      return ApiReturnValue(message: "Something went wrong");
    }
  }
}
