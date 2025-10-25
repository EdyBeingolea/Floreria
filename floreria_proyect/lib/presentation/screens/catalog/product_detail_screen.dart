import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productId;
  final String productName;
  final String productImage;
  final String category;
  final double price;
  final double rating;
  final int reviews;
  final String description;
  final int stock;

  const ProductDetailScreen({
    super.key,
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.category,
    required this.price,
    this.rating = 4.5,
    this.reviews = 0,
    this.description =
        'Hermosa flor fresca de alta calidad, perfecta para sorprender a alguien especial.',
    this.stock = 10,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4),
              ],
            ),
            child: const Icon(Icons.arrow_back, color: Colors.grey, size: 20),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Icon(
                _isFavorite ? Icons.favorite : Icons.favorite_border,
                color: _isFavorite ? Colors.red.shade600 : Colors.grey,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del producto
            Container(
              width: double.infinity,
              height: 350,
              color: Colors.grey.shade200,
              child: Image.network(
                widget.productImage,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Icon(
                      Icons.local_florist,
                      size: 80,
                      color: Colors.grey.shade400,
                    ),
                  );
                },
              ),
            ),
            // Información del producto
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Categoría
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      widget.category,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Nombre
                  Text(
                    widget.productName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Rating
                  Row(
                    children: [
                      Icon(Icons.star, size: 18, color: Colors.amber.shade600),
                      const SizedBox(width: 6),
                      Text(
                        '${widget.rating}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '(${widget.reviews} reseñas)',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Precio
                  Text(
                    '\$${widget.price}',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade600,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Descripción
                  Text(
                    'Descripción',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Stock
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.green.shade200),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.green.shade600,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'En stock: ${widget.stock} unidades disponibles',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.green.shade700,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Selector de cantidad
                  Text(
                    'Cantidad',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: _quantity > 1
                              ? () {
                                  setState(() {
                                    _quantity--;
                                  });
                                }
                              : null,
                          child: Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(color: Colors.grey.shade300),
                              ),
                            ),
                            child: Icon(
                              Icons.remove,
                              color: _quantity > 1
                                  ? Colors.grey.shade700
                                  : Colors.grey.shade300,
                            ),
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 44,
                          alignment: Alignment.center,
                          child: Text(
                            '$_quantity',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: _quantity < widget.stock
                              ? () {
                                  setState(() {
                                    _quantity++;
                                  });
                                }
                              : null,
                          child: Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(color: Colors.grey.shade300),
                              ),
                            ),
                            child: Icon(
                              Icons.add,
                              color: _quantity < widget.stock
                                  ? Colors.grey.shade700
                                  : Colors.grey.shade300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Botones de acción
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Agregado al carrito: $_quantity × ${widget.productName}',
                                ),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade600,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Agregar al Carrito',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue.shade600),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _isFavorite = !_isFavorite;
                            });
                          },
                          icon: Icon(
                            _isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: _isFavorite
                                ? Colors.red.shade600
                                : Colors.blue.shade600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
