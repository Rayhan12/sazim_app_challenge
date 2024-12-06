import 'package:dio/dio.dart' as dio_instance;
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';


enum FileTypeEnum {
  image,
  pdf,
  doc,
}

class FileBuilder{

  Future<dio_instance.MultipartFile> buildImageFileForUpload({required XFile selectedFile}) async {

    dio_instance.MultipartFile uFile =  await dio_instance.MultipartFile.fromFile(selectedFile.path,
        filename: selectedFile.name,
        contentType: MediaType(
          FileTypeEnum.image.name,
          selectedFile.path.toString().split(".").last.toString(),
        ));
    return uFile;
  }

}