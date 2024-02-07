import 'package:fulltime_force/src/models/author.model.dart';
import 'package:fulltime_force/src/models/commit.model.dart';
import 'package:fulltime_force/src/models/parenths.model.dart';

class Commits {
  String? url;
  String? sha;
  String? nodeId;
  String? htmlUrl;
  String? commentsUrl;
  Commit? commit;
  Author? author;
  Author? committer;
  List<Parents>? parents;

  Commits(
      {this.url,
      this.sha,
      this.nodeId,
      this.htmlUrl,
      this.commentsUrl,
      this.commit,
      this.author,
      this.committer,
      this.parents});

  Commits.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    sha = json['sha'];
    nodeId = json['node_id'];
    htmlUrl = json['html_url'];
    commentsUrl = json['comments_url'];
    commit = json['commit'] != null ? Commit.fromJson(json['commit']) : null;
    author = json['author'] != null ? Author.fromJson(json['author']) : null;
    committer =
        json['committer'] != null ? Author.fromJson(json['committer']) : null;
    if (json['parents'] != null) {
      parents = <Parents>[];
      json['parents'].forEach((v) {
        parents!.add(Parents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['sha'] = sha;
    data['node_id'] = nodeId;
    data['html_url'] = htmlUrl;
    data['comments_url'] = commentsUrl;
    if (commit != null) {
      data['commit'] = commit!.toJson();
    }
    if (author != null) {
      data['author'] = author!.toJson();
    }
    if (committer != null) {
      data['committer'] = committer!.toJson();
    }
    if (parents != null) {
      data['parents'] = parents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
