import 'package:city17_seller/source/constants/asset_string.dart';
import 'package:city17_seller/source/features/auth/cubit/auth_cubit.dart';
import 'package:city17_seller/source/features/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _submit(AuthCubit cubit) {
    if (_formKey.currentState!.validate()) {
      // print('regiestering user................................');

      cubit.register(
        nameController.text.trim(),
        emailController.text.trim(),
        passwordController.text.trim(),
      );
    }
    // print('user registered................................');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Registration successful")));
          } else if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          final cubit = context.read<AuthCubit>();

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const SizedBox(height: 40),
              Center(
                child: SizedBox(
                  height: 160,
                  width: 160,
                  child: Image.asset(AssetString.logo),
                ),
              ),
              const SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                      validator: (value) =>
                          value!.isEmpty ? 'Enter name' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: (value) =>
                          value!.contains('@') ? null : 'Enter valid email',
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      validator: (value) =>
                          value!.length < 6 ? 'Min 6 characters' : null,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: state is AuthLoading
                          ? null
                          : () => _submit(cubit),
                      child: state is AuthLoading
                          ? const CircularProgressIndicator()
                          : const Text("Register"),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
