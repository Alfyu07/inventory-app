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
    var uri = Uri.https("inventory-lpp.herokuapp.com", '/api/asset', params);

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
  }

  static Future<ApiReturnValue<Asset>> getAssetByHash(String hash,
      {http.Client client}) async {
    try {
      client ??= http.Client();

      final Map<String, String> params = {'hash': hash};
      var uri = Uri.https("inventory-lpp.herokuapp.com", '/api/asset', params);

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
        picturePath:
            "https://inventory-lpp.herokuapp.com/storage/" + value.picturePath);
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

  static Future<ApiReturnValue<Asset>> editAsset(Asset asset, File imageFile,
      {http.MultipartRequest request}) async {
    String url = baseUrl + 'asset/edit';
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
    request.fields['description'] = asset.description;

    if (imageFile != null) {
      var multipartFile =
          await http.MultipartFile.fromPath('image', imageFile.path);
      request.files.add(multipartFile);
    }

    var response = await request.send();

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Edit item failed, please try again");
    }
    String responseBody = await response.stream.bytesToString();

    var data = jsonDecode(responseBody);

    Asset value = Asset.fromJson(data['data']['asset']);
    value = value.copyWith(
        picturePath:
            "https://inventory-lpp.herokuapp.com/storage/" + value.picturePath);
    print(value.picturePath);
    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<List<Asset>>> search(String name,
      {http.Client client}) async {
    try {
      client ??= http.Client();

      String url = baseUrl + 'assets';
      var uri = Uri.parse(url);
      var response = await client.post(uri,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(<String, String>{
            'name': name,
          }));

      if (response.statusCode != 200) {
        return ApiReturnValue(message: 'Please try again');
      }

      var data = jsonDecode(response.body);

      List<Asset> products =
          (data['data'] as Iterable).map((e) => Asset.fromJson(e)).toList();

      return ApiReturnValue(value: products);
    } on Exception catch (e) {
      return ApiReturnValue(message: e.toString());
    }
  }
}
