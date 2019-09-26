import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Home Screen Test', () {
    FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    final homeSearchView = find.byValueKey('home_search_view');
    
    test('verify the text on home screen', () async {
      await driver.waitFor(homeSearchView);
      await driver.tap(homeSearchView);
      print('SearchView clicked');
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
  
  });

  group('Movie Detail Screen Test', () {
    FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    final textMovieName = 'text_cast_item_1';

    test('credit profile name', () async {
      await driver.waitForAbsent(find.text(textMovieName));
      String name = await driver.getText(find.byValueKey(textMovieName));
      print('TESTING $name');
      expect(name, isNotEmpty);
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

  });

}
