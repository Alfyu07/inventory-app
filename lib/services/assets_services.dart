part of 'services.dart';

class AssetServices {
  static Future<ApiReturnValue<List<Asset>>> getAssets() async {
    await Future.delayed(Duration(seconds: 3));

    return ApiReturnValue(value: mockAssets);
  }

  static Future<ApiReturnValue<Asset>> addAsset() async {
    await Future.delayed(Duration(seconds: 2));

    return ApiReturnValue(value: mockAssets[0].copyWith(id: 123));
  }

  static Future<ApiReturnValue<List<Asset>>> sortAssets(value) async {
    //TODO: API FILTER
    await Future.delayed(Duration(seconds: 1));

    if (value == 'terbaru') {
      mockAssets.sort((a, b) => a.id.compareTo(b.id));
      return ApiReturnValue(value: mockAssets);
    } else if (value == 'terlama') {
      mockAssets.sort((a, b) => b.id.compareTo(a.id));
      return ApiReturnValue(value: mockAssets);
    } else if (value == 'kondisi') {
      mockAssets.sort((a, b) => a.condition.compareTo(b.condition));
      return ApiReturnValue(value: mockAssets);
    }
  }
}
