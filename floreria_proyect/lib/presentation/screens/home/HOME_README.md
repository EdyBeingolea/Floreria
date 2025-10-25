# Pantalla de Inicio - Florería App

## 📋 Descripción General

Pantalla de inicio profesional para una florerría con banners, productos recomendados, más vendidos, nuevos arrivals y promociones especiales.

---

## 📁 Estructura de Archivos

```
lib/presentation/
├── screens/home/
│   ├── home_screean.dart           # Pantalla principal de inicio
│   └── HOME_README.md              # Documentación
└── widgets/
    ├── banner_carousel_widget.dart    # Carrusel de banners
    ├── product_highlight_widget.dart  # Widget de producto destacado
    └── section_title_widget.dart      # Título de sección
```

---

## 🎨 Componentes Principales

### 1. **HomeScreean** (`home_screean.dart`)

Pantalla principal con múltiples secciones.

#### Secciones:

- 🎉 **Header de Bienvenida** - Saludo personalizado
- 🎠 **Banners Carousel** - Promociones rotativas
- 🔥 **Más Vendidos** - Productos con mayor demanda
- 🎁 **Ofertas Especiales** - Cupón y promoción destacada
- ✨ **Nuevos Arrivals** - Productos recién llegados
- 📧 **Newsletter** - Suscripción de correo

#### Mock Data:

```dart
// 3 Banners promocionales
// 4 Productos más vendidos
// 4 Productos nuevos
```

#### Uso:

```dart
HomeScreean()
```

---

### 2. **BannerCarouselWidget** (`banner_carousel_widget.dart`)

Carrusel de banners con indicadores de puntos.

#### Propiedades:

```dart
- banners: List<Map<String, String>>  // Lista de banners
  - title: String
  - subtitle: String
  - image: String (URL)
```

#### Características:

- 🎠 Desplazamiento suave con PageView
- 📍 Indicadores de puntos interactivos
- 🎨 Gradiente oscuro en la imagen
- ⚡ Animaciones fluidas
- 📱 Responsive y adaptativo

#### Ejemplo:

```dart
BannerCarouselWidget(
  banners: [
    {
      'title': 'Descuento de Primavera',
      'subtitle': 'Hasta 40% de descuento',
      'image': 'https://...',
    },
  ],
)
```

---

### 3. **ProductHighlightWidget** (`product_highlight_widget.dart`)

Widget para mostrar productos destacados en horizontal.

#### Propiedades:

```dart
- imageUrl: String              // Imagen
- name: String                  // Nombre
- price: double                 // Precio actual
- originalPrice: double         // Precio original
- discount: String              // Texto de descuento
- isNew: bool                   // ¿Es producto nuevo?
- onTap: VoidCallback           // Al tocar
```

#### Características:

- 🖼️ Imagen con fallback
- 🏷️ Badge de descuento (rojo)
- ✨ Badge de "NUEVO" (verde)
- 💰 Doble precio con tachado
- 📐 Tamaño fijo (160x220)

#### Ejemplo:

```dart
ProductHighlightWidget(
  imageUrl: 'https://...',
  name: 'Rosa Roja',
  price: 35.99,
  originalPrice: 59.99,
  discount: '-40%',
  isNew: false,
  onTap: () {},
)
```

---

### 4. **SectionTitleWidget** (`section_title_widget.dart`)

Widget reutilizable para títulos de secciones.

#### Propiedades:

```dart
- title: String                 // Título
- actionText: String?           // Texto de acción
- onActionTap: VoidCallback?    // Callback de acción
```

#### Características:

- 📝 Título bold
- 🔗 Acción clickeable (derecha)
- 🎨 Colores consistentes

#### Ejemplo:

```dart
SectionTitleWidget(
  title: 'Más Vendidos 🔥',
  actionText: 'Ver todos',
  onActionTap: () {},
)
```

---

## 📊 Estructura Visual

