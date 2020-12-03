import 'package:flutterproject/client/onboard_client.dart';
import 'package:rxdart/subjects.dart';

class RegisterCourseBloc {
  final controller = BehaviorSubject<int>();

  final pickerItems = [
    "1 course",
    "2 course",
    "3 course",
    "4 course",
  ];

  int selectedIndex = -1;

  String getItem() {
    return selectedIndex == -1 ? '' : pickerItems[selectedIndex];
  }

  void setData() {
    OnboardClient().item.course = selectedIndex + 1;
  }

  Stream<bool> get textValidationStream => controller.stream.map(
        (index) {
          selectedIndex = index;
          return index >= 0;
        },
      );

  dispose() {
    controller.close();
  }
}
