import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiUrls{
  static final baseUrl = "http://192.168.1.4:8000/api";//dotenv.get('BASE_URL');
  static final login = "$baseUrl/users/login/";
  static final register = "$baseUrl/users/register/";
}