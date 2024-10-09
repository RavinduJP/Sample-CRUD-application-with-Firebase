import 'package:firebase_app_installations/firebase_app_installations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_crud/routes/route_generator.dart';
import 'package:sample_crud/screens/welcome_screen.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _installationId = 'Fetching...';

  @override
  void initState() {
    super.initState();
    _getFirebaseInstallationId();
  }

  Future<void> _getFirebaseInstallationId() async {
    try {
      String fid = await FirebaseInstallations.instance.getId();
      setState(() {
        _installationId = fid;
      });
      print("Firebase Installation ID: $fid"); // You can use this for testing
    } catch (e) {
      print("Error retrieving Firebase Installation ID: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411.4, 707.4),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: RouteGenerator.generateRoute,
        home: const WelcomeScreen(),
      ),
    );
  }
}

