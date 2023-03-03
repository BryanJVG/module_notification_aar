
import 'package:http/http.dart';
import 'package:module_notification/networking/twitter_api.dart';
import 'package:module_notification/repositories/twit_interface.dart';

class TwitRepository implements ITwitRepository{
  final TwitterApi api;
  TwitRepository(this.api);

  @override
  Future<Response> getTwits() async{
    return await api.retrieveTwits();
  }

}