import 'package:flutter/material.dart';

import '../models/entry.dart';

class HorizontalChild extends StatelessWidget {
  final Entry firstEntry;

  const HorizontalChild({Key? key, required this.firstEntry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          firstEntry.title,
          style: Theme.of(context).textTheme.headline4,
        ),
        Text(firstEntry.body),
      ],
    );
  }
}
