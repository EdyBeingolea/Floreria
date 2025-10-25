import 'package:flutter/material.dart';

/// Widget reutilizable para el header del perfil
class ProfileHeaderWidget extends StatelessWidget {
  final String? profileImageUrl;
  final String fullName;
  final String email;
  final bool isVerified;
  final VoidCallback? onEditPressed;

  const ProfileHeaderWidget({
    super.key,
    this.profileImageUrl,
    required this.fullName,
    required this.email,
    this.isVerified = false,
    this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
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
                child: profileImageUrl != null
                    ? ClipOval(
                        child: Image.network(
                          profileImageUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return _defaultProfileIcon();
                          },
                        ),
                      )
                    : _defaultProfileIcon(),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: onEditPressed,
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
            fullName,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            email,
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

  Widget _defaultProfileIcon() {
    return Center(
      child: Icon(Icons.person, size: 60, color: Colors.blue.shade400),
    );
  }
}
