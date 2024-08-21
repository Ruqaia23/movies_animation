class model {
  int? id;
  String? title;
  String? posterURL;
  String? imdbId;

  model({this.id, this.title, this.posterURL, this.imdbId});

  model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    posterURL = json['posterURL'];
    imdbId = json['imdbId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['posterURL'] = this.posterURL;
    data['imdbId'] = this.imdbId;
    return data;
  }
}
