import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:irida_qr/scan/blocs/blocs.dart';

void main() {
  group(
    'ScanBloc',
    () {
      test(
        'Initial State',
        () {
          expect(
            ScanBloc().state,
            equals(
              const ScanState(),
            ),
          );
        },
      );

      blocTest<ScanBloc, ScanState>(
        'emits [ScanStatus.inProgress] when ScanStarted is called',
        build: ScanBloc.new,
        act: (bloc) => bloc.add(ScanStarted()),
        expect: () => [const ScanState(status: ScanStatus.inProgress)],
      );
    },
  );
}
