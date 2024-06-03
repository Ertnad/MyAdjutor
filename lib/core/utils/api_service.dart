import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {

  Future<String> getMotivationalQuote() async {
    final response = await http.get(Uri.parse('http://api.forismatic.com/api/1.0/?method=getQuote&format=json&lang=ru'));

    if (response.statusCode == 200) {
      final json = jsonDecode(utf8.decode(response.bodyBytes));
      if (json['quoteText'] != null && json['quoteAuthor'] != null) {
        return 'Цитата: "${json['quoteText']}"\nАвтор: ${json['quoteAuthor']}';
      }
    }

    return 'Не удалось получить цитату';
  }

}
