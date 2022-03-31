enum Flavor {
  HELL,
  HEVEN,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.HELL:
        return 'Hell door';
      case Flavor.HEVEN:
        return 'Heven door';
      default:
        return 'Heven door';
    }
  }

  static int get winChance {
    switch (appFlavor) {
      case Flavor.HELL:
        return 0;
      case Flavor.HEVEN:
        return 100;
      default:
        return 100;
    }
  }

  static String get door {
    switch (appFlavor) {
      case Flavor.HELL:
        return 'assets/door_hell.jpg';
      case Flavor.HEVEN:
        return 'assets/door_heven.jpg';
      default:
        return 'assets/door_heven.jpg';
    }
  }
}
