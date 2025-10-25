import 'package:flutter/material.dart';

class HomeScreean extends StatefulWidget {
  const HomeScreean({Key? key}) : super(key: key);

  @override
  State<HomeScreean> createState() => _HomeScreeanState();
}

class _HomeScreeanState extends State<HomeScreean> {
  // Mock data de banners
  final List<Map<String, String>> banners = [
    {
      'title': 'Descuento de Primavera',
      'subtitle': 'Hasta 40% en arreglos especiales',
      'image':
          'https://images.unsplash.com/photo-1561181286-d3fee7d55364?w=500',
    },
    {
      'title': 'Flores Frescas Diarias',
      'subtitle': 'Entrega rápida en tu puerta',
      'image':
          'https://images.unsplash.com/photo-1578927344355-85d0c8e59155?w=500',
    },
    {
      'title': 'Ramos Especiales',
      'subtitle': 'Para cada ocasión importante',
      'image':
          'https://images.unsplash.com/photo-1518895949257-7621c3c786d7?w=500',
    },
  ];

  // Mock data de productos más vendidos
  final List<Map<String, dynamic>> bestsellers = [
    {
      'name': 'Rosa Roja Romántica',
      'price': 35.99,
      'originalPrice': 59.99,
      'discount': '-40%',
      'image':
          'https://images.unsplash.com/photo-1518895949257-7621c3c786d7?w=300',
      'isNew': false,
    },
    {
      'name': 'Girasol Amarillo',
      'price': 28.50,
      'originalPrice': 45.00,
      'discount': '-35%',
      'image':
          'https://images.unsplash.com/photo-1597848212624-11f93357d7f7?w=300',
      'isNew': false,
    },
    {
      'name': 'Ramo de Novia',
      'price': 120.00,
      'originalPrice': 180.00,
      'discount': '-33%',
      'image':
          'https://images.unsplash.com/photo-1578927344355-85d0c8e59155?w=300',
      'isNew': false,
    },
    {
      'name': 'Lirio Blanco',
      'price': 45.00,
      'originalPrice': 75.00,
      'discount': '-40%',
      'image':
          'https://images.unsplash.com/photo-1563241527-3004b08fb7f1?w=300',
      'isNew': false,
    },
  ];

  // Mock data de productos nuevos
  final List<Map<String, dynamic>> newProducts = [
    {
      'name': 'Orquídea Premium',
      'price': 55.00,
      'originalPrice': 85.00,
      'discount': '-35%',
      'image':
          'https://images.unsplash.com/photo-1608571423902-eed4a5ad8108?w=300',
      'isNew': true,
    },
    {
      'name': 'Tulipán Rojo',
      'price': 32.00,
      'originalPrice': 50.00,
      'discount': '-36%',
      'image':
          'https://images.unsplash.com/photo-1613397437410-c85f8e2a4a6f?w=300',
      'isNew': true,
    },
    {
      'name': 'Arreglo Multicolor',
      'price': 60.00,
      'originalPrice': 95.00,
      'discount': '-37%',
      'image':
          'https://images.unsplash.com/photo-1561181286-d3fee7d55364?w=300',
      'isNew': true,
    },
    {
      'name': 'Clavel Rosa Pastel',
      'price': 22.50,
      'originalPrice': 35.00,
      'discount': '-36%',
      'image':
          'https://images.unsplash.com/photo-1599599810694-b5ac4dd26eec?w=300',
      'isNew': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header con saludo
              _buildHeaderGreeting(),
              const SizedBox(height: 20),

              // Banners carousel
              SizedBox(
                height: 200,
                child: PageView.builder(
                  itemCount: banners.length,
                  itemBuilder: (context, index) {
                    return _buildBanner(banners[index]);
                  },
                ),
              ),
              const SizedBox(height: 24),

              // Sección de más vendidos
              _buildSection('Más Vendidos 🔥', 'Ver todos'),
              const SizedBox(height: 12),
              _buildProductsList(bestsellers),
              const SizedBox(height: 24),

              // Sección de ofertas especiales
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ofertas Especiales 🎁',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.orange.shade400,
                            Colors.pink.shade400,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.orange.shade400.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Cupón Especial',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                const Text(
                                  'PRIMAVERA2024',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  '20% descuento en tu próxima compra',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Copiar',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange.shade600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Sección de nuevos productos
              _buildSection('Nuevos Arrivals ✨', 'Ver más'),
              const SizedBox(height: 12),
              _buildProductsList(newProducts),
              const SizedBox(height: 24),

              // Sección de llamada a la acción
              _buildCallToAction(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBanner(Map<String, String> banner) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: NetworkImage(banner['image']!),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.black.withOpacity(0.4), Colors.transparent],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  banner['title']!,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  banner['subtitle']!,
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String actionText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(actionText)));
            },
            child: Text(
              actionText,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.blue.shade600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductsList(List<Map<String, dynamic>> products) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Padding(
            padding: EdgeInsets.only(
              right: index == products.length - 1 ? 0 : 12,
            ),
            child: GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Ver ${product['name']}')),
                );
              },
              child: Container(
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
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
                    // Imagen
                    Stack(
                      children: [
                        Container(
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(14),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(product['image']),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.grey.shade200,
                          ),
                        ),
                        Positioned(
                          top: 8,
                          left: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red.shade600,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              product['discount'],
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        if (product['isNew'] ?? false)
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.shade600,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'NUEVO',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    // Información
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product['name'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Text(
                                  '\$${product['price']}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade600,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  '\$${product['originalPrice']}',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey.shade500,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeaderGreeting() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bienvenido a Florería 🌸',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Descubre las flores más hermosas del día',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  Widget _buildCallToAction() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.blue.shade600, width: 2),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Suscríbete a Nuestro Newsletter',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Recibe ofertas exclusivas en tu correo',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward, color: Colors.blue.shade600),
          ],
        ),
      ),
    );
  }
}
