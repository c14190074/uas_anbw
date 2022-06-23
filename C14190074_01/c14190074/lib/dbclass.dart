import 'package:flutter/cupertino.dart';

class berita {
  final String title;
  final String link;
  final String pubdate;
  final String description;
  final String thumbnail;

  berita(
      {required this.title,
      required this.link,
      required this.pubdate,
      required this.description,
      required this.thumbnail});
  Map<String, dynamic> toJson() {
    return {
      "link": link,
      "title": title,
      "pubdate": pubdate,
      "description": description,
      "thumbnail": thumbnail
    };
  }

  factory berita.fromJson(Map<String, dynamic> json) {
    return berita(
        title: json['title'],
        link: json['link'],
        description: json['description'],
        thumbnail: json['thumbnail'],
        pubdate: json['pubdate']);
  }
}

class user {
  final String username;
  final String password;

  user({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
    };
  }

  factory user.fromJson(Map<String, dynamic> json) {
    return user(username: json['username'], password: json['password']);
  }
}
