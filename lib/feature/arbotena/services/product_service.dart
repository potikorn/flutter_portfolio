import '../models/product.dart';

class ProductService {
  static final List<Product> _mockProducts = [
    Product(
      id: '1',
      title: 'Food can',
      description: 'Canned food product with various ingredients',
      incompatibilities: 4,
      hasWarning: true,
    ),
    Product(
      id: '2',
      title: 'Eureka Cheese Gourmet with Extra Long Name That Might Overflow',
      description: 'Premium cheese selection',
      incompatibilities: 7,
      hasWarning: true,
    ),
    Product(
      id: '3',
      title: 'Brewing.co',
      description: 'Craft beer and beverages',
      incompatibilities: 0,
      hasWarning: false,
    ),
    Product(
      id: '4',
      title: 'Cup Noodles',
      description: 'Instant noodle soup',
      incompatibilities: 2,
      hasWarning: true,
    ),
  ];

  // Get all products
  List<Product> getAllProducts() {
    return List.from(_mockProducts);
  }

  // Get recommended products (those with no warnings)
  List<Product> getRecommendedProducts() {
    return _mockProducts.where((product) => !product.hasWarning).toList();
  }

  // Get products to avoid (those with warnings)
  List<Product> getProductsToAvoid() {
    return _mockProducts.where((product) => product.hasWarning).toList();
  }

  // Search products by title
  List<Product> searchProducts(String query) {
    final lowercaseQuery = query.toLowerCase();
    return _mockProducts
        .where((product) =>
            product.title.toLowerCase().contains(lowercaseQuery) ||
            product.description.toLowerCase().contains(lowercaseQuery))
        .toList();
  }

  // Get product count
  int get productCount => _mockProducts.length;
}
