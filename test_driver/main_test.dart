// import 'package:flutter_driver/flutter_driver.dart';
// import 'package:test/test.dart';

// void main() {
//   group('Home Screen Test', () {
//     FlutterDriver driver;
//     setUpAll(() async {
//       driver = await FlutterDriver.connect();
//     });

//     final homeSearchView = find.byValueKey('home_search_view');
//     final textTitleCategory = find.byValueKey('text_test');

//     String titleName = '';
//     test('verify the text on home screen', () async {
//       await driver.waitFor(homeSearchView);
//       titleName = await driver.getText(textTitleCategory);
//       expect(titleName, 'Test display');
//     });

//     tearDownAll(() async {
//       if (driver != null) {
//         driver.close();
//       }
//     });
//   });
// }
