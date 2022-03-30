import 'package:edu_proj1/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

void main() {
    FlavorConfig(
        name: "HevenDoor",
        // color: Colors.red,
        // location: BannerLocation.bottomStart,
        variables: {
            "winChance": 100,
            "door": "assets/door_heven.jpg",
        },
    );

  runApp(App());
}
