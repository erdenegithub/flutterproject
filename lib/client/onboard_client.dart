import 'package:flutterproject/client/onboard_item.dart';

class OnboardClient {
  static final OnboardClient _singleton = OnboardClient._internal();

  factory OnboardClient() {
    return _singleton;
  }

  OnboardClient._internal();

  OnboardItem item = OnboardItem();
}
