import 'package:flutter/material.dart';
import '../../../widgets/auth_field.dart';

class RegisterForm extends StatelessWidget {
  final FocusNode emailFocus;
  final FocusNode usernameFocus;
  final FocusNode passwordFocus;
  final FocusNode confirmPasswordFocus;

  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const RegisterForm({
    super.key,
    required this.emailFocus,
    required this.usernameFocus,
    required this.passwordFocus,
    required this.confirmPasswordFocus,
    required this.emailController,
    required this.usernameController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.04),

          AuthField(
            label: 'Email',
            icon: Icons.email_outlined,
            colors: colors,
            focusNode: emailFocus,
            controller: emailController,
          ),
          const SizedBox(height: 20),

          AuthField(
            label: 'Username',
            icon: Icons.person_outline,
            colors: colors,
            focusNode: usernameFocus,
            controller: usernameController,
          ),
          const SizedBox(height: 20),

          AuthField(
            label: 'Password',
            icon: Icons.lock_outline,
            colors: colors,
            focusNode: passwordFocus,
            controller: passwordController,
            obscure: true,
          ),
          const SizedBox(height: 20),

          AuthField(
            label: 'Confirm Password',
            icon: Icons.lock_outline,
            colors: colors,
            focusNode: confirmPasswordFocus,
            controller: confirmPasswordController,
            obscure: true,
          ),

          const SizedBox(height: 120), // space above blob
        ],
      ),
    );
  }
}
