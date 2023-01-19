import 'package:flutter/material.dart';

import '../../constants/app_parameters/app_sizes.dart';

class TermPrivacy extends StatelessWidget {
  const TermPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'By using our services you are agreeing to our',
          style: Theme.of(context).textTheme.caption,
        ),
        Gaps.h4,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: Text(
                'Terms',
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.black87,
                    ),
              ),
            ),
            Text(
              ' and ',
              style: Theme.of(context).textTheme.caption,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                'Privacy Statement',
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
