import 'package:flutterproject/client/onboard_client.dart';
import 'package:rxdart/subjects.dart';

class RegisterNameBloc {
  final client = OnboardClient();

  final lastNameSubject = BehaviorSubject<String>();
  final firstNameSubject = BehaviorSubject<String>();
  final buttonSubject = BehaviorSubject<bool>();

  bool firstNameFlag = false, lastNameFlag = false;
  String lastNameString = '', firstNameString = '';

  setData() {
    client.item.firstName = firstNameString;
    client.item.lastName = lastNameString;
  }

  Stream<bool> get lastNameValidation => lastNameSubject.stream.map(
        (text) {
          lastNameString = text;
          lastNameFlag = text.length > 0;

          buttonSubject.add(lastNameFlag);
          return lastNameFlag;
        },
      );
  Stream<bool> get firstNameValidation => firstNameSubject.stream.map(
        (text) {
          firstNameString = text;
          firstNameFlag = text.length > 0;

          buttonSubject.add(firstNameFlag);
          return firstNameFlag;
        },
      );
  Stream<bool> get buttonValidation => buttonSubject.stream.map(
        (flag) {
          return firstNameFlag && lastNameFlag;
        },
      );

  dispose() {
    lastNameSubject.close();
    firstNameSubject.close();
    buttonSubject.close();
  }
}
