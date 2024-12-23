
abstract class ApiUrls{
  static final baseUrl = "http://192.168.229.222:8000/api";

  static final login = "$baseUrl/users/login/";
  static final register = "$baseUrl/users/register/";

  static final getCategory = "$baseUrl/products/categories/";

  /// applicable for get, post,put,update,delete & get product by id
  /// for get product by id use => query parameter
  static final products = "$baseUrl/products/";

  static final purchase = "$baseUrl/transactions/purchases/";
  static final rentals = "$baseUrl/transactions/rentals/";
}