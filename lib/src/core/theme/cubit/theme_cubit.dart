import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_state.dart';
part 'theme_cubit.freezed.dart';

// <>
class ThemeCubit extends Cubit<ThemeState> {

  ThemeCubit() : super(const ThemeState.success(false));

  void toggleTheme() {
    state.when(
      success: (isDarkMode) => emit(ThemeState.success(!isDarkMode)),
    );
  }

  void setDarkMode(){
    emit(const ThemeState.success(true));
  }
  
  void setLightMode(){
    emit(const ThemeState.success(false));
  }
  
}