// // import 'package:cointrail/features/authentication/controller/auth_controller.dart';
// // import 'package:cointrail/routes/routes.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:get/get_core/src/get_main.dart';
// // import '../login/widgets/login_blob_cta.dart';
// // import 'widgets/register_header.dart';
// // import 'widgets/register_form.dart';

// // class RegisterPage extends StatefulWidget {
// //   const RegisterPage({super.key});

// //   @override
// //   State<RegisterPage> createState() => _RegisterPageState();
// // }

// // class _RegisterPageState extends State<RegisterPage> {
// //   final _emailFocus = FocusNode();
// //   final _usernameFocus = FocusNode();
// //   final _passwordFocus = FocusNode();
// //   final _confirmPasswordFocus = FocusNode();

// //   final _emailController = TextEditingController();
// //   final _usernameController = TextEditingController();
// //   final _passwordController = TextEditingController();
// //   final _confirmPasswordController = TextEditingController();

// //   final AuthController auth = Get.put(AuthController());

// //   @override
// //   void dispose() {
// //     _emailFocus.dispose();
// //     _usernameFocus.dispose();
// //     _passwordFocus.dispose();
// //     _confirmPasswordFocus.dispose();

// //     _emailController.dispose();
// //     _usernameController.dispose();
// //     _passwordController.dispose();
// //     _confirmPasswordController.dispose();

// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final colors = Theme.of(context).colorScheme;
// //     final size = MediaQuery.of(context).size;

// //     return Scaffold(
// //       resizeToAvoidBottomInset: false,
// //       backgroundColor: colors.primary,
// //       body: GestureDetector(
// //         behavior: HitTestBehavior.translucent,
// //         onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
// //         child: SafeArea(
// //           bottom: false,
// //           child: Column(
// //             children: [
// //               const RegisterHeader(),

// //               Expanded(
// //                 child: RegisterForm(
// //                   emailFocus: _emailFocus,
// //                   usernameFocus: _usernameFocus,
// //                   passwordFocus: _passwordFocus,
// //                   confirmPasswordFocus: _confirmPasswordFocus,
// //                 ),
// //               ),

// //               LoginBlobCTA(
// //                 height: size.height * 0.34,
// //                 primaryButtonText: 'Register',
// //                 onPrimaryTap: () {
// //                   auth.register(
// //                     _emailController.text.trim(),
// //                     _passwordController.text.trim(),
// //                     _usernameController.text.trim(),
// //                   );
// //                 },

// //                 secondaryText: 'or Login',
// //                 onSecondaryTap: () {
// //                   Get.toNamed(TRoutes.login);
// //                 },
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:cointrail/features/authentication/controller/auth_controller.dart';
// import 'package:cointrail/routes/routes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../login/widgets/login_blob_cta.dart';
// import 'widgets/register_form.dart';
// import 'widgets/register_header.dart';

// class RegisterPage extends StatefulWidget {
//   const RegisterPage({super.key});

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final _emailFocus = FocusNode();
//   final _usernameFocus = FocusNode();
//   final _passwordFocus = FocusNode();
//   final _confirmPasswordFocus = FocusNode();

//   final _emailController = TextEditingController();
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();

//   final AuthController auth = Get.put(AuthController());

//   @override
//   void dispose() {
//     _emailFocus.dispose();
//     _usernameFocus.dispose();
//     _passwordFocus.dispose();
//     _confirmPasswordFocus.dispose();

//     _emailController.dispose();
//     _usernameController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final colors = Theme.of(context).colorScheme;
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: colors.primary,
//       body: GestureDetector(
//         onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//         child: SafeArea(
//           bottom: false,
//           child: Column(
//             children: [
//               const RegisterHeader(),

//               Expanded(
//                 child: RegisterForm(
//                   emailFocus: _emailFocus,
//                   usernameFocus: _usernameFocus,
//                   passwordFocus: _passwordFocus,
//                   confirmPasswordFocus: _confirmPasswordFocus,
//                   emailController: _emailController,
//                   usernameController: _usernameController,
//                   passwordController: _passwordController,
//                   confirmPasswordController: _confirmPasswordController,
//                 ),
//               ),

//               LoginBlobCTA(
//                 height: size.height * 0.34,
//                 primaryButtonText: 'Register',
//                 onPrimaryTap: () {
//                   if (_passwordController.text !=
//                       _confirmPasswordController.text) {
//                     Get.snackbar('Error', 'Passwords do not match');
//                     return;
//                   }

//                   auth.register(
//                     _emailController.text.trim(),
//                     _passwordController.text.trim(),
//                     _usernameController.text.trim(),
//                   );
//                 },
//                 secondaryText: 'or Login',
//                 onSecondaryTap: () {
//                   Get.offAllNamed(TRoutes.login);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:cointrail/core_utils/validators/auth_validators.dart';
import 'package:cointrail/features/authentication/controller/auth_controller.dart';
import 'package:cointrail/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login/widgets/login_blob_cta.dart';
import 'widgets/register_header.dart';
import 'widgets/register_form.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailFocus = FocusNode();
  final _usernameFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();

  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final AuthController auth = Get.put(AuthController());

  @override
  void dispose() {
    _emailFocus.dispose();
    _usernameFocus.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();

    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onRegister() {
    final email = _emailController.text.trim();
    final username = _usernameController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    final emailError = AuthValidators.validateEmail(email);
    final usernameError = AuthValidators.validateUsername(username);
    final passwordError = AuthValidators.validatePassword(password);
    final confirmError = AuthValidators.validateConfirmPassword(
      password,
      confirmPassword,
    );

    final error = emailError ?? usernameError ?? passwordError ?? confirmError;

    if (error != null) {
      Get.snackbar('Invalid Input', error, snackPosition: SnackPosition.BOTTOM);
      return;
    }

    auth.register(email, password, username);
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
              const RegisterHeader(),

              Expanded(
                child: RegisterForm(
                  emailFocus: _emailFocus,
                  usernameFocus: _usernameFocus,
                  passwordFocus: _passwordFocus,
                  confirmPasswordFocus: _confirmPasswordFocus,
                  emailController: _emailController,
                  usernameController: _usernameController,
                  passwordController: _passwordController,
                  confirmPasswordController: _confirmPasswordController,
                ),
              ),

              LoginBlobCTA(
                height: size.height * 0.34,
                primaryButtonText: 'Register',
                onPrimaryTap: _onRegister,
                secondaryText: 'or Login',
                onSecondaryTap: () {
                  Get.toNamed(TRoutes.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
