import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irida_qr/scan/scan.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

@RoutePage()
class HomeProvider extends StatelessWidget {
  const HomeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ScanBloc>(
          create: (context) => ScanBloc(),
        ),
        BlocProvider<RecordsBloc>(
          create: (context) => RecordsBloc(),
        ),
      ],
      child: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScanBloc, ScanState>(
      builder: (context, state) {
        if (state.status == ScanStatus.initial) {
          return const ScansView();
        }

        if (state.status == ScanStatus.inProgress) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: MobileScanner(
              onDetect: (capture) {
                context.read<ScanBloc>().add(
                  ScanCompleted(
                      capture.barcodes.first.rawValue!
                  ),
                );
              },
            ),
          );
        }

        if (state.status == ScanStatus.completed) {
          return Scaffold(
            appBar: AppBar(title: const Text('Scan Completed')),
            body: Center(
              child: Text(state.scanResult!),
            ),
          );
        }

        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
