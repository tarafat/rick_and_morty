import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/core/app_core.dart';

import 'package:rick_and_morty/layers/presenation/favourite_cast/bloc/favourite_bloc.dart';
import 'package:rick_and_morty/layers/presenation/navigation/cubit/navigation_cubit.dart';
import 'package:rick_and_morty/layers/presenation/navigation/view/navigation_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationCubit>(
          create: (BuildContext context) => NavigationCubit(),
        ),
        BlocProvider<FavouriteBloc>(
          create: (BuildContext context) => FavouriteBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            useMaterial3: true,
          ),
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorKey: NavigationService.navigatorKey,
          home: const NavigationScreen(),
        ),
      ),
    );
  }
}
