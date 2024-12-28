import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irida_qr/theme/theme.dart';

// Widget -> ThemeToggleButton
/// Button that toggles the theme of the app.
class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return IconButton(
          icon: Icon(
            state is DarkTheme ? Icons.light_mode : Icons.dark_mode,
          ),
          onPressed: () => context.read<ThemeBloc>().add(ThemeChanged()),
        );
      },
    );
  }
}
