import 'package:etc_sale_portal/themes/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../themes/app_colors.dart';

class DoubleTapBackExitApp extends StatefulWidget {
  const DoubleTapBackExitApp({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 2500),
  });

  final Widget child;

  final Duration duration;

  @override
  _DoubleTapBackExitAppState createState() => _DoubleTapBackExitAppState();
}

class _DoubleTapBackExitAppState extends State<DoubleTapBackExitApp> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) => canPop(context, value),
      child: widget.child,
    );
  }
}

Future<void> canPop(BuildContext context, bool didPop) async {
  if (didPop) {
    return;
  }
  final bool shouldPop = await showDialog(
    barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: AppColors.backgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(AppDimens.border))),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                    backgroundColor: AppColors.error,
                  ),
                  child: const Text('Bỏ qua'),
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child:const  Text('Đồng ý'),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                ),
              ],
             content:  const Text("Bạn có chắc muốn thoát khỏi ứng dụng ?"),
            );
          }) ??
      false;

  if (context.mounted && shouldPop) {
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }
}
