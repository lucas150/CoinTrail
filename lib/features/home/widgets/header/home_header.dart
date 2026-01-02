// import 'package:flutter/material.dart';
// import 'package:cointrail/core_utils/constants/sizes.dart';
// import 'package:cointrail/core_utils/constants/text_strings.dart';
// import 'package:cointrail/features/home/controller/home_controller.dart';
// import 'package:provider/provider.dart';

// class HomeHeader extends StatelessWidget {
//   const HomeHeader({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final colors = theme.colorScheme;
//     final controller = context.watch<HomeController>();

//     return SizedBox(
//       height: 180, // controls header height
//       child: Stack(
//         children: [
//           // ----------------------------------
//           // GREEN BACKGROUND
//           // ----------------------------------
//           Container(
//             height: 150,
//             width: double.infinity,
//             color: colors.primary, // teal / green
//           ),

//           // ----------------------------------
//           // WHITE CURVED CUTOUT
//           // ----------------------------------
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               height: 70,
//               decoration: BoxDecoration(
//                 color: colors.surface,
//                 borderRadius: const BorderRadius.vertical(
//                   top: Radius.circular(48),
//                 ),
//               ),
//             ),
//           ),

//           // ----------------------------------
//           // HEADER CONTENT
//           // ----------------------------------
//           Padding(
//             padding: const EdgeInsets.fromLTRB(
//               TSizes.lg,
//               TSizes.lg,
//               TSizes.lg,
//               TSizes.lg,
//             ),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Text
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Welcome Back, ${controller.userName} ! 👋",
//                         style: Theme.of(context).textTheme.headlineSmall
//                             ?.copyWith(
//                               fontWeight: FontWeight.w800,
//                               color: colors.onSurface,
//                             ),
//                       ),
//                       const SizedBox(height: TSizes.xs),
//                       Text(
//                         TTexts.header_Tagline,
//                         style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                           color: colors.onSurface.withOpacity(0.85),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Action button
//                 Container(
//                   width: 40,
//                   height: 40,
//                   decoration: BoxDecoration(
//                     color: colors.onPrimary,
//                     shape: BoxShape.circle,
//                   ),
//                   child: InkWell(
//                     customBorder: const CircleBorder(),
//                     onTap: () {},
//                     child: Icon(
//                       Icons.notifications_rounded,
//                       color: colors.primary,
//                       size: 30,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:cointrail/common/header/appHeader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cointrail/features/home/controller/home_controller.dart';
import 'package:cointrail/core_utils/constants/text_strings.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();

    return AppHeader(
      title: 'Welcome, ${controller.userName} 👋',
      subtitle: TTexts.header_Tagline,
      showNotification: true,
      onNotificationTap: () {
        // TODO: navigate to notifications
      },
    );
  }
}
