import 'package:city17_seller/source/core/components/custom_text_feild.dart';
import 'package:city17_seller/source/features/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Login Successful")));
              // Navigate to Home or Dashboard
            } else if (state is AuthError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text('Email'),
                const SizedBox(height: 10),
                CustomTextFeild(controller: emailController, hintText: 'email'),
                const SizedBox(height: 20),
                Text('Password'),
                const SizedBox(height: 10),
                CustomTextFeild(
                  controller: passwordController,
                  hintText: 'passwrd',
                ),

                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();
                    context.read<AuthCubit>().loginWithEmailPassword(
                      email,
                      password,
                    );
                  },
                  child: state is AuthLoading
                      ? const CircularProgressIndicator()
                      : const Text("Login"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
