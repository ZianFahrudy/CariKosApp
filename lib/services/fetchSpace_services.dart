part of 'services.dart';

class FetchServices extends ChangeNotifier {
  static Future<List<Space>> getSpaces() async {
    var url = "https://bwa-cozy.herokuapp.com/recommended-spaces";

    var response = await http.get(url);

    if (response.statusCode == 200) {
      List data = json.decode(response.body);

      return data.map((e) => Space.fromJson(e)).toList();
    } else {
      return <Space>[];
    }
  }
}
