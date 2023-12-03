import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../domain/core/load_status.dart';
import 'translation_helper.dart';

class LoadStatusScreen extends StatelessWidget {
  final LoadStatus loadStatus;
  final Widget succeedScreen;
  const LoadStatusScreen({
    Key? key,
    required this.loadStatus,
    required this.succeedScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return loadStatus.map(
      initial: (_) => Center(
        child: Text(tr(context, "loadStatus.initial")),
      ),
      inProgress: (_) => Column(
        children: [
          Text(tr(context, "loadStatus.inProgress")),
          const SizedBox(
            height: kDefaultHeightSize,
          ),
          const CircularProgressIndicator(),
        ],
      ),
      succeed: (_) => succeedScreen,
      failed: (_) => Center(
        child: Text(tr(context, "loadStatus.failed")),
      ),
    );
  }
}
