# Estructura de Configuración de Usuario - Florería App

## 📋 Descripción General

Esta es la estructura completa para la pantalla de configuración y perfil de usuario. Incluye:

- **Pantalla Principal**: `UserScreen` - Visualización completa del perfil
- **Modelos de Datos**: `UserEntity` - Entidad de usuario
- **Widgets Reutilizables**: Componentes modulares para perfiles y configuración

---

## 📁 Estructura de Archivos

```
lib/
├── domain/
│   └── entities/
│       └── user_entity.dart          # Modelo de datos del usuario
├── presentation/
│   ├── screens/
│   │   └── users/
│   │       └── user_Screen.dart      # Pantalla principal de usuario
│   └── widgets/
│       ├── profile_header_widget.dart # Header del perfil (reutilizable)
│       └── setting_tile_widget.dart   # Tiles de configuración (reutilizable)
```

---

## 🎨 Componentes Principales

### 1. **UserScreen** (`user_Screen.dart`)

Pantalla principal que integra todos los componentes. Incluye:

#### Secciones:

- **Header del Perfil**

  - Imagen de perfil circular
  - Nombre y email del usuario
  - Badge de verificación
  - Botón para editar perfil

- **Información Personal**

  - Teléfono
  - Dirección
  - Ciudad
  - Todos editables

- **Configuración**

  - Notificaciones
  - Seguridad
  - Privacidad
  - Idioma

- **Acciones**
  - Descargar datos
  - Cerrar sesión

#### Uso básico:

```dart
UserScreen()
```

---

### 2. **UserEntity** (`user_entity.dart`)

Modelo de datos para representar un usuario.

#### Propiedades:

```dart
- id: String                    // ID único del usuario
- fullName: String             // Nombre completo
- email: String                // Correo electrónico
- phone: String                // Teléfono
- profileImageUrl: String?     // URL de la foto de perfil
- address: String              // Dirección
- city: String                 // Ciudad
- createdAt: DateTime           // Fecha de creación
- isVerified: bool             // ¿Está verificado?
```

#### Métodos:

```dart
// Copiar la entidad con cambios parciales
UserEntity copyWith({
  String? fullName,
  String? email,
  // ... más propiedades
})
```

#### Ejemplo de uso:

```dart
final user = UserEntity(
  id: '123',
  fullName: 'Juan Pérez',
  email: 'juan@example.com',
  phone: '+34 654 321 098',
  address: 'Calle Principal 123',
  city: 'Madrid',
  createdAt: DateTime.now(),
  isVerified: true,
);

// Actualizar datos
final updatedUser = user.copyWith(
  phone: '+34 654 321 099',
);
```

---

### 3. **ProfileHeaderWidget** (`profile_header_widget.dart`)

Widget reutilizable para mostrar el header del perfil.

#### Propiedades:

```dart
- profileImageUrl: String?        // URL de la imagen
- fullName: String               // Nombre del usuario
- email: String                  // Email del usuario
- isVerified: bool               // ¿Está verificado?
- onEditPressed: VoidCallback?   // Callback del botón editar
```

#### Ejemplo de uso:

```dart
ProfileHeaderWidget(
  fullName: 'Juan Pérez',
  email: 'juan@example.com',
  profileImageUrl: 'https://example.com/image.jpg',
  isVerified: true,
  onEditPressed: () {
    Navigator.pushNamed(context, '/edit-profile');
  },
)
```

---

### 4. **SettingTileWidget** (`setting_tile_widget.dart`)

Widget reutilizable para un tile individual de configuración.

#### Propiedades:

```dart
- icon: IconData              // Icono del tile
- title: String              // Título
- subtitle: String?          // Subtítulo
- onTap: VoidCallback        // Acción al tocar
- iconColor: Color?          // Color del icono
- showArrow: bool            // Mostrar flecha
- trailing: Widget?          // Widget personalizado a la derecha
```

#### Ejemplo de uso:

```dart
SettingTileWidget(
  icon: Icons.notifications_outlined,
  title: 'Notificaciones',
  subtitle: 'Gestiona tus preferencias',
  onTap: () => Navigator.pushNamed(context, '/notifications'),
  iconColor: Colors.blue.shade600,
)
```

---

### 5. **SettingSectionWidget** (`setting_tile_widget.dart`)

Widget para agrupar múltiples tiles en una sección.

#### Propiedades:

```dart
- title: String                    // Título de la sección
- tiles: List<SettingTileWidget>  // Lista de tiles
- padding: EdgeInsets             // Espaciado personalizado
```

#### Ejemplo de uso:

