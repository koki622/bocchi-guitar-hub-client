import 'package:bocchi_guitar_hub_client/application/notifier/app_scaffold/overlay_loading_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingScreen extends ConsumerWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(overlayLoadingNotifierProvider);

    return isLoading
        ? Container(
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Container();
  }
}
