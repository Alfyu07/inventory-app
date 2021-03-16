part of 'services.dart';

class AssetServices {
  static Future<ApiReturnValue<List<Asset>>> getAssets() async {
    await Future.delayed(Duration(seconds: 3));

    return ApiReturnValue(value: mockAssets);
  }

  static Future<ApiReturnValue<List<Asset>>> addAsset(Asset asset,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseUrl + 'asset';
    var uri = Uri.parse(url);

    var response = await client.post(uri, headers: {
      "Content-type": "application/json",
      "Authorization": User.token
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Add item failed, please try again");
    }

    var data = jsonDecode(response.body);

    List<Asset> value = [Asset.fromJson(data['data']['asset'])];
    return ApiReturnValue(value: value);
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
