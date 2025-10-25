import 'package:flutter/material.dart';
import 'package:floreria_proyect/presentation/widgets/category_filter_widget.dart';
import 'package:floreria_proyect/presentation/widgets/product_card_widget.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  String _selectedCategory = 'Todos';
  String _searchQuery = '';
  List<String> _favorites = [];

  // Mock data de productos
  final List<Map<String, dynamic>> _allProducts = [
    {
      'id': '1',
      'name': 'Rosa Roja Romántica',
      'category': 'Rosas',
      'price': 45.99,
      'image':
          'https://images.unsplash.com/photo-1518895949257-7621c3c786d7?w=400',
      'rating': 4.8,
      'reviews': 128,
      'isAvailable': true,
    },
    {
      'id': '2',
      'name': 'Girasol Amarillo',
      'category': 'Girasoles',
      'price': 35.50,
      'image':
          'https://images.unsplash.com/photo-1597848212624-11f93357d7f7?w=400',
      'rating': 4.5,
      'reviews': 92,
      'isAvailable': true,
    },
    {
      'id': '3',
      'name': 'Lirio Blanco Elegante',
      'category': 'Lirios',
      'price': 55.00,
      'image':
          'https://images.unsplash.com/photo-1563241527-3004b08fb7f1?w=400',
      'rating': 4.9,
      'reviews': 156,
      'isAvailable': true,
    },
    {
      'id': '4',
      'name': 'Arreglo Multicolor',
      'category': 'Arreglos',
      'price': 75.99,
      'image':
          'https://images.unsplash.com/photo-1561181286-d3fee7d55364?w=400',
      'rating': 4.7,
      'reviews': 203,
      'isAvailable': true,
    },
    {
      'id': '5',
      'name': 'Tulipán Rojo Intenso',
      'category': 'Tulipanes',
      'price': 40.00,
      'image':
          'https://images.unsplash.com/photo-1613397437410-c85f8e2a4a6f?w=400',
      'rating': 4.6,
      'reviews': 87,
      'isAvailable': false,
    },
    {
      'id': '6',
      'name': 'Orquídea Tropical',
      'category': 'Orquídeas',
      'price': 65.00,
      'image':
          'https://images.unsplash.com/photo-1608571423902-eed4a5ad8108?w=400',
      'rating': 4.8,
      'reviews': 145,
      'isAvailable': true,
    },
    {
      'id': '7',
      'name': 'Ramo de Novia',
      'category': 'Arreglos',
      'price': 150.00,
      'image':
          'https://images.unsplash.com/photo-1578927344355-85d0c8e59155?w=400',
      'rating': 5.0,
      'reviews': 234,
      'isAvailable': true,
    },
    {
      'id': '8',
      'name': 'Clavel Rosa Pastel',
      'category': 'Claveles',
      'price': 28.50,
      'image':
          'https://images.unsplash.com/photo-1599599810694-b5ac4dd26eec?w=400',
      'rating': 4.4,
      'reviews': 56,
      'isAvailable': true,
    },
  ];

  late List<Map<String, dynamic>> _filteredProducts;

  @override
  void initState() {
    super.initState();
    _filteredProducts = _allProducts;
  }

  void _filterProducts() {
    setState(() {
      _filteredProducts = _allProducts.where((product) {
        final matchesCategory =
            _selectedCategory == 'Todos' ||
            product['category'] == _selectedCategory;
        final matchesSearch = product['name'].toLowerCase().contains(
          _searchQuery.toLowerCase(),
        );
        return matchesCategory && matchesSearch;
      }).toList();
    });
  }

  void _toggleFavorite(String productId) {
    setState(() {
      if (_favorites.contains(productId)) {
        _favorites.remove(productId);
      } else {
        _favorites.add(productId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),
            const SizedBox(height: 18),

            // Barra de búsqueda
            _buildSearchBar(),
            const SizedBox(height: 18),

            // Filtro de categorías
            CategoryFilterWidget(
              categories: [
                'Todos',
                'Rosas',
                'Girasoles',
                'Lirios',
                'Orquídeas',
                'Tulipanes',
                'Claveles',
                'Arreglos',
              ],
              selectedCategory: _selectedCategory,
              onCategorySelected: (category) {
                setState(() {
                  _selectedCategory = category;
                  _filterProducts();
                });
              },
            ),
            const SizedBox(height: 18),

            // Grid de productos
            Expanded(
              child: _filteredProducts.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.local_florist,
                            size: 64,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No hay productos disponibles',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 16,
                            childAspectRatio: 0.75,
                          ),
                      itemCount: _filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = _filteredProducts[index];
                        final isFavorite = _favorites.contains(product['id']);

                        return ProductCardWidget(
                          imageUrl: product['image'],
                          name: product['name'],
                          category: product['category'],
                          price: product['price'],
                          rating: product['rating'],
                          reviews: product['reviews'],
                          isFavorite: isFavorite,
                          isAvailable: product['isAvailable'],
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Ver detalles de ${product['name']}',
                                ),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          },
                          onFavoriteTap: (value) {
                            _toggleFavorite(product['id']);
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nuestro Catálogo',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Descubre nuestras mejores flores',
            style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
            _filterProducts();
          });
        },
        decoration: InputDecoration(
          hintText: 'Buscar flores...',
          prefixIcon: Icon(Icons.search, color: Colors.grey.shade500),
          suffixIcon: _searchQuery.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _searchQuery = '';
                      _filterProducts();
                    });
                  },
                  child: Icon(Icons.close, color: Colors.grey.shade500),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.blue.shade600, width: 2),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 14,
          ),
        ),
      ),
    );
  }
}
