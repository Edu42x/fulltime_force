import 'package:fulltime_force/src/models/verification.model.dart';

class Commit {
  String? url;
  AuthorCommit? author;
  AuthorCommit? committer;
  String? message;
  TreeCommit? tree;
  int? commentCount;
  Verification? verification;

  Commit(
      {this.url,
      this.author,
      this.committer,
      this.message,
      this.tree,
      this.commentCount,
      this.verification});

  Commit.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    author =
        json['author'] != null ? AuthorCommit.fromJson(json['author']) : null;
    committer = json['committer'] != null
        ? AuthorCommit.fromJson(json['committer'])
        : null;
    message = json['message'];
    tree = json['tree'] != null ? TreeCommit.fromJson(json['tree']) : null;
    commentCount = json['comment_count'];
    verification = json['verification'] != null
        ? Verification.fromJson(json['verification'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    if (author != null) {
      data['author'] = author!.toJson();
    }
    if (committer != null) {
      data['committer'] = committer!.toJson();
    }
    data['message'] = message;
    if (tree != null) {
      data['tree'] = tree!.toJson();
    }
    data['comment_count'] = commentCount;
    if (verification != null) {
      data['verification'] = verification!.toJson();
    }
    return data;
  }
}

class AuthorCommit {
  String? name;
  String? email;
  String? date;

  AuthorCommit({this.name, this.email, this.date});

  AuthorCommit.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['date'] = date;
    return data;
  }
}

class TreeCommit {
  String? url;
  String? sha;

  TreeCommit({this.url, this.sha});

  TreeCommit.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    sha = json['sha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['sha'] = sha;
    return data;
  }
}
