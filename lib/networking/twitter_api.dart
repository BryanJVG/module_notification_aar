import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class TwitterApi {
  Future<Response> retrieveTwits() async {
    //final host = dotenv.get('HOST_IP', fallback: 'HOST_IP');
    const host = "192.168.0.11:8000";
    //final pathModule = dotenv.get('PATH_MODULE', fallback: 'PATH_MODULE');
    const pathModule = "/twitter_api/home/v1/tweets/";
    /*
    final params = {
      dotenv.get('USER_PARAM', fallback: "user"): dotenv.get('USER', fallback: "user"),
      dotenv.get('PLATFORM_PARAM', fallback: "platform"): dotenv.get('PLATFORM', fallback: "platform"),
    };
    */
    final params = {
      "user": "bryan.valenzuela",
      "platform": "ANDROID",
    };




    final uri = Uri.http(host, pathModule, params);

    final response = await http.get(uri);
    return response;
  }
}
