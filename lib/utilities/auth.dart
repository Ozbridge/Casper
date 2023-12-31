import 'package:casper/scaffolds/admin_scaffold.dart';
import 'package:casper/scaffolds/faculty_scaffold.dart';
import 'package:casper/scaffolds/student_scaffold.dart';
import 'package:casper/views/shared/login_page.dart';
import 'package:casper/scaffolds/login_scaffold.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: must_be_immutable
class Auth extends StatelessWidget {
  Auth({
    Key? key,
  }) : super(key: key);

  var db = FirebaseFirestore.instance;
  late final String role;

  Future<String> getRole() async {
    var currentRole = '';
    await db
        .collection("users")
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then(
      (querySnapshot) {
        currentRole = querySnapshot.docs[0]['role'];
        print(currentRole);
      },
    );
    return currentRole;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return FutureBuilder(
              future: getRole(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // TODO: Add admin page

                  if (snapshot.data == 'admin') {
                    return AdminScaffold();
                  } else if (snapshot.data == 'student') {
                    return const StudentScaffold();
                  } else if (snapshot.data == 'supervisor') {
                    return const FacultyScaffold(
                      userRole: 'su',
                    );
                  } else {
                    return const FacultyScaffold(
                      userRole: 'co',
                    );
                  }
                } else {
                  return LoginScaffold(
                    scaffoldbody: Container(
                      color: const Color(0xff302c42),
                      child: const Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black),
                        ),
                      ),
                    ),
                  );
                }
              },
            );
          } else {
            return const LoginScaffold(
              scaffoldbody: LoginPage(),
            );
          }
        },
      ),
    );
  }
}
