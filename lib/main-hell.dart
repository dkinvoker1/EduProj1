import 'package:flutter/material.dart';
import 'app.dart';
import 'flavors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'getItInstance.dart';

void main() async {
  F.appFlavor = Flavor.HELL;

  configureDependencies();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(App());
}
