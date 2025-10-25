import 'package:flutter/material.dart';

class BuysScreen extends StatefulWidget {
  const BuysScreen({super.key});

  @override
  State<BuysScreen> createState() => _BuysScreenState();
}

class _BuysScreenState extends State<BuysScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Mock data de órdenes
  final List<Map<String, dynamic>> allOrders = [
    {
      'id': '#ORD-001',
      'date': '22 Oct, 2024',
      'status': 'Entregado',
      'total': 85.50,
      'items': 3,
      'image':
          'https://images.unsplash.com/photo-1518895949257-7621c3c786d7?w=100',
      'products': [
        {'name': 'Rosa Roja Romántica', 'quantity': 2, 'price': 35.99},
        {'name': 'Girasol Amarillo', 'quantity': 1, 'price': 28.50},
      ],
    },
    {
      'id': '#ORD-002',
      'date': '20 Oct, 2024',
      'status': 'En camino',
      'total': 120.00,
      'items': 1,
      'image':
          'https://images.unsplash.com/photo-1578927344355-85d0c8e59155?w=100',
      'products': [
        {'name': 'Ramo de Novia', 'quantity': 1, 'price': 120.00},
      ],
    },
    {
      'id': '#ORD-003',
      'date': '18 Oct, 2024',
      'status': 'Procesando',
      'total': 145.50,
      'items': 4,
      'image':
          'https://images.unsplash.com/photo-1563241527-3004b08fb7f1?w=100',
      'products': [
        {'name': 'Lirio Blanco', 'quantity': 2, 'price': 45.00},
        {'name': 'Orquídea Premium', 'quantity': 2, 'price': 55.00},
      ],
    },
    {
      'id': '#ORD-004',
      'date': '15 Oct, 2024',
      'status': 'Entregado',
      'total': 60.00,
      'items': 1,
      'image':
          'https://images.unsplash.com/photo-1608571423902-eed4a5ad8108?w=100',
      'products': [
        {'name': 'Arreglo Multicolor', 'quantity': 1, 'price': 60.00},
      ],
    },
    {
      'id': '#ORD-005',
      'date': '10 Oct, 2024',
      'status': 'Cancelado',
      'total': 32.00,
      'items': 1,
      'image':
          'https://images.unsplash.com/photo-1613397437410-c85f8e2a4a6f?w=100',
      'products': [
        {'name': 'Tulipán Rojo', 'quantity': 1, 'price': 32.00},
      ],
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> _getFilteredOrders(String status) {
    if (status == 'Todos') return allOrders;
    return allOrders.where((order) => order['status'] == status).toList();
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Entregado':
        return Colors.green.shade600;
      case 'En camino':
        return Colors.blue.shade600;
      case 'Procesando':
        return Colors.orange.shade600;
      case 'Cancelado':
        return Colors.red.shade600;
      default:
        return Colors.grey.shade600;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'Entregado':
        return Icons.check_circle;
      case 'En camino':
        return Icons.local_shipping;
      case 'Procesando':
        return Icons.hourglass_bottom;
      case 'Cancelado':
        return Icons.cancel;
      default:
        return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Mis Compras',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        centerTitle: false,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.blue.shade600,
          unselectedLabelColor: Colors.grey.shade600,
          indicatorColor: Colors.blue.shade600,
          indicatorWeight: 3,
          tabs: const [
            Tab(text: 'Todos'),
            Tab(text: 'En camino'),
            Tab(text: 'Entregado'),
            Tab(text: 'Otros'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOrdersList(_getFilteredOrders('Todos')),
          _buildOrdersList(_getFilteredOrders('En camino')),
          _buildOrdersList(_getFilteredOrders('Entregado')),
          _buildOtherOrders(),
        ],
      ),
    );
  }

  Widget _buildOrdersList(List<Map<String, dynamic>> orders) {
    if (orders.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag_outlined,
              size: 80,
              color: Colors.grey.shade300,
            ),
            const SizedBox(height: 16),
            Text(
              'Sin órdenes',
              style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 8),
            Text(
              'No tienes órdenes en este estado',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return _buildOrderCard(orders[index]);
      },
    );
  }

  Widget _buildOtherOrders() {
    final processingOrders = allOrders
        .where((o) => o['status'] == 'Procesando')
        .toList();
    final cancelledOrders = allOrders
        .where((o) => o['status'] == 'Cancelado')
        .toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          if (processingOrders.isNotEmpty) ...[
            _buildStatusSection('Procesando', processingOrders),
            const SizedBox(height: 20),
          ],
          if (cancelledOrders.isNotEmpty) ...[
            _buildStatusSection('Cancelado', cancelledOrders),
          ],
          if (processingOrders.isEmpty && cancelledOrders.isEmpty)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    size: 80,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Sin órdenes',
                    style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildStatusSection(String title, List<Map<String, dynamic>> orders) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Column(
          children: orders.map((order) => _buildOrderCard(order)).toList(),
        ),
      ],
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order) {
    return GestureDetector(
      onTap: () => _showOrderDetails(context, order),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
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
          children: [
            // Header con ID y estado
            Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order['id'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        order['date'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusColor(order['status']).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          _getStatusIcon(order['status']),
                          size: 14,
                          color: _getStatusColor(order['status']),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          order['status'],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: _getStatusColor(order['status']),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            // Contenido
            Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  // Imagen
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(order['image']),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.grey.shade200,
                    ),
                  ),
                  const SizedBox(width: 14),
                  // Detalles
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${order['items']} artículo${order['items'] > 1 ? 's' : ''}',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          order['products'][0]['name'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '\$${order['total'].toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Icono flecha
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showOrderDetails(BuildContext context, Map<String, dynamic> order) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Detalles de Orden',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          order['id'],
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.close, color: Colors.grey.shade600),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Estado
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: _getStatusColor(order['status']).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: _getStatusColor(order['status']).withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _getStatusIcon(order['status']),
                        color: _getStatusColor(order['status']),
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Estado del Pedido',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          Text(
                            order['status'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: _getStatusColor(order['status']),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Productos
                Text(
                  'Productos (${order['items']})',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                Column(
                  children: List.generate((order['products'] as List).length, (
                    index,
                  ) {
                    final product = order['products'][index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['name'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Cantidad: ${product['quantity']}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '\$${product['price'].toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 14),
                const Divider(),
                const SizedBox(height: 14),

                // Total
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      '\$${order['total'].toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Botones
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Descargando factura de ${order['id']}',
                              ),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.blue.shade600),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text(
                          'Descargar',
                          style: TextStyle(color: Colors.blue.shade600),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Rastreando ${order['id']}'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade600,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text('Rastrear'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
