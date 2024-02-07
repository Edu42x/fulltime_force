class Parents {
  String? url;
  String? sha;

  Parents({this.url, this.sha});

  Parents.fromJson(Map<String, dynamic> json) {
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
