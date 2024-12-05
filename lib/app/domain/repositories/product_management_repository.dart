import 'package:sazim_app/app/domain/entities/product_entity.dart';

abstract class ProductManagementRepository{
  Future<List<ProductEntity>> getAllProducts();
  Future<ProductEntity> getProductById(String id);
  Future<void> createProduct(ProductEntity product);
  Future<void> updateProduct(ProductEntity product);
  Future<void> deleteProduct(String id);
}