part of 'services.dart';

class AssetServices {
  static Future<ApiReturnValue<List<Asset>>> getAssets(
      {int page, int limit, String sort, http.Client client}) async {
    client ??= http.Client();

    final Map<String, String> params = {'page': page.toString()};
    if (limit != null) {
      params['limit'] = limit.toString();
    }
    if (sort != null) {
      params['sort'] = sort;
    }
    var uri = Uri.http("10.0.2.2:8000", '/api/asset', params);

    var response = await client.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${User.token}"
      },
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again");
    }
    var data = jsonDecode(response.body);

    List<Asset> assets = (data['data']['data'] as Iterable)
        .map((e) => Asset.fromJson(e))
        .toList();

    return ApiReturnValue(value: assets);

    //TODO: implement reply http request
  }

  static Future<ApiReturnValue<List<Asset>>> getAssetById(int id,
      {http.Client client}) async {
    try {
      client ??= http.Client();

      String url = baseUrl + 'assets?id=${id.toString()}';
      var uri = Uri.parse(url);
      var response = await client.get(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${User.token}"
        },
      );

      if (response.statusCode != 200) {
        return ApiReturnValue(message: 'Please try again');
      }

      var data = jsonDecode(response.body);
      var value = data['data']['data'];
      return ApiReturnValue(value: value);
    } on SocketException {
      return ApiReturnValue(message: "Check your internet connection");
    }
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

    String url = baseUrl + 'asset/delete/${id.toString()}';
    var uri = Uri.parse(url);
    var response = await client.delete(
      uri,
      headers: {
        "Content-Type": "application/json",
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
