import 'package:flutter/material.dart';
import 'package:shader_playground/simplicity_shader/simplicity_shader.dart';
import 'package:shader_playground/space_shader/space_shader.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showFirstPage = true;

  void setShowFirstPage() {
    setState(() {
      showFirstPage = !showFirstPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        onDoubleTap: setShowFirstPage,
        child: SizedBox.expand(
          child: AnimatedCrossFade(
            firstChild: SimplicityShaderPage(),
            secondChild: SpaceShaderPage(),
            crossFadeState: showFirstPage ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 500),
          ),
        ),
      ),
    );
  }
}
