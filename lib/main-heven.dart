import 'package:flutter/material.dart';
import 'app.dart';
import 'flavors.dart';
import 'package:flutter/services.dart';

void main() {
  F.appFlavor = Flavor.HEVEN;

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((value) => runApp(App()));
}
