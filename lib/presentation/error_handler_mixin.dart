import 'package:bocchi_guitar_hub_client/application/exception.dart';
import 'package:bocchi_guitar_hub_client/presentation/component/failure_snakbar.dart';
import 'package:bocchi_guitar_hub_client/presentation/component/success_snak_bar.dart';
import 'package:flutter/material.dart';

mixin ErrorHandlerMixin {
  Future<void> execute(
    BuildContext context,
    Future<void> Function() action, {
    required String successMessage,
  }) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      await action();
      SuccessSnackBar.show(
        scaffoldMessenger,
        message: successMessage,
      );
    } on ApplicationException catch (e) {
      FailureSnackBar.show(
        scaffoldMessenger,
        message: e.toString(),
      );
    }
  }
}
