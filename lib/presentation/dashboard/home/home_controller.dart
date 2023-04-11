import 'package:final_project_ebook/data/model/banner_response.dart';
import 'package:final_project_ebook/data/model/user_response.dart';
import 'package:get/get.dart';

import '../../../data/model/course_response.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../data/repository/banner_repository.dart';
import '../../../data/repository/course_repository.dart';
import '../../../data/services/firebase_auth_service.dart';

class HomeController extends GetxController {
  final FirebaseAuthService firebaseAuthService;
  final CourseRepository courseRepository;
  final BannerRepository bannerRepository;
  final AuthRepository authRepository;

  HomeController(
    this.firebaseAuthService,
    this.courseRepository,
    this.bannerRepository,
    this.authRepository,
  );

  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(milliseconds: 100)).then((value) async {
      await getUserData();
    });
  }

  List<CourseData> courseList = [];
  List<BannerData> bannerList = [];
  bool isGetCoursesLoading = false;
  bool isGetBannersLoading = false;

  // Currently set to static
  String majorName = 'IPA';
  int maxHomeCourseCount = 5;

  UserData? userData;

  Future<void> getUserData() async {
    final String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {
      final user = await authRepository.getUserByEmail(email: email);
      if (user != null) userData = user;

      update();
    }
  }

  Future<void> getCourses() async {
    // Set Loading
    isGetCoursesLoading = true;
    update();
    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {
      List<CourseData>? result = await courseRepository.getCourses(
        majorName: majorName,
        email: email,
      );

      isGetCoursesLoading = false;
      List<CourseData> finalResult = [];

      result.forEach((value) {
        if (value.courseName != 'PU') {
          finalResult.add(value);
        }
      });
      courseList = finalResult;
      update();
    }
  }

  Future<void> getBanners() async {
    // Set Loading
    isGetBannersLoading = true;
    update();
    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {
      List<BannerData> result = await bannerRepository.getBanners(limit: 5);
      isGetBannersLoading = false;
      bannerList = result;
      update();
    }
  }
}
