import 'package:flutter/material.dart';
import 'package:sample_crud/utils/constants/routes.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, required this.image, this.child});

  final String image;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).popAndPushNamed(Routes.welcomScreen);
          },
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            width: double.maxFinite,
            height: double.maxFinite,
          ),
          SafeArea(child: child!),
        ],
      ),
    );
  }
}
