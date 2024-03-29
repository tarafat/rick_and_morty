import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:rick_and_morty/core/app_core.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

// Add cross-flavor configuration here
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
// preserving splash screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
//setting up dependencies
  diSetup();
//waiting for dependencies init
  await locator.allReady();
//removing splash
  FlutterNativeSplash.remove();
//calling builder for app init
  runApp(await builder());
}
