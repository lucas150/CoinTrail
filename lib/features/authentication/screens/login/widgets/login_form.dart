import 'package:flutter/material.dart';
import '../../../widgets/auth_field.dart';

class LoginForm extends StatelessWidget {
  final FocusNode emailFocus;
  final FocusNode passwordFocus;

  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginForm({
    super.key,
    required this.emailFocus,
    required this.passwordFocus,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.06),

          AuthField(
            label: 'Email',
            icon: Icons.email_outlined,
            colors: colors,
            focusNode: emailFocus,
            controller: emailController,
          ),
          const SizedBox(height: 24),

          AuthField(
            label: 'Password',
            icon: Icons.lock_outline,
            colors: colors,
            focusNode: passwordFocus,
            controller: passwordController,
            obscure: true,
          ),

          const SizedBox(height: 120), // space above blob
        ],
      ),
    );
  }
}
