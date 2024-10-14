import 'package:circular_menu/circular_menu.dart';
import 'package:etc_sale_portal/configs/configs.dart';
import 'package:etc_sale_portal/screens/double_tap_exit.dart';
import 'package:etc_sale_portal/themes/app_colors.dart';
import 'package:etc_sale_portal/themes/themes.dart';
import 'package:etc_sale_portal/utils/permission.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EtcWebView extends StatefulWidget {
  const EtcWebView({super.key});

  @override
  State<EtcWebView> createState() => _EtcWebViewState();
}

class _EtcWebViewState extends State<EtcWebView> {
  final TextEditingController _customUrl = TextEditingController();
  final WebViewController _controller = WebViewController();

  late String title = '';
  late bool isShowEdit = false;

  late List<CircularMenuItem> circularMenuItem = [
    CircularMenuItem(
        boxShadow: [],
        icon: Icons.edit,
        onTap: () {
          setState(() {
            isShowEdit = !isShowEdit;
          });
        }),
    CircularMenuItem(
        boxShadow: [],
        icon: Icons.cleaning_services_outlined,
        onTap: () async {
          await _controller.clearCache();
          await _controller
              .loadRequest(Uri.parse(AppConfigs.instance.values.url));
        }),
  ];

  @override
  void initState() {
    _customUrl.text = AppConfigs.instance.values.url;
    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            setUrl(url);
          },
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
    super.initState();
  }

  void setUrl(String url) {
    setState(() {
      _customUrl.text = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DoubleTapBackExitApp(
      child: SafeArea(
        child: Scaffold(
          body: AppConfigs.instance.flavor.toString() == 'Flavor.MAX'
              ? CircularMenu(
                  toggleButtonBoxShadow: [],
                  radius: 60.w,
                  toggleButtonColor: AppColors.black,
                  alignment: Alignment.bottomRight,
                  toggleButtonSize: 20,
                  backgroundWidget: Column(
                    children: [
                      if (isShowEdit)
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.circular(AppDimens.border),
                          ),
                          child: TextFormField(
                            controller: _customUrl,
                            textInputAction: TextInputAction.done,
                            maxLines: 1,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: "Url"),
                            onFieldSubmitted: (value) async {
                              if (value.isNotEmpty &&
                                  value.startsWith('http')) {
                                _controller.loadRequest(
                                    Uri.parse(_customUrl.text.toString()));
                              } else {
                                final String? url =
                                    await _controller.currentUrl();
                                setState(() {
                                  _customUrl.text = url ?? 'Unknown';
                                });
                              }
                              ;
                            },
                          ),
                        ),
                      Expanded(
                        child: WebViewWidget(
                          controller: _controller,
                        ),
                      ),
                    ],
                  ),
                  items: circularMenuItem,
                )
              : WebViewWidget(
                  controller: _controller,
                ),
        ),
      ),
    );
  }
}
