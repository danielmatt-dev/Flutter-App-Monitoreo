import 'package:app_plataforma/src/core/theme/app_theme.dart';
import 'package:app_plataforma/src/core/theme/cubit/theme_cubit.dart';
import 'package:app_plataforma/src/features/auth_response/domain/usecases/get_is_dark_mode.dart';
import 'package:app_plataforma/src/features/auth_response/domain/usecases/set_is_dark_mode.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';

initThemeInjections() {

  sl.registerSingleton<AppTheme>(AppTheme());

  /*  Use Cases  */
  sl.registerSingleton<GetIsDarkMode>(GetIsDarkMode(sl()));

  sl.registerSingleton<SetIsDarkMode>(SetIsDarkMode(sl()));

  sl.registerSingleton<ThemeCubit>(
      ThemeCubit(
          getIsDarkMode: sl(),
          setIsDarkMode: sl()
      )
  );

}