import 'package:app_plataforma/src/core/theme/app_theme.dart';
import 'package:app_plataforma/src/core/theme/cubit/theme_cubit.dart';
import 'package:app_plataforma/src/shared/utils/injections.dart';

initThemeInjections() {

  sl.registerSingleton<AppTheme>(AppTheme());

  sl.registerSingleton<ThemeCubit>(ThemeCubit());

}