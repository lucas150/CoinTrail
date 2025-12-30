import 'package:flutter/material.dart';
import 'auth_field.dart';

class LoginForm extends StatelessWidget {
  final FocusNode emailFocus;
  final FocusNode usernameFocus;
  final FocusNode passwordFocus;

  const LoginForm({
    super.key,
    required this.emailFocus,
    required this.usernameFocus,
    required this.passwordFocus,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.05),

          AuthField(
            label: 'Email',
            icon: Icons.email_outlined,
            colors: colors,
            focusNode: emailFocus,
          ),
          const SizedBox(height: 24),

          AuthField(
            label: 'Username',
            icon: Icons.person_outline,
            colors: colors,
            focusNode: usernameFocus,
          ),
          const SizedBox(height: 24),

          AuthField(
            label: 'Password',
            icon: Icons.lock_outline,
            colors: colors,
            obscure: true,
            focusNode: passwordFocus,
          ),
        ],
      ),
    );
  }
}
