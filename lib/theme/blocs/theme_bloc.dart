import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:logger/logger.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(LightTheme()) {
    on<ThemeChanged>(_themeChanged);
  }

  // Attribute: _logger
  /// Logger instance to log the events and states of the bloc.
  final _logger = Logger();

  // Method: _themeChanged
  /// This method changes the theme of the app when the user toggles the switch.
  void _themeChanged(ThemeChanged event, Emitter<ThemeState> emit) {
    emit(state is LightTheme ? DarkTheme() : LightTheme());

    _logger.i('Theme changed to ${state is DarkTheme ? 'dark' : 'light'}');
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return json['theme'] == 'dark' ? DarkTheme() : LightTheme();
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return {'theme': state is DarkTheme ? 'dark' : 'light'};
  }
}
