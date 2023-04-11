import 'package:final_project_ebook/core/values/colors.dart';
import 'package:final_project_ebook/core/values/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/course_response.dart';
import '../../../routes/routes.dart';
import '../../exercise/list/exercise_list_page.dart';
import 'home_controller.dart';

class HomeCoursesWidget extends StatefulWidget {
  const HomeCoursesWidget({Key? key}) : super(key: key);

  @override
  State<HomeCoursesWidget> createState() => _HomeCoursesWidgetState();
}

class _HomeCoursesWidgetState extends State<HomeCoursesWidget> {
  @override
  void initState() {
    Get.find<HomeController>().getCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        List<CourseData> courses = controller.courseList;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Pilih Pelajaran',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: AppColors.black),
                  ),
                  if (courses.length > controller.maxHomeCourseCount)
                    TextButton(
                      child: const Text('Lihat Semua'),
                      onPressed: () {
                        Get.toNamed(Routes.courseList);
                      },
                    ),
                ],
              ),
            ),
            const LinearProgressIndicator(
              value: 0.8,
              minHeight: 5,
              backgroundColor: Colors.black,
            ),
            if (controller.isGetCoursesLoading == true)
              const Center(child: CircularProgressIndicator())
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
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
              ),
          ],
        );
      },
    );
  }
}
