import 'package:flutterproject/client/onboard_client.dart';
import 'package:rxdart/subjects.dart';

class RegisterEmailBloc {
  final controller = BehaviorSubject<String>();

  String currentString = '';

  void setData() {
    OnboardClient().item.email = currentString;
  }

  Stream<bool> get textValidationStream => controller.stream.map(
        (text) {
          currentString = text;
          return text.length > 6;
        },
      );

  dispose() {
    controller.close();
  }
}
