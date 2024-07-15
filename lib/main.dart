import 'package:flutter/material.dart';
import 'package:highlighted_search/widgets/highlighted_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _input = TextEditingController();
  final TextEditingController _highlight = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // highlighted text widget
            HiglightedText(_input.text, highlightedText: _highlight.text,),
            const SizedBox(
              height: 6,
            ),

            TextField(
              controller: _input,
              decoration: const InputDecoration(labelText: "Input"),
              onChanged: (_) {
                setState(() {});
              },
            ),

            const SizedBox(height: 24,),

            TextField(
              controller: _highlight,
              decoration: const InputDecoration(labelText: "highligt"),
              onChanged: (_) {
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
