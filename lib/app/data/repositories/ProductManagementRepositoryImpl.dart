import 'package:sazim_app/app/domain/entities/product_entity.dart';

import '../../domain/repositories/product_management_repository.dart';

class ProductManagementRepositoryImpl implements ProductManagementRepository{
  @override
  Future<void> createProduct(ProductEntity product) {
    // TODO: implement createProduct
    throw UnimplementedError();
  }

  @override
  Future<void> deleteProduct(String id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<List<ProductEntity>> getAllProducts() {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }

  @override
  Future<ProductEntity> getProductById(String id) {
    // TODO: implement getProductById
    throw UnimplementedError();
  }

  @override
  Future<void> updateProduct(ProductEntity product) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
}