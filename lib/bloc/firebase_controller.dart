import 'package:cloud_firestore/cloud_firestore.dart';

final usersRef = FirebaseFirestore.instance.collection('users');
final lessonsRef = FirebaseFirestore.instance.collection('lessons');
final eventRef = FirebaseFirestore.instance.collection('events');
