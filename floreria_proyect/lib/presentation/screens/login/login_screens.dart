import 'package:floreria_proyect/presentation/widgets/LinkTextButton_widgets.dart';
import 'package:floreria_proyect/presentation/widgets/botoom_widgets.dart';
import 'package:floreria_proyect/presentation/widgets/field_widgets.dart';
import 'package:flutter/material.dart';

class LoginScreens extends StatefulWidget {
  const LoginScreens({super.key});

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.blue.shade50],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 24.0,
            ),
            child: Center(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Decorative header
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue.shade400,
                              Colors.blue.shade600,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.shade100.withOpacity(0.6),
                              blurRadius: 16,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.local_florist,
                          size: 56,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        'Bienvenido a Floreria',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Inicia sesión para continuar',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Card with form
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomTextField(
                                label: "Nombre completo",
                                controller: _nameController,
                                icon: Icons.person,
                                validator: (value) =>
                                    value == null || value.isEmpty
                                    ? 'Campo requerido'
                                    : null,
                              ),
                              const SizedBox(height: 12),
                              CustomTextField(
                                label: "Contraseña",
                                controller: _passwordController,
                                obscureText: true,
                                icon: Icons.lock,
                                validator: (value) =>
                                    (value == null || value.length < 6)
                                    ? 'Mínimo 6 caracteres'
                                    : null,
                              ),
                              const SizedBox(height: 18),
                              CustomButton(
                                text: "Ingresar",
                                onPressed: () {},
                                color: Colors.blue.shade700,
                                radius: 14,
                                vertical: 14,
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  LinkTextButton(
                                    text: 'Registrarte',
                                    onPressed: () {},
                                  ),
                                  LinkTextButton(
                                    text: 'Recuperar mi contraseña',
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Small footer text
                      Text(
                        'Al acceder aceptas los términos y condiciones',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
