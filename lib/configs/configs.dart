import 'package:etc_sale_portal/utils/permission.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

enum Flavor { ETC, MAX }

class AppConfigs {
  final Flavor flavor;
  final FlavorValues values;

  static AppConfigs? _instance;

  AppConfigs._internal(
    this.flavor,
    this.values,
  );

  factory AppConfigs(Flavor flavor) {
    return _instance ??= AppConfigs._internal(
      flavor,
      flavor.get(),
    );
  }

  static AppConfigs get instance {
    return _instance!;
  }

  Future<void> setup() async {
    WidgetsFlutterBinding.ensureInitialized();


    // Set device orientation to portrait-only
    await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // Default transparent status bar
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );

    // var camera = await Permission.camera.status;
    // var photo = await Permission.photos.status;
    // var mediaLibrary = await Permission.mediaLibrary.status;
    // var microphone = await Permission.microphone.status;
    // var bluetooth = await Permission.bluetooth.status;
    //
    //
    // if (camera == PermissionStatus.denied) {
    //   camera = await Permission.camera.request();
    // }
    // if (photo == PermissionStatus.denied) {
    //   photo = await Permission.photos.request();
    // }
    // if (mediaLibrary == PermissionStatus.denied) {
    //   mediaLibrary = await Permission.mediaLibrary.request();
    // }
    // if (microphone == PermissionStatus.denied) {
    //   microphone = await Permission.microphone.request();
    // }
    // if (bluetooth == PermissionStatus.denied) {
    //   microphone = await Permission.bluetooth.request();
    // }

    // await FlutterDownloader.initialize(
    //     debug: true // optional: set false to disable printing logs to console
    // );
    //
    //
    // Bloc.observer = SimpleBlocObserver();
  }
}

extension FlavorExtension on Flavor {
  FlavorValues get() {
    switch (this) {
      case Flavor.MAX:
        return FlavorValues(
            appName: 'ETC Sale Portal',
            url: 'https://dms-etc-max.smartinnotech.io/vi/sale',
            isDebugEnabled: true);
      case Flavor.ETC:
        return FlavorValues(
            appName: 'ETC Sale Portal',
            url: 'https://dms-etc.smartinnotech.io/vi/sale',
            isDebugEnabled: true);

      default:
        return FlavorValues(
            appName: 'ETC Sale Portal',
            url: 'https://dms-etc-max.smartinnotech.io/vi/sale',
            isDebugEnabled: false);
    }
  }
}

class FlavorValues {
  final String appName;
  final String url;
  final bool? isDebugEnabled;

  FlavorValues(
      {required this.appName, required this.url, required this.isDebugEnabled});
}
