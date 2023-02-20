import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'logger.dart';

class ProviderLogger extends ProviderObserver {
  @override
  void didAddProvider(
      ProviderBase provider, Object? value, ProviderContainer container) {
    log.d('Init: ${provider.runtimeType}');
    super.didAddProvider(provider, value, container);
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    log.d('Dispose: ${provider.runtimeType}');
    super.didDisposeProvider(provider, container);
  }

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log.d(
        'Update: ${provider.runtimeType}\nPrevious: $previousValue\nNew: $newValue');
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }
}
