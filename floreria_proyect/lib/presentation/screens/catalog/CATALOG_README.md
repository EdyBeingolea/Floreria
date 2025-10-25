# Catálogo de Productos - Florería App

## 📋 Descripción General

Sistema completo de catálogo para una florería con búsqueda, filtrado por categorías, favoritos y visualización de detalles.

---

## 📁 Estructura de Archivos

```
lib/
├── domain/
│   └── entities/
│       └── product_entity.dart          # Modelo de datos del producto
├── presentation/
│   ├── screens/
│   │   └── catalog/
│   │       ├── catalog_screen.dart      # Pantalla principal del catálogo
│   │       └── product_detail_screen.dart # Pantalla de detalles
│   └── widgets/
│       ├── product_card_widget.dart     # Card individual del producto
│       └── category_filter_widget.dart  # Filtro de categorías
```

---

## 🎨 Componentes Principales

### 1. **CatalogScreen** (`catalog_screen.dart`)

Pantalla principal que muestra el catálogo de productos.

#### Características:

- 🔍 **Búsqueda de productos** - Búsqueda en tiempo real
- 🏷️ **Filtro por categorías** - Scroll horizontal de categorías
- ❤️ **Sistema de favoritos** - Marcar/desmarcar productos
- 📦 **Grid de productos** - Visualización en 2 columnas
- ✨ **Indicador de disponibilidad** - Productos agotados

#### Mock Data:

```dart
8 productos predefinidos:
- Rosa Roja Romántica ($45.99)
- Girasol Amarillo ($35.50)
- Lirio Blanco Elegante ($55.00)
- Arreglo Multicolor ($75.99)
- Tulipán Rojo Intenso ($40.00) - Agotado
- Orquídea Tropical ($65.00)
- Ramo de Novia ($150.00)
- Clavel Rosa Pastel ($28.50)
```

#### Estados:

- Listado de todos los productos
- Filtrado por categoría
- Búsqueda por nombre
- Combinación de filtros

#### Uso:

```dart
CatalogScreen()
```

---

### 2. **ProductEntity** (`product_entity.dart`)

Modelo de datos para representar un producto.

#### Propiedades:

```dart
- id: String                // ID único
- name: String             // Nombre del producto
- description: String      // Descripción
- price: double            // Precio
- imageUrl: String?        // URL de imagen
- category: String         // Categoría
- rating: double           // Calificación (4.5 por defecto)
- reviews: int             // Número de reseñas
- stock: int               // Stock disponible
- isAvailable: bool        // ¿Disponible?
- isFavorite: bool         // ¿Es favorito?
- colors: List<String>?    // Colores disponibles
- sizes: List<String>?     // Tamaños disponibles
```

#### Métodos:

```dart
ProductEntity copyWith({
  // ... propiedades opcionales
})
```

#### Ejemplo:

```dart
final product = ProductEntity(
  id: '1',
  name: 'Rosa Roja Romántica',
  description: 'Hermosa rosa roja fresca',
  price: 45.99,
  imageUrl: 'https://...',
  category: 'Rosas',
  rating: 4.8,
  reviews: 128,
  stock: 10,
  isAvailable: true,
);
```

---

### 3. **ProductCardWidget** (`product_card_widget.dart`)

Card reutilizable para mostrar un producto en el grid.

#### Propiedades:

```dart
- imageUrl: String              // Imagen
- name: String                  // Nombre
- category: String              // Categoría
- price: double                 // Precio
- rating: double                // Calificación
- reviews: int                  // Reseñas
- isFavorite: bool              // Es favorito?
- isAvailable: bool             // Disponible?
- onTap: VoidCallback           // Al tocar la card
- onFavoriteTap: Function       // Al tocar el botón favorito
```

#### Características:

- Imagen con soporte para errores
- Overlay "Agotado" si no está disponible
- Botón de favorito con animación
- Badge de categoría
- Rating con número de reseñas
- Precio destacado

#### Ejemplo:

```dart
ProductCardWidget(
  imageUrl: 'https://...',
  name: 'Rosa Roja',
  category: 'Rosas',
  price: 45.99,
  rating: 4.8,
  reviews: 128,
  isFavorite: false,
  isAvailable: true,
  onTap: () => Navigator.push(...),
  onFavoriteTap: (isFav) => toggleFavorite(),
)
```

---

### 4. **CategoryFilterWidget** (`category_filter_widget.dart`)

Widget para filtrar productos por categoría.

#### Propiedades:

```dart
- categories: List<String>           // Lista de categorías
- selectedCategory: String           // Categoría seleccionada
- onCategorySelected: Function       // Callback de selección
```

#### Características:

- Scroll horizontal
- Categoría seleccionada con fondo azul
- Animación de sombra
- Botones redondeados

#### Ejemplo:

```dart
CategoryFilterWidget(
  categories: ['Todos', 'Rosas', 'Girasoles', 'Lirios'],
  selectedCategory: 'Todos',
  onCategorySelected: (category) {
    // Filtrar productos
  },
)
```

---

### 5. **ProductDetailScreen** (`product_detail_screen.dart`)

Pantalla de detalles completa del producto.

#### Características:

