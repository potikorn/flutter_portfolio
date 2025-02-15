import 'dart:math';
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/product_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  final ProductService _productService = ProductService();
  final List<Color> _placeholderColors = [
    const Color(0xFFFFC107), // Amber
    const Color(0xFF4CAF50), // Green
    const Color(0xFF2196F3), // Blue
    const Color(0xFFE91E63), // Pink
  ];
  final Random _random = Random();
  
  List<Product> _displayedProducts = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _displayedProducts = _productService.getAllProducts();
    
    _tabController.addListener(_handleTabChange);
    _searchController.addListener(_handleSearch);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _searchController.removeListener(_handleSearch);
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    if (!_tabController.indexIsChanging) {
      setState(() {
        _updateDisplayedProducts();
      });
    }
  }

  void _handleSearch() {
    setState(() {
      _searchQuery = _searchController.text;
      _updateDisplayedProducts();
    });
  }

  void _updateDisplayedProducts() {
    if (_searchQuery.isNotEmpty) {
      _displayedProducts = _productService.searchProducts(_searchQuery);
      return;
    }

    switch (_tabController.index) {
      case 0:
        _displayedProducts = _productService.getAllProducts();
        break;
      case 1:
        _displayedProducts = _productService.getRecommendedProducts();
        break;
      case 2:
        _displayedProducts = _productService.getProductsToAvoid();
        break;
    }
  }

  Color _getRandomColor() {
    return _placeholderColors[_random.nextInt(_placeholderColors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Produkte',
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Suchen',
                  prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          ),
          // Tab Bar
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFFE0E0E0)),
              ),
            ),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: const Color(0xFFD4AF37),
              indicatorWeight: 3,
              tabs: const [
                Tab(text: 'Alle'),
                Tab(text: 'Empfohlen'),
                Tab(text: 'Vermeiden'),
              ],
            ),
          ),
          // Sort and Count
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Icon(Icons.sort, size: 20),
                const SizedBox(width: 8),
                const Text('A-Z'),
                const Spacer(),
                Text(
                  '${_displayedProducts.length} Produkt(e)',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // Product List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _displayedProducts.length,
              itemBuilder: (context, index) {
                final product = _displayedProducts[index];
                return _buildProductItem(
                  product.title,
                  product.subtitle,
                  const Color(0xFFD4AF37).withValues(alpha: 0.3),
                  product.hasWarning,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(String title, String subtitle, Color color, bool hasWarning) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Icon(
                Icons.fastfood,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Product Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    if (hasWarning)
                      const Icon(
                        Icons.warning,
                        color: Colors.red,
                        size: 16,
                      ),
                    if (hasWarning) const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
