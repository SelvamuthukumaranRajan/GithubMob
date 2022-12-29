import 'package:get/get.dart';
import 'package:githubmob/home/providers/github_provider.dart';

import '../models/github_model.dart';

class GithubController extends GetxController {
  var loading = false.obs;

  dynamic githubRepoResponse;
  var repoList = List<GithubRepoModel>.empty(growable: true).obs;
  final GithubRepoProvider githubRepoProvider = Get.find<GithubRepoProvider>();

  @override
  void onInit() {
    super.onInit();
    fetchRepos();
  }

  fetchRepos() async {
    loading(true);
    githubRepoResponse = await githubRepoProvider.fetchRepos();
    if (githubRepoResponse != null) {
      repoList.addAll(githubRepoResponse);
      loading(false);
      fetchCommitDetails();
    } else {
      fetchRepos();
    }
  }

  fetchCommitDetails() async {
    fetchCommitDetail();
  }

  fetchCommitDetail() async {
    for (var index = 0; index < repoList.length; index++) {
      var githubRepoResponse = await githubRepoProvider
          .fetchRepoDetails(repoList[index].fullName ?? "");
      if (githubRepoResponse != null) {
        repoList[index].message = githubRepoResponse[0].commit.message;
        repoList.refresh();
      } else {
        githubRepoResponse = await githubRepoProvider
            .fetchRepoDetails(repoList[index].fullName ?? "");
      }
    }
  }
}
