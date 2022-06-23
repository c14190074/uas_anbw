import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dataclass.dart';

class Services {
  Future<List<cData>> getAllData() async {
    final response = await http.get(
      Uri.parse('https://api-berita-indonesia.vercel.app/cnbc/terbaru/'),
    );
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => cData.fromJson(data['posts'])).toList();
    } else {
      throw Exception('Failed to load Data');
    }
  }

  // Future<bool> postData(String pnama, String pavatar, String palamat,
  //     String pemail, String ppekerjaan, String pquote) async {
  //   final response = await http.post(
  //       Uri.parse('https://6283762138279cef71d77f41.mockapi.io/api/v1/data2'),
  //       body: {
  //         "nama": pnama,
  //         "avatar": pavatar,
  //         "alamat": palamat,
  //         "email": pemail,
  //         "pekerjaan": ppekerjaan,
  //         "quote": pquote,
  //       });

  //   if (response.statusCode == 201) {
  //     return true;
  //   } else {
  //     throw Exception('Failed to push data');
  //   }
  // }

  // Future<cData> getSingleData(String id) async {
  //   final response = await http.get(Uri.parse(
  //       'https://6283762138279cef71d77f41.mockapi.io/api/v1/data2/$id'));

  //   if (response.statusCode == 200) {
  //     cData jsonResponse = cData.fromJson(jsonDecode(response.body));
  //     return jsonResponse;
  //   } else {
  //     throw Exception('Failed to get data');
  //   }
  // }

  // Future<bool> deleteData(String id) async {
  //   final response = await http.delete(Uri.parse(
  //       'https://6283762138279cef71d77f41.mockapi.io/api/v1/data2/$id'));

  //   if (response.statusCode == 200) {
  //     return true;
  //   } else {
  //     throw Exception('Failed to delete');
  //   }
  // }
}
