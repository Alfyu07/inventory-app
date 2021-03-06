import 'dart:io';
import 'dart:typed_data';
import 'dart:async';
import 'dart:convert';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' as getx;

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:inventory_app/bloc/bloc.dart';
import 'package:inventory_app/cubit/asset_cubit.dart';
import 'package:inventory_app/cubit/user_cubit.dart';
import 'package:path_provider/path_provider.dart';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';
import 'package:supercharged/supercharged.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:inventory_app/shared/shared.dart';
import 'package:inventory_app/ui/widgets/widgets.dart';
import 'package:inventory_app/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'general_page.dart';
part 'login_page.dart';

part 'main_page.dart';
part 'add_asset_form_page.dart';
part 'edit_asset_form_page.dart';
part 'dashboard_page.dart';
part 'scan_qr_page.dart';
part 'detail_page.dart';
part 'illustration_page.dart';
part 'success_add_asset_page.dart';
part 'error_404.dart';
part 'qr_page.dart';
