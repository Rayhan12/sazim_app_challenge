import 'package:sazim_app/app/domain/entities/product_entity.dart';

const double borderSideWidth = 1.5;
const List<String> rentTypeChoice = ['hour','day'];

final ProductEntity blankEntity = ProductEntity(
  id: -100,
  title: "Some Title",
  rentOption: "Option",
  rentPrice: "213",
  description: "Some text",
  productImage: "",
  categoriesValues: ["one","two"],
  categories: ["one","two"],
  datePosted: DateTime.now(),
  purchasePrice: "444",
  seller: -12
);