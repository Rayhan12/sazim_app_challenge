import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiUrls{
  static final baseUrl = dotenv.env['BASE_URL'];
}