import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/course_response.dart';
import '../../routes/routes.dart';
import '../exercise/list/exercise_list_page.dart';
import 'course_list_controller.dart';

class CourseListPage extends GetView<CourseListController> {
  const CourseListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mata Pelajaran'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // TODO: Call API getCourses()
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        child: GetBuilder<CourseListController>(
          builder: (CourseListController courseController) {
            List<CourseData> courses = courseController.courseList;

            return ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                var progress =
                    '${courses[index].jumlahDone}/${courses[index].jumlahMateri}';
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.white, spreadRadius: 2.5),
                      ],
                    ),
                    child: ListTile(
                      title: Text(courses[index].courseName ?? ''),
                      leading: Container(
                        height: 250,
                        width: 50,
                        child: SizedBox(
                          child: Container(
                            height: 200,
                            width: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  courses[index].urlCover!,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      subtitle: Text(
                        courses[index].courseCategory == 'latihan_soal'
                            ? '${progress} Paket Latihan Soal'
                            : '-',
                      ),
                      onTap: () {
                        Get.toNamed(
                          Routes.exerciseList,
                          arguments: ExerciseListPageArgs(
                            courseId: courses[index].courseId!,
                            courseName: courses[index].courseName ?? '',
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
