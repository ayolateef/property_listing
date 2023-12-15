import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterflow_test/utils/colors.dart';
import 'package:flutterflow_test/utils/config/app_startup.dart';
import 'package:flutterflow_test/utils/navigation/navigation_service.dart';
import 'package:flutterflow_test/utils/navigation/routes.dart';
import 'package:get_it/get_it.dart';

import 'features/root/route/route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await AppStartUp().setUp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: false,
        designSize: const Size(454, 982),
        builder: (BuildContext context, child) => GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus &&
                    currentFocus.focusedChild != null) {
                  currentFocus.focusedChild?.unfocus();
                }
              },
              child: MaterialApp(
                title: 'Property App',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  textSelectionTheme:
                      TextSelectionThemeData(cursorColor: AppColors.black),
                  fontFamily: "Nexa",
                  scaffoldBackgroundColor: Colors.white,
                ),
                themeMode: ThemeMode.dark,
                navigatorKey: GetIt.I<NavigationService>().navigatorKey,
                // home: const SplashScreen(),
                initialRoute: RootRoutes.initial,
                onGenerateRoute: routes,
              ),
            ));
  }
}
