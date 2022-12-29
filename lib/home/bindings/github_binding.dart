import 'package:get/get.dart';
import 'package:githubmob/home/providers/github_provider.dart';

import '../controllers/github_controller.dart';

class GithubBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GithubController>(
      () => GithubController(),
    );
    Get.lazyPut<GithubRepoProvider>(
          () => GithubRepoProvider(),
    );
  }
}
