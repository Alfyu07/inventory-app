part of 'services.dart';

class AssetServices {
  static Future<ApiReturnValue<List<Asset>>> getAssets() async {
    await Future.delayed(Duration(milliseconds: 3));

    return ApiReturnValue(value: mockAssets);
  }

  static Future<ApiReturnValue<Asset>> addAsset() async {
    await Future.delayed(Duration(milliseconds: 2));

    return ApiReturnValue(value: mockAssets[0].copyWith(id: 123));
  }
}
