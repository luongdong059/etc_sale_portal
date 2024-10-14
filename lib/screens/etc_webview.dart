import 'package:etc_sale_portal/configs/configs.dart';
import 'package:etc_sale_portal/screens/double_tap_exit.dart';
import 'package:etc_sale_portal/themes/app_colors.dart';
import 'package:etc_sale_portal/utils/permission.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EtcWebView extends StatefulWidget {
  const EtcWebView({super.key});

  @override
  State<EtcWebView> createState() => _EtcWebViewState();
}

class _EtcWebViewState extends State<EtcWebView> {
  final WebViewController _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onHttpError: (HttpResponseError error) {},
        onWebResourceError: (WebResourceError error) {},
        // onNavigationRequest: (NavigationRequest request) {
        //   if (request.url.startsWith('https://www.youtube.com/')) {
        //     return NavigationDecision.prevent;
        //   }
        //   return NavigationDecision.navigate;
        // },
      ),
    )
    ..loadRequest(Uri.parse(AppConfigs.instance.values.url))
    ..addJavaScriptChannel('Flutter',
        onMessageReceived: (JavaScriptMessage mess) {});

  late String title = '';

    @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DoubleTapBackExitApp(
      child: SafeArea(
        child: Scaffold(
          body: WebViewWidget(
            controller: _controller,
          ),
        ),
      ),
    );
  }
}
