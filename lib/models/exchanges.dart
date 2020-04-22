import 'package:al_oficial_app/models/exchanger.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Exchanges {
  Stream<List> getData(Duration interval) async* {
    while (true) {
      final response = await http.get('https://api.aloficial.com/api/data');

      if (response.statusCode != 200) throw Exception('Failed to Connectd');

      yield this.fromJson(jsonDecode(response.body));

      await Future.delayed(interval);
    }
  }

  List fromJson(data) {
    List list = [];
    try {
      list = data.map((source) {
        return Exchanger(
            buy: double.parse(source['buy']), 
            sell: double.parse(source['sell']), 
            name: source['name'],
            pair: source['pair']);
      }).toList();
    } catch (e) {
      print(e);
    }
    return list;
  }
}
