// TODO: Add Forget Password Page

import 'package:cointrail/features/authentication/controller/auth_controller.dart';
import 'package:cointrail/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/login_header.dart';
import 'widgets/login_form.dart';
import 'widgets/login_blob_cta.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final AuthController auth = Get.put(AuthController());

  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Email and password are required',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    auth.login(_emailController.text.trim(), _passwordController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colors.primary,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              const LoginHeader(),

              Expanded(
                child: LoginForm(
                  emailFocus: _emailFocus,
                  passwordFocus: _passwordFocus,
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
              ),

              LoginBlobCTA(
                height: size.height * 0.34,
                primaryButtonText: 'Login',
                onPrimaryTap: _onLogin,
                secondaryText: 'or Register',
                onSecondaryTap: () {
                  Get.toNamed(TRoutes.register);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
