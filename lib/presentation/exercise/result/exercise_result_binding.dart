import 'package:get/get.dart';

import '../../../data/services/dio_client.dart';
import '../../../data/services/firebase_auth_service.dart';
import 'exercise_result_controller.dart';

class ExerciseResultBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExerciseResultController());
  }
}
