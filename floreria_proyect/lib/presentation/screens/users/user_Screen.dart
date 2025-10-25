import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  // Mock data - En producción vendrá de un provider o API
  final String userName = "Juan Pérez";
  final String userEmail = "juan@example.com";
  final String userPhone = "+34 654 321 098";
  final String userAddress = "Calle Principal 123";
  final String userCity = "Madrid";
  final bool isVerified = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header del Perfil
            _buildProfileHeader(),
            const SizedBox(height: 24),
            // Información Personal
            _buildInfoSection(),
            const SizedBox(height: 24),
            // Configuración
            _buildSettingsSection(),
            const SizedBox(height: 24),
            // Acciones
            _buildActionsSection(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue.shade400, Colors.blue.shade600],
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.blue.shade400,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Editar perfil')),
                    );
                  },
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.blue.shade600, width: 2),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 4),
                      ],
                    ),
                    child: Icon(
                      Icons.edit,
                      size: 18,
                      color: Colors.blue.shade600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            userName,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            userEmail,
            style: const TextStyle(fontSize: 14, color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          if (isVerified) ...[
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.verified, size: 16, color: Colors.green.shade300),
                const SizedBox(width: 4),
                Text(
                  'Verificado',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.green.shade300,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'INFORMACIÓN PERSONAL',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildInfoTile(Icons.phone, 'Teléfono', userPhone),
                Divider(height: 0, color: Colors.grey.shade200, indent: 60),
                _buildInfoTile(Icons.location_on, 'Dirección', userAddress),
                Divider(height: 0, color: Colors.grey.shade200, indent: 60),
                _buildInfoTile(Icons.location_city, 'Ciudad', userCity),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue.withOpacity(0.1),
        ),
        child: Icon(icon, color: Colors.blue.shade600),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
      ),
      trailing: Icon(
        Icons.edit_outlined,
        size: 18,
        color: Colors.grey.shade400,
      ),
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Editar $title')));
      },
    );
  }

  Widget _buildSettingsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CONFIGURACIÓN',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildSettingTile(
                  Icons.notifications_outlined,
                  'Notificaciones',
                  'Gestiona tus preferencias',
                  onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Notificaciones')),
                  ),
                ),
                Divider(height: 0, color: Colors.grey.shade200, indent: 60),
                _buildSettingTile(
                  Icons.security_outlined,
                  'Seguridad',
                  'Cambiar contraseña',
                  onTap: () => ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Seguridad'))),
                ),
                Divider(height: 0, color: Colors.grey.shade200, indent: 60),
                _buildSettingTile(
                  Icons.privacy_tip_outlined,
                  'Privacidad',
                  'Controla tu privacidad',
                  onTap: () => ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Privacidad'))),
                ),
                Divider(height: 0, color: Colors.grey.shade200, indent: 60),
                _buildSettingTile(
                  Icons.language_outlined,
                  'Idioma',
                  'Español',
                  onTap: () => ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Idioma'))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingTile(
    IconData icon,
    String title,
    String subtitle, {
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue.withOpacity(0.1),
        ),
        child: Icon(icon, color: Colors.blue.shade600),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey.shade400,
      ),
    );
  }

  Widget _buildActionsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Descargar datos')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade600,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Descargar mis datos',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Cerrar sesión')));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade600,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Cerrar sesión',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
