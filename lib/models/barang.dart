part of 'models.dart';

class Barang {
  //TODO:tambahkan time pada class barang -> ngurutin
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String condition;
  final String price;
  final String tanggalDibeli;
  final String qrCode;

  Barang(
      {this.id,
      this.picturePath,
      this.name,
      this.description,
      this.condition,
      this.price, //TODO:tambahkan time pada class barang -> ngurutin

      this.tanggalDibeli,
      this.qrCode});
}

List<Barang> mockBarang = [
  Barang(
      id: 1,
      picturePath:
          'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=259&q=80',
      name: 'Kucing Rumahan',
      description: 'Kucing ini ramah banget',
      condition: 'bagus',
      tanggalDibeli: "",
      price: '2.000.000'),
  Barang(
      id: 2,
      picturePath:
          'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=259&q=80',
      name: 'Kucing Kampungan',
      description: 'Kucing ini ramah banget',
      condition: 'bagus',
      price: '2.000.000'),
  Barang(
      id: 3,
      picturePath:
          'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=259&q=80',
      name: 'Kucing Kotaan',
      description: 'Kucing ini ramah banget',
      condition: 'bagus',
      price: '2.000.000'),
  Barang(
      id: 4,
      picturePath:
          'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=259&q=80',
      name: 'Kucing Negara',
      description: 'Kucing ini ramah banget',
      condition: 'rusak',
      price: '2.000.000'),
  Barang(
      id: 5,
      picturePath:
          'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=259&q=80',
      name: 'Kucing Benua',
      description: 'Kucing ini ramah banget',
      condition: 'rusak',
      price: '2.000.000'),
  Barang(
      id: 6,
      picturePath:
          'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=259&q=80',
      name: 'Kucing Dunia',
      description: 'Kucing ini ramah banget',
      condition: 'rusak',
      price: '2.000.000'),
  Barang(
      id: 7,
      picturePath:
          'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=259&q=80',
      name: 'Kucing Akhirat',
      description: 'Kucing ini ramah banget',
      condition: 'bagus',
      price: '2.000.000'),
  Barang(
      id: 8,
      picturePath:
          'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=259&q=80',
      name: 'Kucing Langit',
      description: 'Kucing ini ramah banget',
      condition: 'bagus',
      price: '2.000.000'),
  Barang(
      id: 9,
      picturePath:
          'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=259&q=80',
      name: 'Kucing Neraka',
      description: 'Kucing ini ramah banget',
      condition: 'bagus',
      price: '2.000.000'),
  Barang(
      id: 10,
      picturePath:
          'https://images.unsplash.com/photo-1561948955-570b270e7c36?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=259&q=80',
      name: 'Kucing Surga',
      description: 'Kucing ini ramah banget',
      condition: 'bagus',
      price: '2.000.000'),
];