- 🖼️ **Imagen grande** del producto
- ⭐ **Rating y reseñas**
- 💰 **Precio destacado**
- 📝 **Descripción completa**
- 📦 **Información de stock**
- 🎛️ **Selector de cantidad** (botones + y -)
- ❤️ **Botón favorito** (En header)
- 🛒 **Botón agregar al carrito**

#### Uso:

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => ProductDetailScreen(
      productId: '1',
      productName: 'Rosa Roja Romántica',
      productImage: 'https://...',
      category: 'Rosas',
      price: 45.99,
      rating: 4.8,
      reviews: 128,
      description: 'Hermosa flor fresca...',
      stock: 10,
    ),
  ),
)
```

---

## 🔄 Flujo de Navegación

```
CatalogScreen (Listado)
    ↓ (al tocar una card)
ProductDetailScreen (Detalles)
    ↓ (agregar al carrito)
Carrito (próxima pantalla)
```

---

## 🎯 Funcionalidades

### Búsqueda y Filtrado

```dart
// Búsqueda en tiempo real
_filterProducts() {
  _filteredProducts = _allProducts.where((product) {
    final matchesCategory = _selectedCategory == 'Todos' ||
        product['category'] == _selectedCategory;
    final matchesSearch = product['name']
        .toLowerCase()
        .contains(_searchQuery.toLowerCase());
    return matchesCategory && matchesSearch;
  }).toList();
}
```

### Sistema de Favoritos

```dart
void _toggleFavorite(String productId) {
  setState(() {
    if (_favorites.contains(productId)) {
      _favorites.remove(productId);
    } else {
      _favorites.add(productId);
    }
  });
}
```

---

## 📊 Categorías Disponibles

1. **Todos** - Todos los productos
2. **Rosas** - Rosas en varios colores
3. **Girasoles** - Girasoles amarillos
4. **Lirios** - Lirios blancos y de colores
5. **Orquídeas** - Orquídeas tropicales
6. **Tulipanes** - Tulipanes variados
7. **Claveles** - Claveles rosas y otros colores
8. **Arreglos** - Arreglos especiales y ramos de novia

---

## 🛠️ Personalización

### Cambiar colores:

```dart
Colors.blue.shade600  → Colors.green.shade600  // Color principal
Colors.red.shade600   → Colors.pink.shade600   // Favoritos
```

### Añadir más productos:

```dart
{
  'id': '9',
  'name': 'Tu Producto',
  'category': 'Categoría',
  'price': 99.99,
  'image': 'https://...',
  'rating': 4.5,
  'reviews': 100,
  'isAvailable': true,
}
```

### Cambiar número de columnas:

```dart
childAspectRatio: 0.75  // 0.65 para más cuadrado
crossAxisCount: 2       // 3 para más columnas
```

---

## 💡 Próximas Mejoras

### 1. **Integración con API**

```dart
class ProductRepository {
  Future<List<ProductEntity>> fetchProducts() async {
    // Llamar a API
  }
}
```

### 2. **Carrito de Compras**

```dart
class CartScreen extends StatefulWidget {
  // Mostrar productos agregados
}
```

### 3. **Pagos**

```dart
class CheckoutScreen extends StatefulWidget {
  // Procesar pagos
}
```

### 4. **Filtros Avanzados**

- Filtro por rango de precio
- Ordenar por: precio, rating, nuevos
- Filtro por disponibilidad

### 5. **Reviews y Calificaciones**

```dart
class ReviewsScreen extends StatefulWidget {
  // Ver y crear reseñas
}
```

### 6. **Wishlist Persistente**

```dart
// Guardar favoritos localmente con shared_preferences
```

---

## 📱 Vista Previa

```
┌─────────────────────────────────┐
│ Nuestro Catálogo                │
│ Descubre nuestras mejores flores │
├─────────────────────────────────┤
│ [Buscar flores...] ✓             │
├─────────────────────────────────┤
│ [Todos] [Rosas] [Girasoles] ... │
├─────────────────────────────────┤
│ ┌────────┐ ┌────────┐           │
│ │ 🌹 Rosa│ │ 🌼 Gira│           │
│ │ Roja   │ │ sol    │           │
│ │        │ │        │           │
│ │⭐4.8   │ │⭐4.5   │           │
│ │$45.99  │ │$35.50  │           │
│ └────────┘ └────────┘           │
│ ┌────────┐ ┌────────┐           │
│ │ 🏵️ Lirio│ │ 🌷 Arreglo│       │
│ │ Blanco │ │ Multi   │          │
│ │        │ │        │           │
│ │⭐4.9   │ │⭐4.7   │           │
│ │$55.00  │ │$75.99  │           │
│ └────────┘ └────────┘           │
```

---

## ✅ Checklist

- [x] Pantalla principal de catálogo
- [x] Grid de productos
- [x] Búsqueda en tiempo real
- [x] Filtro por categorías
- [x] Sistema de favoritos
- [x] Card de producto reutilizable
- [x] Pantalla de detalles
- [x] Selector de cantidad
- [x] Botón agregar al carrito
- [ ] Integración con API
- [ ] Carrito de compras
- [ ] Historial de compras
- [ ] Reseñas y ratings
- [ ] Wishlist persistente

---

## 📞 Notas

- Los datos actualmente son mock data
- Las imágenes se obtienen de Unsplash (online)
- En producción, integra con tu API backend
- Considera cachear imágenes con `cached_network_image`
- Usa Provider o Bloc para gestionar estado global
