class GithubRepoDetailModel {
  Commit? commit;

  GithubRepoDetailModel({this.commit});

  GithubRepoDetailModel.fromJson(Map<String, dynamic> json) {
    commit = (json['commit'] != null ? Commit.fromJson(json['commit']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    final commit = this.commit;
    if (commit != null) {
      data['commit'] = commit.toJson();
    }
    return data;
  }
}

class Commit {
  String? message;

  Commit({required this.message});

  Commit.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    return data;
  }
}
