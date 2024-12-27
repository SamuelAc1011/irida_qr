part of 'theme_bloc.dart';

sealed class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

final class DarkTheme extends ThemeState {}

final class LightTheme extends ThemeState {}
