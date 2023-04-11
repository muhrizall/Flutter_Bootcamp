import 'dart:io';

import 'package:final_project_ebook/presentation/auth/login/login_binding.dart';
import 'package:final_project_ebook/presentation/splash/splash_binding.dart';
import 'package:final_project_ebook/presentation/splash/splash_page.dart';
import 'package:final_project_ebook/routes/pages_binding.dart';
import 'package:final_project_ebook/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      getPages: Pages.pages,
      initialRoute: Routes.splash,
      initialBinding: Pages.pages[1].binding,
    );
  }
}

/// To handle Error: HandshakeException: Handshake error in client (OS Error: CERTIFICATE_VERIFY_FAILED: certificate has expired(handshake.cc:393))
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
