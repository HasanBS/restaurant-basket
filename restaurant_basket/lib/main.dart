import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants/app/app_constants.dart';
import 'core/init/lang/lang_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/theme/app_theme_dark.dart';
import 'core/init/theme/app_theme_light.dart';
import 'core/init/theme/cubit/theme_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: LanguageManager.instance.supportedLocales,
        path: AppConstants.LANG_PATH,
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget with WidgetsBindingObserver {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    context.read<ThemeCubit>().updateAppTheme();
    super.didChangePlatformBrightness();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 640),
        builder: () => MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              // themeMode: context.select(
              //     (ThemeCubit themeCubit) => themeCubit.state.themeMode),
              theme: AppThemeLight.instance.theme,
              darkTheme: AppThemeDark.instance.theme,
              onGenerateRoute: NavigationRoute.instance.generateRoute,
              navigatorKey: NavigationService.instance.navigatorKey,
            ));
  }
}
