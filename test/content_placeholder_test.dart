import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:content_placeholder/content_placeholder.dart';

void main() {
  const MethodChannel channel = MethodChannel('content_placeholder');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await ContentPlaceholder.platformVersion, '42');
  });
}