```
┌─────────────────────────────────┐
│ Bienvenido a Florería 🌸         │
│ Descubre las flores más hermosas │
├─────────────────────────────────┤
│   ┌───────────────────────────┐ │
│   │  [Banner Carousel]        │ │
│   │  Descuento Primavera      │ │
│   │  . • .                    │ │
│   └───────────────────────────┘ │
├─────────────────────────────────┤
│ Más Vendidos 🔥          Ver → │
│ [Card1] [Card2] [Card3] [Card4]│
├─────────────────────────────────┤
│ ┌─────────────────────────────┐ │
│ │ Cupón: PRIMAVERA2024        │ │
│ │ 20% descuento              │ │
│ │              [Copiar]      │ │
│ └─────────────────────────────┘ │
├─────────────────────────────────┤
│ Nuevos Arrivals ✨       Ver → │
│ [Card1] [Card2] [Card3] [Card4]│
├─────────────────────────────────┤
│ ┌─────────────────────────────┐ │
│ │ Suscríbete al Newsletter  →│ │
│ │ Recibe ofertas exclusivas  │ │
│ └─────────────────────────────┘ │
└─────────────────────────────────┘
```

---

## 🎯 Funcionalidades

### Carrusel de Banners

```dart
// Desplazamiento automático y manual
// Indicadores interactivos
// Animación suave
```

### Productos en Horizontal

```dart
// SingleChildScrollView para scroll lateral
// Cards compactas (160px de ancho)
// Espaciado consistente
```

### Promociones

```dart
// Cupón copiable
// Gradiente atractivo
// CTA clara
```

---

## 🎨 Paleta de Colores

| Elemento  | Color          | Uso              |
| --------- | -------------- | ---------------- |
| Primario  | Blue.shade600  | Botones, enlaces |
| Descuento | Red.shade600   | Badge de ofertas |
| Nuevo     | Green.shade600 | Badge de nuevos  |
| Fondo     | Grey.shade50   | Background       |
| Texto     | Black87        | Títulos          |
| Subtexto  | Grey.shade600  | Descripción      |

---

## 💡 Próximas Mejoras

### 1. **Integración con API**

```dart
class HomeProvider extends ChangeNotifier {
  Future<void> loadBanners() async { }
  Future<void> loadBestsellers() async { }
}
```

### 2. **Análisis y Personalización**

- Mostrar productos basado en historial
- Recomendaciones personalizadas
- Analytics de clics

### 3. **Navegación a Detalles**

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => ProductDetailScreen(
      productId: product['id'],
    ),
  ),
)
```

### 4. **Sincronización de Favoritos**

- Integrar con sistema global de favoritos
- Persistencia local

### 5. **Buscar Desde Home**

```dart
SearchDelegate para buscar desde inicio
```

---

## 🛠️ Personalización

### Cambiar banners:

```dart
final List<Map<String, String>> banners = [
  {
    'title': 'Tu Título',
    'subtitle': 'Tu Subtítulo',
    'image': 'https://...',
  },
];
```

### Cambiar colores:

```dart
Colors.blue.shade600 → Colors.green.shade600
Colors.red.shade600 → Colors.orange.shade600
```

### Agregar más secciones:

```dart
// Repetir patrón de SectionTitle + Producto List
```

---

## 📱 Responsiveness

- ✅ Se adapta a diferentes tamaños
- ✅ Scroll vertical principal
- ✅ Scroll horizontal de productos
- ✅ Banners responsive
- ✅ Espaciado adaptable

---

## ✅ Checklist de Implementación

- [x] Header de bienvenida
- [x] Carrusel de banners
- [x] Productos más vendidos
- [x] Ofertas especiales (cupón)
- [x] Productos nuevos
- [x] Newsletter CTA
- [x] Widgets reutilizables
- [x] Responsive design
- [ ] Integración con API
- [ ] Analytics
- [ ] Recomendaciones personalizadas
- [ ] Sincronización de favoritos

---

## 📞 Notas

- Los datos actualmente son mock data
- Las imágenes son de Unsplash (online)
- Integra con tu backend para datos reales
- Usa Provider/Bloc para estado global
- Considera caché de imágenes con `cached_network_image`
