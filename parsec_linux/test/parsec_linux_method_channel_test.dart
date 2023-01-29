import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parsec_linux/parsec_linux_method_channel.dart';

void main() {
  MethodChannelParsecLinux platform = MethodChannelParsecLinux();
  const MethodChannel channel = MethodChannel('parsec_linux');

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
    expect(await platform.getPlatformVersion(), '42');
  });
}