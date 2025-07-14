class QuotesModel {
  String? quote;
  String? author;
  String? category;

  QuotesModel({this.quote, this.author, this.category});

  QuotesModel.fromJson(Map<String, dynamic> json) {
    quote = json['quote'];
    author = json['author'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quote'] = this.quote;
    data['author'] = this.author;
    data['category'] = this.category;
    return data;
  }
}
