import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';

import 'field_value_behaviors_parameters.dart';

void main() async {
  String firestoreImplementation =
      Platform.environment['FIRESTORE_IMPLEMENTATION'];
  if (!validImplementationNames.contains(firestoreImplementation)) {
    throw Exception(
        'Please set environmental varialbe FIRESTORE_IMPLEMENTATION to '
        'cloud_firestore_mocks or cloud_firestore');
  }

  final FlutterDriver driver = await FlutterDriver.connect();

  // Sends the choice to test application running on a device
  await driver.requestData(firestoreImplementation);

  await driver.requestData('waiting_test_completion',
      timeout: const Duration(minutes: 1));
  await driver.close();
}
