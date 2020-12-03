import 'package:flutterproject/bloc/firebase_controller.dart';
import 'package:flutterproject/client/home_client.dart';
import 'package:rxdart/subjects.dart';

class LoginBloc {
  final usernameSubject = BehaviorSubject<String>();
  final passwordSubject = BehaviorSubject<String>();
  final loginButtonSubject = BehaviorSubject<bool>();

  final successSubject = BehaviorSubject<bool>();
  final errorSubject = PublishSubject<String>();

  String usernameString = '', passwordString = '';

  checkCredentials() async {
    final snapshot = await usersRef.get();
    bool flag = false;

    for (var element in snapshot.docs) {
      if (element.data()['email'] == usernameString.toLowerCase() &&
          element.data()['password'] == passwordString) {
        successSubject.add(true);
        HomeClient().allLessons = [];
        HomeClient().getAllLessons();
        HomeClient().allEvents = [];
        HomeClient().getAllEvents();
        flag = true;
        break;
      }
    }
    if (flag == false) errorSubject.add('not a match');
  }

  Stream<void> get usernameStream => usernameSubject.stream.map((text) {
        usernameString = text;
        loginButtonSubject.add(true);
      });

  Stream<void> get passwordStream => passwordSubject.stream.map((text) {
        passwordString = text;
        loginButtonSubject.add(true);
      });

  Stream<bool> get loginButtonStream => loginButtonSubject.stream.map(
        (flag) {
          return (usernameString.length >= 3 && passwordString.length >= 3);
        },
      );

  dispose() {
    successSubject.close();
    errorSubject.close();

    usernameSubject.close();
    passwordSubject.close();
    loginButtonSubject.close();
  }
}
