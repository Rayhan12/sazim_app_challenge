import 'dart:developer';

import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio_instance;
import 'package:image_picker/image_picker.dart';
import 'package:sazim_app/app/core/utility/file_upload_util.dart';
import 'package:sazim_app/app/domain/entities/product_entity.dart';

import '../../core/constant/end_points.dart';
import '../../core/networking/setup/base_client.dart';
import '../../domain/repositories/product_management_repository.dart';
import '../models/product_data_model.dart';

class ProductManagementRepositoryImpl implements ProductManagementRepository{
  @override
  Future<void> createProduct(ProductEntity product) async{


    try {
      Map<String,dynamic> data = ProductDataModel.fromEntity(productEntity: product).toJson();
      data['product_image'] = await FileBuilder().buildImageFileForUpload(selectedFile: XFile(product.productImage.toString()));

      await BaseClient.safeApiCall(
        ApiUrls.products,
        RequestType.post,
        data: dio_instance.FormData.fromMap(data),
        onSuccess: (response){
          if(response.statusCode != 201)
          {
            throw Exception(response.data['error']);
          }
          else
          {
            print(response.data);
          }
        },
      );
    } catch (error) {
      log(error.toString());
      throw Exception(error.toString());
    }
  }

  @override
  Future<void> deleteProduct(String id) async{
    try {
      await BaseClient.safeApiCall(
        "${ApiUrls.products}$id/",
        RequestType.delete,
        onSuccess: (response){
          if(response.statusCode != 204)
          {
            throw Exception(response.data['error']);
          }
          else
          {
            print("Product Deleted at $id");

          }
        },
      );
    } catch (error) {
      log(error.toString());
      throw Exception(error.toString());
    }
  }

  @override
  Future<List<ProductEntity>> getAllProducts() async{
    List<ProductEntity> allProducts = [];
    try {
      await BaseClient.safeApiCall(
        ApiUrls.products,
        RequestType.get,
        onSuccess: (response){
          if(response.statusCode != 200)
          {
            throw Exception(response.data['error']);
          }
          else
          {
            // allProducts = productDataModelFromJson(response.data).map((e) => e.toProductEntity(),).toList();

            /// Todo: Need to handle large computation here
            allProducts = List.from(response.data).map((e) => ProductDataModel.fromJson(e).toProductEntity(),).toList();
          }
        },
      );
    } catch (error) {
      log(error.toString());
      throw Exception(error.toString());
    }
    return allProducts;
  }

  @override
  Future<ProductEntity> getProductById(String id) async{
    ProductEntity productEntity = ProductEntity();
    try {
      await BaseClient.safeApiCall(
        "${ApiUrls.products}$id/",
        RequestType.get,
        onSuccess: (response){
          if(response.statusCode != 200)
          {
            throw Exception(response.data['error']);
          }
          else
          {
            productEntity = ProductDataModel.fromJson(response.data).toProductEntity();
          }
        },
      );
    } catch (error) {
      log(error.toString());
      throw Exception(error.toString());
    }
    return productEntity;
  }

  @override
  Future<ProductEntity> updateProduct(ProductEntity product) async{
    ProductEntity productEntity = ProductEntity();

    try {
      Map<String,dynamic> data = ProductDataModel.fromEntity(productEntity: product).toJson();
      data.remove("product_image");

      await BaseClient.safeApiCall(
        "${ApiUrls.products}${product.id}/",
        RequestType.patch,
        data: dio_instance.FormData.fromMap(data),
        onSuccess: (response){
          if(response.statusCode != 200)
          {
            throw Exception(response.data['error']);
          }
          else
          {
            productEntity = ProductDataModel.fromJson(response.data).toProductEntity();
          }
        },
      );
    } catch (error) {
      log(error.toString());
      throw Exception(error.toString());
    }
    return productEntity;
  }

}