import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../../../constants.dart';
import '../../../domain/core/load_status.dart';

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
        child: Text(
          FlutterI18n.translate(context, "loadStatus.initial"),
        ),
      ),
      inProgress: (_) => Column(
        children: [
          Text(
            FlutterI18n.translate(context, "loadStatus.inProgress"),
          ),
          const SizedBox(
            height: kDefaultHeightSize,
          ),
          const CircularProgressIndicator(),
        ],
      ),
      succeed: (_) => succeedScreen,
      failed: (_) => Center(
        child: Text(
          FlutterI18n.translate(context, "loadStatus.failed"),
        ),
      ),
    );
  }
}
