import 'dart:async';

import 'package:flutter/cupertino.dart';

class RefreshListenable extends ChangeNotifier {
  RefreshListenable(this.stream) {
    notifyListeners();
    _streamSubscription = stream.asBroadcastStream().listen((_) {
      notifyListeners();
    });
  }

  final Stream<dynamic> stream;
  late final StreamSubscription<dynamic> _streamSubscription;

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}
