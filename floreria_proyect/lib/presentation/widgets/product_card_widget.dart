import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String category;
  final double price;
  final double rating;
  final int reviews;
  final bool isFavorite;
  final VoidCallback onTap;
  final Function(bool) onFavoriteTap;
  final bool isAvailable;

  const ProductCardWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.category,
    required this.price,
    this.rating = 4.5,
    this.reviews = 0,
    this.isFavorite = false,
    required this.onTap,
    required this.onFavoriteTap,
    this.isAvailable = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del producto
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    color: Colors.grey.shade200,
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Icon(
                            Icons.local_florist,
                            size: 60,
                            color: Colors.grey.shade400,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // Badge de disponibilidad
                if (!isAvailable)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        color: Colors.black.withOpacity(0.5),
                      ),
                      child: const Center(
                        child: Text(
                          'Agotado',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                // Botón favorito
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () => onFavoriteTap(!isFavorite),
                    child: Container(
                      width: 36,
                      height: 36,
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
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite
                            ? Colors.red.shade600
                            : Colors.grey.shade600,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Información del producto
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Rating
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.amber.shade600,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '$rating',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '($reviews)',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    // Precio
                    Text(
                      '\$$price',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
