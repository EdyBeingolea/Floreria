import 'package:flutter/material.dart';

/// Widget reutilizable para un tile de configuración
class SettingTileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  final Color? iconColor;
  final bool showArrow;
  final Widget? trailing;

  const SettingTileWidget({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
    this.iconColor,
    this.showArrow = true,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: (iconColor ?? Colors.blue).withOpacity(0.1),
        ),
        child: Icon(icon, color: iconColor ?? Colors.blue.shade600),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            )
          : null,
      trailing:
          trailing ??
          (showArrow
              ? Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey.shade400,
                )
              : null),
    );
  }
}

/// Widget reutilizable para una sección de configuración
class SettingSectionWidget extends StatelessWidget {
  final String title;
  final List<SettingTileWidget> tiles;
  final EdgeInsets padding;

  const SettingSectionWidget({
    super.key,
    required this.title,
    required this.tiles,
    this.padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: padding,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
              letterSpacing: 0.5,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
            children: List.generate(
              tiles.length,
              (index) => Column(
                children: [
                  tiles[index],
                  if (index < tiles.length - 1)
                    Divider(height: 0, color: Colors.grey.shade200, indent: 60),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
