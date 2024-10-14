import 'package:etc_sale_portal/configs/configs.dart';
import 'package:etc_sale_portal/screens/etc_webview.dart';
import 'package:etc_sale_portal/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey();
GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey();

void main() async{
  await AppConfigs(Flavor.MAX).setup();
  runApp(const RootConfig());
}

class RootConfig extends StatefulWidget {
  const RootConfig({super.key});

  @override
  State<RootConfig> createState() => _RootConfigState();
}

class _RootConfigState extends State<RootConfig> {
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: ((context, child) {
        return FamiCare();
      }),
    );
  }
}

class FamiCare extends StatelessWidget {
  const FamiCare({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfigs.instance.values.appName,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      theme: AppThemes.light,
      home: EtcWebView()
    );
  }
}

