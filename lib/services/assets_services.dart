part of 'services.dart';

class AssetServices {
  static Future<ApiReturnValue<List<Asset>>> getAssets(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseUrl + 'asset';
    var uri = Uri.parse(url);

    return ApiReturnValue(value: mockAssets);
  }

  static Future<ApiReturnValue<Asset>> addAsset(Asset asset, File imageFile,
      {http.MultipartRequest request}) async {
    String url = baseUrl + 'asset/register';
    var uri = Uri.parse(url);
    request ??= http.MultipartRequest("POST", uri)
      ..headers["Content-Type"] = "application/json"
      ..headers["Authorization"] = "Bearer ${User.token}";

    request.fields['name'] = asset.name;
    request.fields['condition'] = asset.condition;
    request.fields['purchase_date'] = asset.purchaseDate;
    request.fields['price'] = asset.price.toString();
    request.fields['location'] = asset.location;
    request.fields['description'] = asset.description;

    var multipartFile =
        await http.MultipartFile.fromPath('image', imageFile.path);
    request.files.add(multipartFile);

    var response = await request.send();

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Add item failed, please try again");
    }
    String responseBody = await response.stream.bytesToString();

    var data = jsonDecode(responseBody);

    Asset value = Asset.fromJson(data['data']['asset']);
    value = value.copyWith(
        picturePath: "http://10.0.2.2:8000/storage/" + value.picturePath);
    print(value.picturePath);
    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<String>> delete(int id,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseUrl + 'delete/$id';
    var uri = Uri.parse(url);
    var response = await client.post(
      uri,
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer ${User.token}"
      },
    );

    if (response.statusCode != 200) {
      ApiReturnValue(message: 'Please try again');
    }
    var data = jsonDecode(response.body);
    var value = data['meta']['message'];
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
