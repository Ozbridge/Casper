import 'package:casper/utilities/auth.dart';
import 'package:casper/utilities/fake_device_pixel_ratio.dart';
import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'utilities/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Casper());
}

class Casper extends StatelessWidget {
  const Casper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Casper',
      debugShowCheckedModeBanner: false,
      home: FakeDevicePixelRatio(
        fakeDevicePixelRatio: 1,
        child: Auth(),
      ),
    );
  }
}
