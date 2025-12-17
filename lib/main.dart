import 'package:cointrail/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // /// -- README(Update[]) -- GetX Local Storage
  // await GetStorage.init();

  // /// -- README(Docs[1]) -- Await Splash until other items Load
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // /// YOUR SUPABASE KEY ID HERE
  // await Supabase.initialize(url: '', anonKey: '');

  // /// -- README(Docs[2]) -- Initialize Firebase & Authentication Repository
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((_) => Get.put(AuthenticationRepository()));

  /// -- Main App Starts here (app.dart) ...
  runApp(const App());
}
