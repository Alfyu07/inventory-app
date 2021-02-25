part of 'models.dart';

class Asset extends Equatable {
  final int id;
  final String name;
  final String picturePath;
  final String description;
  final String condition;
  final int price;
  final DateTime tanggalDibeli;
  final String qrCode;
  final String location;

  Asset(
      {this.id,
      this.name,
      this.picturePath,
      this.description,
      this.condition,
      this.price,
      this.tanggalDibeli,
      this.qrCode,
      this.location});

  Asset copyWith(
      {int id,
      String name,
      String picturePath,
      String description,
      String condition,
      int price,
      DateTime tanggalDibeli,
      String qrCode,
      String location}) {
    return Asset(
      id: id ?? this.id,
      name: name ?? this.name,
      picturePath: picturePath ?? this.picturePath,
      description: description ?? this.description,
      condition: condition ?? this.condition,
      price: price ?? this.price,
      tanggalDibeli: tanggalDibeli ?? this.tanggalDibeli,
      qrCode: qrCode ?? this.qrCode,
      location: location ?? this.location,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [
        id,
        name,
        picturePath,
        description,
        condition,
        price,
        tanggalDibeli,
        qrCode,
        location
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
    condition: 'bagus',
    tanggalDibeli: DateTime.now(),
    price: 2000000,
    location: 'Gudang',
  ),
  Asset(
    id: 2,
    picturePath:
        'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=259&q=80',
    name: 'Kucing Kampungan',
    description:
        'Kucing ini dibeli untuk keperluan pelatihan bahasa kucing rumah bahasa',
    condition: 'bagus',
    tanggalDibeli: DateTime.now(),
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
      condition: 'bagus',
      price: 2000000,
      tanggalDibeli: DateTime.now(),
      location: 'Gudang'),
  Asset(
    id: 4,
    picturePath:
        'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=259&q=80',
    name: 'Kucing Negara',
    description:
        'Kucing ini dibeli untuk keperluan pelatihan bahasa kucing rumah bahasa',
    condition: 'rusak',
    tanggalDibeli: DateTime.now(),
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
    condition: 'rusak',
    tanggalDibeli: DateTime.now(),
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
    condition: 'rusak',
    tanggalDibeli: DateTime.now(),
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
    condition: 'bagus',
    tanggalDibeli: DateTime.now(),
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
    condition: 'bagus',
    tanggalDibeli: DateTime.now(),
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
    condition: 'bagus',
    tanggalDibeli: DateTime.now(),
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
    condition: 'bagus',
    tanggalDibeli: DateTime.now(),
    price: 2000000,
    location: 'Gudang',
  ),
];