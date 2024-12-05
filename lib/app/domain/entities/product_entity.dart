class ProductEntity{
  int? id;
  int? seller;
  String? title;
  String? description;
  List<String>? categories;
  String? productImage;
  String? purchasePrice;
  String? rentPrice;
  String? rentOption;
  DateTime? datePosted;

  ProductEntity({
    this.id,
    this.seller,
    this.title,
    this.description,
    this.categories,
    this.productImage,
    this.purchasePrice,
    this.rentPrice,
    this.rentOption,
    this.datePosted,
});

  @override
  String toString() {
    return 'ProductEntity{id: $id, seller: $seller, title: $title, description: $description, categories: $categories, productImage: $productImage, purchasePrice: $purchasePrice, rentPrice: $rentPrice, rentOption: $rentOption, datePosted: $datePosted}';
  }
}