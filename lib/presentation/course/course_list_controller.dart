import 'package:get/get.dart';

import '../../data/model/course_response.dart';
import '../../data/repository/course_repository.dart';
import '../../data/services/firebase_auth_service.dart';

class CourseListController extends GetxController {
  final CourseRepository courseRepository;
  final FirebaseAuthService firebaseAuthService;

  CourseListController(this.courseRepository, this.firebaseAuthService);

  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(milliseconds: 100)).then((value) async {
      await getCourses();
    });
  }

  // Currently set to static
  String majorName = 'IPA';

  List<CourseData> courseList = [];

  Future<void> getCourses() async {
    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {
      List<CourseData> result =
          await courseRepository.getCourses(majorName: majorName, email: email);
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
}
