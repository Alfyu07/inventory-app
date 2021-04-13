part of 'models.dart';

class Asset extends Equatable {
  final int id;
  final String name;
  final String picturePath;
  final String description;
  final String condition;
  final int price;
  final String purchaseDate;
  final String qrCode;
  final String location;
  final String hash;

  Asset({
    this.id,
    this.name,
    this.picturePath,
    this.description,
    this.condition,
    this.price,
    this.purchaseDate,
    this.qrCode,
    this.location,
    this.hash,
  });
  String getPurchaseDate() {
    var token = purchaseDate.split('-');
    return token[2] + '-' + token[1] + '-' + token[0];
  }

  Asset copyWith({
    int id,
    String name,
    String description,
    String condition,
    int price,
    String purchaseDate,
    String qrCode,
    String location,
    String picturePath,
    String hash,
  }) {
    return Asset(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      condition: condition ?? this.condition,
      price: price ?? this.price,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      qrCode: qrCode ?? this.qrCode,
      location: location ?? this.location,
      picturePath: picturePath ?? this.picturePath,
      hash: hash ?? this.hash,
    );
  }

  factory Asset.fromJson(Map<String, dynamic> data) => Asset(
        id: data['id'],
        name: data['name'],
        description: data['description'],
        price: data['price'],
        condition: data['condition'],
        purchaseDate: data['purchase_date'],
        location: data['location'],
        picturePath: data['picture_path'],
        hash: data['hash'],
      );
  @override
  List<Object> get props => [
        id,
        name,
        picturePath,
        description,
        condition,
        price,
        purchaseDate,
        qrCode,
        location,
        hash,
      ];
}

List<Asset> mockAssets = [
  Asset(
      id: 1,
      picturePath:
          'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=259&q=80',
      name: 'Kucing Rumahan',
      description:
          'Kucing ini dibeli untuk keperluan pelatihan bahasa kucing rumah bahasa',
      condition: 'Bagus',
      purchaseDate: "2020-12-31",
      price: 2000000,
      location: 'Gudang',
      hash:
          "\$5\$zQUCjEzs9jnrRdCK\$dbo1i9WjQjbUwOC4JCRAZHpfd31Dh676vI0L6w0dZw1"),
  Asset(
    id: 2,
    picturePath:
        'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=259&q=80',
    name: 'Kucing Kampungan',
    description:
        'Kucing ini dibeli untuk keperluan pelatihan bahasa kucing rumah bahasa',
    condition: 'Bagus',
    purchaseDate: "2020-12-31",
    price: 2000000,
    location: 'Gudang',
  ),
  Asset(
      id: 3,
      picturePath:
          'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=259&q=80',
      name: 'Kucing Kotaan',
      description:
          'Kucing ini dibeli untuk keperluan pelatihan bahasa kucing rumah bahasa',
      condition: 'Bagus',
      price: 2000000,
      purchaseDate: "2020-12-31",
      location: 'Gudang'),
  Asset(
    id: 4,
    picturePath:
        'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=259&q=80',
    name: 'Kucing Negara',
    description:
        'Kucing ini dibeli untuk keperluan pelatihan bahasa kucing rumah bahasa',
    condition: 'Rusak',
    purchaseDate: "2020-12-31",
    price: 2000000,
    location: 'Gudang',
  ),
  Asset(
    id: 5,
    picturePath:
        'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=259&q=80',
    name: 'Kucing Benua',
    description:
        'Kucing ini dibeli untuk keperluan pelatihan bahasa kucing rumah bahasa',
    condition: 'Rusak',
    purchaseDate: "2020-12-31",
    price: 2000000,
    location: 'Gudang',
  ),
  Asset(
    id: 6,
    picturePath:
        'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=259&q=80',
    name: 'Kucing Dunia',
    description:
        'Kucing ini dibeli untuk keperluan pelatihan bahasa kucing rumah bahasa',
    condition: 'Rusak',
    purchaseDate: "2020-12-31",
    price: 2000000,
    location: 'Gudang',
  ),
  Asset(
    id: 7,
    picturePath:
        'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=259&q=80',
    name: 'Kucing Akhirat',
    description:
        'Kucing ini dibeli untuk keperluan pelatihan bahasa kucing rumah bahasa',
    condition: 'Bagus',
    purchaseDate: "2020-12-31",
    price: 2000000,
    location: 'Gudang',
  ),
  Asset(
    id: 8,
    picturePath:
        'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=259&q=80',
    name: 'Kucing Langit',
    description:
        'Kucing ini dibeli untuk keperluan pelatihan bahasa kucing rumah bahasa',
    condition: 'Bagus',
    purchaseDate: "2020-12-31",
    price: 2000000,
    location: 'Kantor',
  ),
  Asset(
    id: 9,
    picturePath:
        'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=259&q=80',
    name: 'Kucing Neraka',
    description:
        'Kucing ini dibeli untuk keperluan pelatihan bahasa kucing rumah bahasa',
    condition: 'Bagus',
    purchaseDate: "2020-12-31",
    price: 2000000,
    location: 'Gudang',
  ),
  Asset(
    id: 10,
    picturePath:
        'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=259&q=80',
    name: 'Kucing Surga',
    description:
        'Kucing ini dibeli untuk keperluan pelatihan bahasa kucing rumah bahasa',
    condition: 'Bagus',
    purchaseDate: "2020-12-31",
    price: 2000000,
    location: 'Gudang',
  ),
  Asset(
    id: 11,
    picturePath:
        'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=259&q=80',
    name: 'Kucing Rumahan',
    description:
        'Kucing ini dibeli untuk keperluan pelatihan bahasa kucing rumah bahasa',
    condition: 'Bagus',
    purchaseDate: "2020-12-31",
    price: 2000000,
    location: 'Gudang',
  ),
  Asset(
    id: 12,
    picturePath:
        'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=259&q=80',
    name: 'Kucing Rumahan',
    description:
        'Kucing ini dibeli untuk keperluan pelatihan bahasa kucing rumah bahasa',
    condition: 'Bagus',
    purchaseDate: "2020-12-31",
    price: 2000000,
    location: 'Gudang',
  ),
  Asset(
    id: 13,
    picturePath:
        'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=259&q=80',
    name: 'Kucing Rumahan',
    description:
        'Kucing ini dibeli untuk keperluan pelatihan bahasa kucing rumah bahasa',
    condition: 'Bagus',
    purchaseDate: "2020-12-31",
    price: 2000000,
    location: 'Gudang',
  ),
  Asset(
    id: 14,
    picturePath:
        'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=259&q=80',
    name: 'Kucing Rumahan',
    description:
        'Kucing ini dibeli untuk keperluan pelatihan bahasa kucing rumah bahasa',
    condition: 'Bagus',
    purchaseDate: "2020-12-31",
    price: 2000000,
    location: 'Gudang',
  ),
  Asset(
    id: 15,
    picturePath:
        'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=259&q=80',
    name: 'Kucing Rumahan',
    description:
        'Kucing ini dibeli untuk keperluan pelatihan bahasa kucing rumah bahasa',
    condition: 'Bagus',
    purchaseDate: "2020-12-31",
    price: 2000000,
    location: 'Gudang',
  ),
];
