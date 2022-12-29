import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../style/apptheme.dart';
import '../controllers/github_controller.dart';

class GithubView extends GetView<GithubController> {
  const GithubView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme().githubWhiteColor,
        body: SafeArea(
          child: Obx(
            () {
              if (controller.loading.value) {
                return Center(
                  child: customLoading(),
                );
              }

              return ListView.builder(
                  itemCount: controller.repoList.length,
                  itemBuilder: (context, index) {
                    return repositoryDetailsWidget(context, index);
                  });
            },
          ),
        ));
  }

  Widget repositoryDetailsWidget(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppTheme().backgroundLightColor,
            border: Border.all(
              color: AppTheme().borderColor,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.book_outlined,
                size: 18,
                color: AppTheme().borderColor,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        controller.repoList[index].name.toString(),
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: null,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: controller.repoList[index].message == null
                          ? SizedBox(
                              height: 14,
                              width: MediaQuery.of(context).size.width / 2,
                              child: Shimmer(
                                color: Colors.grey,
                                child: const Text(""),
                              ),
                            )
                          : Text(
                              controller.repoList[index].message ?? "",
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Raleway',
                              ),
                              maxLines: null,
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customLoading() {
    return LoadingAnimationWidget.inkDrop(
      color: AppTheme().primaryColor,
      size: 35,
    );
  }
}
