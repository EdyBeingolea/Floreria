import 'package:floreria_proyect/presentation/widgets/botoom_widgets.dart';
import 'package:floreria_proyect/presentation/widgets/field_widgets.dart';
import 'package:flutter/material.dart';

class RegisterLoginScreens extends StatefulWidget {
  const RegisterLoginScreens({super.key});

  @override
  State<RegisterLoginScreens> createState() => _RegisterLoginScreensState();
}

class _RegisterLoginScreensState extends State<RegisterLoginScreens> {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                label: "Nombre completo",
                controller: _userNameController,
                icon: Icons.person,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Campo requerido' : null,
              ),
              CustomTextField(
                label: "Correo electrónico",
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                icon: Icons.email,
                validator: (value) =>
                    value!.contains('@') ? null : 'Email inválido',
              ),
              CustomTextField(
                label: "Contraseña",
                controller: _passwordController,
                obscureText: true,
                icon: Icons.lock,
                validator: (value) =>
                    value!.length < 6 ? 'Mínimo 6 caracteres' : null,
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: "Registrar",
                onPressed: () {},
                color: Colors.blue,
                radius: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