```dart
SettingSectionWidget(
  title: 'CONFIGURACIÓN',
  tiles: [
    SettingTileWidget(
      icon: Icons.notifications_outlined,
      title: 'Notificaciones',
      subtitle: 'Gestiona tus preferencias',
      onTap: () {},
    ),
    SettingTileWidget(
      icon: Icons.security_outlined,
      title: 'Seguridad',
      subtitle: 'Cambiar contraseña',
      onTap: () {},
    ),
  ],
)
```

---

## 🔗 Integración con el NavigationBar

El `UserScreen` ya está integrado en el `MainScreen` como la cuarta opción del NavigationBar:

```dart
NavigationItem(
  icon: Icons.person_outline_rounded,
  activeIcon: Icons.person_rounded,
  label: 'Usuario',
)
```

---

## 💡 Próximas Mejoras Sugeridas

### 1. **Crear Pantalla de Edición de Perfil**

```dart
// lib/presentation/screens/users/edit_profile_screen.dart
class EditProfileScreen extends StatefulWidget {
  final UserEntity user;
  const EditProfileScreen({required this.user});
  // ...
}
```

### 2. **Integrar con Provider/Bloc**

```dart
// Para gestionar el estado del usuario
class UserProvider extends ChangeNotifier {
  UserEntity? _user;

  Future<void> loadUser() async { /* ... */ }
  Future<void> updateUser(UserEntity user) async { /* ... */ }
}
```

### 3. **Crear Pantallas Específicas**

- `NotificationsScreen` - Gestión de notificaciones
- `SecurityScreen` - Cambio de contraseña
- `PrivacyScreen` - Configuración de privacidad
- `LanguageScreen` - Selección de idioma

### 4. **Añadir Validaciones**

```dart
// Validar emails, teléfonos, etc.
class UserValidator {
  static String? validateEmail(String email) { /* ... */ }
  static String? validatePhone(String phone) { /* ... */ }
}
```

---

## 🎯 Flujo de Uso

1. **Usuario accede a la app**
2. **Navega a la pestaña "Usuario"**
3. **Ve su perfil con toda su información**
4. **Puede:**
   - Editar su foto (toca el botón de editar)
   - Editar su información (toca los campos)
   - Acceder a configuraciones
   - Descargar sus datos
   - Cerrar sesión

---

## 🛠️ Personalización

### Cambiar colores principales:

```dart
// En UserScreen o ProfileHeaderWidget
Colors.blue.shade400 → Colors.green.shade400
Colors.blue.shade600 → Colors.green.shade600
```

### Añadir más opciones de configuración:

```dart
_buildSettingTile(
  Icons.dark_mode_outlined,
  'Tema oscuro',
  'Activar tema oscuro',
  onTap: () { /* ... */ },
),
```

---

## 📱 Vista Previa de Pantalla

```
┌─────────────────────────────────────┐
│    [Header Gradiente Azul]          │
│    ┌─────────────────────────────┐  │
│    │   [Foto Círculo]    [Edit]  │  │
│    │   Juan Pérez                │  │
│    │   juan@example.com          │  │
│    │   ✓ Verificado              │  │
│    └─────────────────────────────┘  │
├─────────────────────────────────────┤
│ INFORMACIÓN PERSONAL                │
│ ┌─────────────────────────────────┐ │
│ │ 📞 Teléfono | +34 654 321 098  │ │
│ │─────────────────────────────────│ │
│ │ 📍 Dirección | Calle Princ 123 │ │
│ │─────────────────────────────────│ │
│ │ 🏙️  Ciudad | Madrid             │ │
│ └─────────────────────────────────┘ │
├─────────────────────────────────────┤
│ CONFIGURACIÓN                       │
│ ┌─────────────────────────────────┐ │
│ │ 🔔 Notificaciones | →           │ │
│ │─────────────────────────────────│ │
│ │ 🔒 Seguridad | →                │ │
│ │─────────────────────────────────│ │
│ │ 🛡️  Privacidad | →              │ │
│ │─────────────────────────────────│ │
│ │ 🌐 Idioma | →                   │ │
│ └─────────────────────────────────┘ │
├─────────────────────────────────────┤
│ [📥 Descargar datos]                │
│ [🚪 Cerrar sesión]                  │
└─────────────────────────────────────┘
```

---

## ✅ Checklist de Implementación

- [x] Pantalla principal de usuario
- [x] Header con foto de perfil
- [x] Información personal editable
- [x] Sección de configuración
- [x] Botones de acciones
- [x] Widgets reutilizables
- [x] Modelo de datos (UserEntity)
- [ ] Integración con API
- [ ] Manejo de estado (Provider/Bloc)
- [ ] Validaciones
- [ ] Pantallas específicas de configuración

---

## 📞 Notas

- Los datos actualmente son mock data
- En producción, integra con un Provider o Bloc para gestionar el estado
- Personaliza los colores según tu branding
- Añade más opciones de configuración según necesites
