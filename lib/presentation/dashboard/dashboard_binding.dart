import 'package:get/get.dart';

import '../../data/repository/auth_repository.dart';
import '../../data/repository/banner_repository.dart';
import '../../data/repository/course_repository.dart';
import '../../data/services/dio_client.dart';
import '../../data/services/firebase_auth_service.dart';
import '../auth/login/login_controller.dart';
import 'dashboard_controller.dart';
import 'home/home_controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthServiceImpl());
    Get.lazyPut<CourseRepository>(
        () => CourseRepositoryImpl(Get.find<DioClient>()));
    Get.lazyPut<BannerRepository>(
        () => BannerRepositoryImpl(Get.find<DioClient>()));
    Get.lazyPut<AuthRepository>(
        () => AuthRepositoryImpl(Get.find<DioClient>()));
    Get.lazyPut(() => LoginController(
          authRepository: Get.find<AuthRepository>(),
          firebaseAuthService: Get.find<FirebaseAuthService>(),
        ));
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(
      () => HomeController(
        Get.find<FirebaseAuthService>(),
        Get.find<CourseRepository>(),
        Get.find<BannerRepository>(),
        Get.find<AuthRepository>(),
      ),
    );
  }
}
