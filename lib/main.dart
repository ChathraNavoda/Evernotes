import 'package:evernotes/screens/splash_screen.dart';
import 'package:evernotes/services/app_router.dart';
import 'package:evernotes/services/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'blocs/bloc_exports.dart';

bool? seenOnboard;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // final storage = await HydratedStorage.build(
  //     storageDirectory: await getApplicationDocumentsDirectory());
  //to show the status bar
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  BlocOverrides.runZoned(
    () => runApp(
      MyApp(
        appRouter: AppRouter(),
      ),
    ),
    // storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TasksBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            home: const SplashScreen(),
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
