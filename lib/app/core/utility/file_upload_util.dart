import 'package:dio/dio.dart';

abstract interface class FileUploadUtil{
  late Future<MultipartFile> getMultipartFile;
}