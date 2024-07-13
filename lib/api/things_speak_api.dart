import 'dart:convert';
import 'package:http/http.dart' as http;

class ThingSpeakService {
  final String apiKey = 'NX22JQP5AJ8QNKPQ'; // Provide your API key here
  final String channelId = '2598513'; // Provide your channel ID here

  Future<int> getVacantSpaces() async {
    final url =
        'https://api.thingspeak.com/channels/$channelId/feeds.json?api_key=$apiKey&results=1';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      var feeds = data['feeds'];
      var latestFeed = feeds[0];
      return int.parse(latestFeed[
          'field1']); // Assuming field1 contains the number of vacant spaces
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Future<List<int>> getField1Data() async {
  //   final url =
  //       'https://api.thingspeak.com/channels/$channelId/fields/1.json?api_key=$apiKey&results=100';
  //   final response = await http.get(Uri.parse(url));

  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body);
  //     var feeds = data['feeds'];
  //     List<int> field1Data =
  //         feeds.map<int>((feed) => int.parse(feed['field1'])).toList();
  //     return field1Data;
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }
}
