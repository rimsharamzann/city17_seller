import 'package:city17_seller/config/route_names.dart';
import 'package:city17_seller/source/constants/asset_string.dart';
import 'package:city17_seller/source/constants/string_data.dart';
import 'package:city17_seller/source/core/components/custom_container.dart';
import 'package:city17_seller/source/core/extensions/context_extension.dart';
import 'package:city17_seller/source/features/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();

    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _handleGoogleSignIn() async {
    final authCubit = context.read<AuthCubit>();
    await authCubit.signInWithGoogle();
    print(
      'google login succesflll.............................................................',
    );
    Navigator.pushNamed(context, RouteNames.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
          } else if (state is AuthSuccess) {
            Navigator.pushReplacementNamed(context, RouteNames.home);
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: animation,
                child: Center(
                  child: Container(
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(AssetString.logo),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                StringData.displayManager,
                style: TextStyle(color: Colors.white38),
              ),
              SizedBox(height: context.height / 2),
              _signInWithGoogle(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInWithGoogle() {
    return GestureDetector(
      onTap: _handleGoogleSignIn,
      child: CustomContainer(
        height: 50,
        child: Row(
          children: [
            Image.asset(AssetString.googleIcon),
            SizedBox(width: 10),
            Text(
              'Sign in With Google',
              style: context.textTheme.bodyMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
