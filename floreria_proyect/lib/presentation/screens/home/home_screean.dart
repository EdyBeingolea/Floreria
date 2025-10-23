import 'package:floreria_proyect/presentation/widgets/botoom_widgets.dart';
import 'package:floreria_proyect/presentation/widgets/field_widgets.dart';
import 'package:flutter/material.dart';
// el botón reutilizable del ejemplo anterior

class HomeScreean extends StatefulWidget {
  const HomeScreean({Key? key}) : super(key: key);

  @override
  State<HomeScreean> createState() => _HomeScreeanState();
}

class _HomeScreeanState extends State<HomeScreean> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
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
                controller: _nameController,
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
