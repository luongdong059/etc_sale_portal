import 'package:etc_sale_portal/configs/configs.dart';
import 'package:etc_sale_portal/main_max.dart';
import 'package:flutter/material.dart';

void main() async{
  await AppConfigs(Flavor.ETC).setup();
  runApp(const RootConfig());
}

