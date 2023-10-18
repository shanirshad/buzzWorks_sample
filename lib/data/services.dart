import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/album_details.dart';
class Services {


  Future<List<AlbumDetails>> fetchData() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result.map((e) => AlbumDetails.fromJson(e)).toList();
    } else {
      throw ('some Error in loading');
      // trhow("erro in loading");
    }
  }

}