import 'package:http/http.dart';

abstract class ITwitRepository {
  Future<Response> getTwits();
}