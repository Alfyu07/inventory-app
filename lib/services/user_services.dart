part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<User>> signIn(email, password) async {
    await Future.delayed(Duration(milliseconds: 500));

    return ApiReturnValue(value: mockUser);
    // return ApiReturnValue(message: "Wrong email or password");
  }
}