import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = 'b15e1162efe32820a44f1bd0e1fccc0a';

  Future<ItemModel> fetchMovieList() async {
    print("entered");
    var url = Uri.https(
      'api.themoviedb.org',
      '3/movie/popular',
      {
        'q': '{http}',
        'api_key': _apiKey,
      },
    );
    final response = await client.get(url);
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
