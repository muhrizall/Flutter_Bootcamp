import 'package:final_project_ebook/core/values/images.dart';
import 'package:final_project_ebook/presentation/dashboard/home/home_banners_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import 'home_controller.dart';
import 'home_courses_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.shortestSide < 600;
    return Container(
      color: Color(0xFFE5E5E5),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 80,
              color: Color(0xFFE5E5E5),
              padding: EdgeInsets.symmetric(horizontal: 21),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _namaUser(),
                      Text('Selamat datang!'),
                    ],
                  ),
                  Image.asset(ImagesAssets.imageIllustrationSelfie)
                  // Icon(Icons.ad_units),
                ],
              ),
            ),
            Center(
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: Image.asset(
                          ImagesAssets.imageIllustrationBannerSingle),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 70, vertical: 35),
                    child: SizedBox(
                      child: Container(
                        child:
                            Image.asset(ImagesAssets.imageIllustrationTulisan),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(49),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 130),
                      child: SizedBox(
                        child: Container(
                          child: Image.asset(ImagesAssets.imageCharacter),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              // child: Stack(alignment: AlignmentDirectional.center, children: [
              //   Container(
              //     child: Image.asset(ImagesAssets.imageIllustrationBannerSingle),
              //   ),
              //   Container(
              //     width: 100,
              //     color: Colors.red,
              //     child: Image.asset(ImagesAssets.imageIllustrationTulisan),
              //   ),
              //   Container(
              //     child: Image.asset(ImagesAssets.imageCharacter),
              //     width: 200,
              //     height: 100,
              //   )
              // ]),
            ),
            const HomeCoursesWidget(),
            const SizedBox(
              height: 20,
            ),
            const HomeBannersWidget(),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
            //       Container(
            //         margin: EdgeInsets.all(10),
            //         height: 180,
            //         width: 200,
            //         color: Colors.red,
            //         child: Text('Event Banners'),
            //       ),
            //       Container(
            //         margin: EdgeInsets.all(10),
            //         height: 180,
            //         width: 200,
            //         color: Colors.green,
            //         child: Text('Event Banners'),
            //       ),
            //       Container(
            //         margin: EdgeInsets.all(10),
            //         height: 180,
            //         width: 200,
            //         color: Colors.blue,
            //         child: Text('Event Banners'),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _mobileWidget() {
    return Container();
  }

  Widget _tabletWidget() {
    return Container();
  }

  Widget _landscapeWidget() {
    return Container();
  }

  Widget _namaUser() {
    return GetBuilder<HomeController>(
      builder: (HomeController controller) {
        final nama = controller.userData?.userName;
        return Text(
          nama != null ? 'Hai $nama' : ' Hai -',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        );
      },
    );
  }
}
