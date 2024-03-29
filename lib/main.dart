import 'dart:io';
import 'package:bid_app/app/core/values/app_assets.dart';
import 'package:bid_app/app/modules/splash/bindings/splash_binding.dart';
import 'package:bid_app/app/routes/app_pages.dart';
import 'package:bid_app/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get_storage/get_storage.dart';
import 'package:new_version/new_version.dart';

late ByteData certificate;

class CustomHttpOverrides extends HttpOverrides {
  ByteData data;
  CustomHttpOverrides(this.data);

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final SecurityContext clientContext = SecurityContext()
      ..setTrustedCertificatesBytes(data.buffer.asUint8List());
    return super.createHttpClient(clientContext);
  }
}

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  certificate = await rootBundle.load(Assets.kCertificate);
  HttpOverrides.global = CustomHttpOverrides(certificate);
  SecurityContext(withTrustedRoots: true);

  await GetStorage.init();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BID - DPW MEA",
      theme: appTheme(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
