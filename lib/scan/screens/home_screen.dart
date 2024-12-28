import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irida_qr/theme/blocs/blocs.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Irida QR'),
        actions: [
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return IconButton(
                icon: Icon(
                  state is DarkTheme ? Icons.light_mode : Icons.dark_mode,
                ),
                onPressed: () => context.read<ThemeBloc>().add(ThemeChanged()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Lottie.asset(
          'assets/lotties/search.json',
          width: MediaQuery.sizeOf(context).width * 0.3,
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.qr_code_rounded),
      ),
    );
  }
}
