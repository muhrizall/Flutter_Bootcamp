import 'package:final_project_ebook/data/model/banner_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeBannersWidget extends StatefulWidget {
  const HomeBannersWidget({Key? key}) : super(key: key);

  @override
  State<HomeBannersWidget> createState() => _HomeBannersWidgetState();
}

class _HomeBannersWidgetState extends State<HomeBannersWidget> {
  @override
  void initState() {
    Get.find<HomeController>().getBanners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        List<BannerData> banners = controller.bannerList;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const LinearProgressIndicator(
              value: 0.8,
              minHeight: 5,
              backgroundColor: Colors.black,
            ),
            if (controller.isGetBannersLoading == true || banners.isEmpty)
              const Center(child: CircularProgressIndicator())
            else
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 23,
                      ),
                      child: Text(
                        'Terbaru',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                    height: 284,
                    margin: EdgeInsets.only(top: 15),
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: banners.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 284,
                            height: 146,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  banners[index].eventImage!,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}
