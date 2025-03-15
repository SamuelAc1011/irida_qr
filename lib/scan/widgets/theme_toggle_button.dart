import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
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
            state is DarkTheme ? IconsaxPlusBold.sun_1 : IconsaxPlusBold.moon,
          ),
          onPressed: () => context.read<ThemeBloc>().add(ThemeChanged()),
        );
      },
    );
  }
}
