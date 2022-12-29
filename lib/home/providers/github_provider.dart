import 'dart:convert';

import 'package:get/get.dart';

import '../../data/providers/base_api_provider.dart';
import '../models/github_model.dart';
import '../models/githubrepo_model.dart';

class GithubRepoProvider extends BaseApiProvider {
  static String getUserRepos() {
    return "users/freeCodeCamp/repos";
  }

  static String getRepoDetails(String repoName) {
    return "repos/$repoName/commits";
  }

  Future fetchRepos() async {
    var response = await apiRequest(getUserRepos(), Method.get, null);
    var repoList = json.decode(response.bodyString ?? "") as List;
    List<GithubRepoModel> githubRepoModelList =
        repoList.map((repo) => GithubRepoModel.fromJson(repo)).toList();
    return githubRepoModelList;
  }

  Future fetchRepoDetails(String repoName) async {
    var response = await apiRequest(getRepoDetails(repoName), Method.get, null);
    var repoList = json.decode(response.bodyString ?? "") as List;
    List<GithubRepoDetailModel> githubRepoModelList =
        repoList.map((repo) => GithubRepoDetailModel.fromJson(repo)).toList();
    return githubRepoModelList;
  }

  Future<List<RxString>> fetchAllRepoDetails(
      List<GithubRepoModel> repoList) async {
    var repoDetailList = <RxString>[];
    for (var repoDetail in repoList) {
      var githubRepoResponse =
          await fetchRepoDetails(repoDetail.fullName ?? "");
      if (githubRepoResponse != null) {
        repoDetailList.add("${githubRepoResponse[0].commit.message}".obs);
      } else {
        githubRepoResponse = await fetchRepoDetails(repoDetail.fullName ?? "");
      }
    }
    return repoDetailList;
  }
}
