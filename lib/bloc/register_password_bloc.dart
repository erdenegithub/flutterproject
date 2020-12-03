import 'package:flutterproject/bloc/firebase_controller.dart';
import 'package:flutterproject/client/onboard_client.dart';
import 'package:rxdart/subjects.dart';

class RegisterPasswordBloc {
  final client = OnboardClient();

  final password1Subject = BehaviorSubject<String>();
  final password2Subject = BehaviorSubject<String>();
  final buttonSubject = BehaviorSubject<bool>();

  final nextSubject = PublishSubject<bool>();

  String password1 = '', password2 = '';

  Stream<void> get password1Validation => password1Subject.stream.map(
        (text) {
          password1 = text;
          buttonSubject.add(true);
        },
      );
  Stream<void> get password2Validation => password2Subject.stream.map(
        (text) {
          password2 = text;
          buttonSubject.add(true);
        },
      );
  Stream<bool> get buttonValidation => buttonSubject.stream.map(
        (text) {
          return (password1 == password2 && password1.length >= 3);
        },
      );

  createUser() async {
    await usersRef.add({
      'course': client.item.course,
      'email': client.item.email.toLowerCase(),
      'firstname': client.item.firstName,
      'lastname': client.item.lastName,
      'password': password1
    });
    nextSubject.add(true);
  }

  dispose() {
    password1Subject.close();
    password2Subject.close();
    buttonSubject.close();

    nextSubject.close();
  }
}
