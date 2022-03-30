import 'package:edu_proj1/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

void main() {
    FlavorConfig(
        name: "HellDoor",
        // color: Colors.red,
        // location: BannerLocation.bottomStart,
        variables: {
            "winChance": 0,
            "door": "assets/door_hell.jpg",
        },
    );

  runApp(App());
}
