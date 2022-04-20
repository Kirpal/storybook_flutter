import 'dart:async';

import 'package:alchemist/alchemist.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) =>
    AlchemistConfig.runWithConfig(
      run: () async => await testMain(),
      config: AlchemistConfig.current().copyWith(
        ciGoldensConfig: AlchemistConfig.current().ciGoldensConfig.copyWith(
              renderShadows: true,
            ),
      ),
    );
