part of 'services.dart';

class UserServices {
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
          .timeout(Duration(seconds: 3));

      if (response.statusCode != 200) {
        return ApiReturnValue(message: "Please try again");
      }

      var data = jsonDecode(response.body);

      User.token = data['data']['access_token'];
      User value = User.fromJson(data['data']['user']);

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
