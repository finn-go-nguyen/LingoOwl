import 'package:flutter/material.dart';

import '../../../../widgets/common/app_bar.dart';
import '../../../../widgets/common/scaffold.dart';
import 'wishlist_list.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LScaffold(
      appBar: LAppBar(title: 'Wishlist'),
      body: WishlistListView(),
    );
  }
}
