class cData {
  String clink;
  String ctitle;
  String cpubdate;
  String cdescription;
  String cthumbnail;

  cData(
      {required this.clink,
      required this.ctitle,
      required this.cpubdate,
      required this.cdescription,
      required this.cthumbnail});

  factory cData.fromJson(Map<String, dynamic> json) {
    return cData(
        clink: json['link'],
        ctitle: json['title'],
        cpubdate: json['pubDate'],
        cdescription: json['description'],
        cthumbnail: json['thumbnail']);
  }
}
