import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:url_strategy/url_strategy.dart';
import 'app_module.dart';
import 'app_widget.dart';
import 'core/app_config.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  await Parse().initialize(
    kAppId, 
    kServerUrl,
    clientKey: kClientId,
    autoSendSessionId: true,
    debug: true,
    );
  runApp(ModularApp(
    module: AppModule(),
    child: AppWidget(),
  ));
}
