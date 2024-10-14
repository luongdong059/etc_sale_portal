import 'dart:async';

import 'package:etc_sale_portal/main_max.dart';
import 'package:etc_sale_portal/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionChecker {
  static Future<void> initPermission() async {
    const Permission cameraPermission = Permission.camera;
    const Permission photoPermission = Permission.photos;
    const Permission mediaPermission = Permission.mediaLibrary;

    final cameraStatus = await cameraPermission.status;
    final photoStatus = await photoPermission.status;
    final mediaLibStatus = await mediaPermission.status;

    if (cameraStatus.isDenied) {
      await cameraPermission.request();
    }
    if (photoStatus.isDenied) {
      await photoPermission.request();
    }
    if (mediaLibStatus.isDenied) {
      await mediaPermission.request();
    }
  }

  static Future<bool> checkCameraPermission() async {
    final PermissionStatus cameraPermission = await Permission.camera.status;
    if (cameraPermission == PermissionStatus.granted) return true;
    return false;
  }

  static Future<void> requestCameraPermission() async {
    PermissionStatus status = await Permission.camera.status;
    // if the permission is permanently denied, we should open the app settings
    if (status.isPermanentlyDenied) {
      unawaited(await showDialog(
        context: navigatorKey.currentState!.context,
        builder: (context) {
          return AlertDialog(
              title: Text(
                'Quyền truy cập',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              content: const Text(
                  'Ứng dụng yêu cầu quyền truy cập camera để sử dụng các tính năng!'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(navigatorKey.currentState!.context);
                    },
                    style:
                        TextButtonTheme.of(navigatorKey.currentState!.context)
                            .style!
                            .copyWith(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (states) => AppColors.error)),
                    child: const Text('Bỏ qua')),
                TextButton(
                    onPressed: () async {
                      Navigator.pop(navigatorKey.currentState!.context);
                      await openAppSettings();
                    },
                    child: const Text('Đồng ý'))
              ]);
        },
      ));
    } else if (status.isDenied) {
      await Permission.camera.request();
    }
  }
}
