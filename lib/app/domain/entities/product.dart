import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required this.package,
    required this.expired,
    required this.packageName,
    required this.price,
    this.discount,
  });

  int package;
  int expired;
  String packageName;
  int price;
  int? discount;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        package: json["package"],
        expired: json["expired"],
        packageName: json["package_name"],
        price: json["price"],
        discount: json["discount"],
      );

  Map<String, dynamic> toJson() => {
        "package": package,
        "expired": expired,
        "package_name": packageName,
        "price": price,
        "discount": discount,
      };
}

List<Product> products = [
  Product(
    package: 10,
    expired: 30,
    packageName: "Internet OMG!",
    price: 96000,
    discount: 99000,
  ),
  Product(
    package: 14,
    expired: 30,
    packageName: "RuangGuru!",
    price: 99000,
    discount: 105000,
  ),
  Product(
    package: 20,
    expired: 30,
    packageName: "Internet OMG!",
    price: 120000,
    discount: 134000,
  ),
];
