import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/exercise_list_response.dart';
import '../../../routes/routes.dart';
import 'exercise_list_controller.dart';

/// Arguments untuk dibawa saat pindah/navigate ke halaman ExerciseListPage
class ExerciseListPageArgs {
  final String courseId;
  final String courseName;

  const ExerciseListPageArgs({
    required this.courseId,
    required this.courseName,
  });
}

class ExerciseListPage extends StatefulWidget {
  const ExerciseListPage({Key? key}) : super(key: key);

  @override
  State<ExerciseListPage> createState() => _ExerciseListPageState();
}

class _ExerciseListPageState extends State<ExerciseListPage> {
  @override
  void initState() {
    super.initState();
    // Call API
  }

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width >= 600;
    return GetBuilder<ExerciseListController>(
      builder: (ExerciseListController controller) {
        List<ExerciseListData> exercises = controller.exerciseList;

        return Scaffold(
          appBar: AppBar(
            title: Text(controller.courseName),
          ),
          body: controller.isExerciseListLoading
              ? const Center(child: CircularProgressIndicator())
              : exercises.isEmpty
                  ? Center(
                      child: Text('Yah, Paket tidak tersedia'),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.all(20),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 153 / 96,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: exercises.length,
                      itemBuilder: (context, index) {
                        ExerciseListData exercise = exercises[index];
                        var progress =
                            '${exercise.jumlahDone}/${exercise.jumlahSoal} Soal';
                        return InkWell(
                          onTap: () {
                            Get.toNamed(
                              Routes.exerciseQuestionForm,
                              arguments: exercises[index].exerciseId,
                            );
                          },
                          child: Container(
                            height: 250,
                            width: 250,
                            child: Flexible(
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    child: SizedBox(
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              exercise.icon!,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    exercise.exerciseTitle ?? '',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(progress),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
        );
      },
    );
  }
}
