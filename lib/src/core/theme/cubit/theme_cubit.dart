import 'package:app_plataforma/src/features/auth_response/domain/usecases/get_is_dark_mode.dart';
import 'package:app_plataforma/src/features/auth_response/domain/usecases/set_is_dark_mode.dart';
import 'package:app_plataforma/src/shared/usecases/use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_state.dart';
part 'theme_cubit.freezed.dart';

// <>
class ThemeCubit extends Cubit<ThemeState> {

  final GetIsDarkMode getIsDarkMode;
  final SetIsDarkMode setIsDarkMode;

  ThemeCubit({required this.getIsDarkMode, required this.setIsDarkMode})
      : super(const ThemeState.success(false)) {
    _initialize();
  }

  Future<void> _initialize() async {
    final result = await getIsDarkMode(NoParams());
    emit(ThemeState.success(result));
  }
  
  void toggleTheme() {
    state.when(
      success: (isDarkMode) async {
        final newMode = !isDarkMode;
        await setIsDarkMode.call(newMode);
        emit(ThemeState.success(newMode));
        },
    );
  }

  void setDarkMode() async {
    await setIsDarkMode.call(true);
    emit(const ThemeState.success(true));
  }
  
  void setLightMode() async {
    await setIsDarkMode.call(false);
    emit(const ThemeState.success(false));
  }
  
}