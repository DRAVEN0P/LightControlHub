import 'dart:ui';
import 'package:http/http.dart' as http;

class Api {
  static Future sendRGB(Color color) async {
    final int r = color.red;
    final int g = color.green;
    final int b = color.blue;
    print("$r $g $b");

    final url = 'http://192.168.0.102/rgb?r=$r&g=$g&b=$b';

    try{
      final response = await http.get(Uri.parse(url));
      print(response.statusCode);
    }catch(e){
      print(e);
    }
  }
}
