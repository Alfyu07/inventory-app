import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:inventory_app/models/models.dart';
import 'package:http/http.dart' as http;

part 'assets_services.dart';
part 'user_services.dart';

String baseUrl = 'https://inventory-lpp.herokuapp.com/api/';
