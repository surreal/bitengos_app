import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:itcm_site/models/product_model.dart';

class _DBData {
  static const String _apiEndpoint = 'https://us-central1-thebasics-2f123.cloudfunctions.net/thebasics';

  Future<dynamic> getProducts() async {
    var response = await http.get(Uri.parse('$_apiEndpoint/courseEpisodes'));

    if (response.statusCode == 200) {
      var episodes = (json.decode(response.body) as List).map((episode) => ProductModel.fromJson(episode)).toList();
      return episodes;
    }

    // something wrong happened
    return 'Could not fetch the episodes at this time';
  }

  Future<dynamic> getProduct(int id) async {
    var response = await http.get(Uri.parse('$_apiEndpoint/episode?id=$id'));

    print('getEpisode | response: ${response.body} statusCode: ${response.statusCode}');

    if (response.statusCode == 200) {
      var episode = ProductModel.fromJson(json.decode(response.body));
      return episode;
    }

    // something wrong happened
    return 'Could not fetch episode $id. Make sure it exists';
  }
}
