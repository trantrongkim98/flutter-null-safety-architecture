// @dart = 2.8
// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.

    final buttonSwitchTheme = find.byValueKey('switchTheme');
    final countKey = find.byValueKey('counterKey');
    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    /// start flutter test driver and close when tearDownAll
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    /// it'll close driver then run all test done
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts at 0', () async {
      expect(await driver.getText(countKey), '0');
    });

    test('increments the counter', () async {
      // First, tap the button.
      await Future.delayed(Duration(seconds: 3));
      await driver.tap(buttonSwitchTheme);
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(buttonSwitchTheme);
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(buttonSwitchTheme);
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(buttonSwitchTheme);
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(buttonSwitchTheme);

      // Then, verify the counter text is incremented by 1.
      expect(await driver?.getText(countKey), '5');
      await driver?.screenshot();

      await Future.delayed(Duration(seconds: 3));
    });
  });
}
