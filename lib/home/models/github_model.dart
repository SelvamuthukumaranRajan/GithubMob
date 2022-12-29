class GithubRepoModel {
  int? id;
  String? name;
  String? fullName;
  bool? private;
  String? message;

  GithubRepoModel({
    this.id,
    this.name,
    this.fullName,
    this.private,
  });

  GithubRepoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fullName = json['full_name'];
    private = json['private'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['full_name'] = fullName;
    data['private'] = private;
    return data;
  }
}
