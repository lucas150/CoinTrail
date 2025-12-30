import 'package:flutter/material.dart';
import '../../login/widgets/auth_field.dart';

class RegisterForm extends StatelessWidget {
  final FocusNode emailFocus;
  final FocusNode usernameFocus;
  final FocusNode passwordFocus;
  final FocusNode confirmPasswordFocus;

  const RegisterForm({
    super.key,
    required this.emailFocus,
    required this.usernameFocus,
    required this.passwordFocus,
    required this.confirmPasswordFocus,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: size.height * 0.12, // space for keyboard / CTA
      ),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.04),

          AuthField(
            label: 'Email',
            icon: Icons.email_outlined,
            colors: colors,
            focusNode: emailFocus,
          ),
          const SizedBox(height: 20),

          AuthField(
            label: 'Username',
            icon: Icons.person_outline,
            colors: colors,
            focusNode: usernameFocus,
          ),
          const SizedBox(height: 20),

          AuthField(
            label: 'Password',
            icon: Icons.lock_outline,
            colors: colors,
            obscure: true,
            focusNode: passwordFocus,
          ),
          const SizedBox(height: 20),

          AuthField(
            label: 'Confirm Password',
            icon: Icons.lock_outline,
            colors: colors,
            obscure: true,
            focusNode: confirmPasswordFocus,
          ),
        ],
      ),
    );
  }
}
