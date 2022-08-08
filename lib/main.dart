import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Tic Tac toe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String currentPlay = 'X';
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: GridView.count(
          padding: const EdgeInsets.all(18),
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: List.generate(9, (index) {
            return InkWell(
              onTap: () {},
              child: Container(
                height: 100,
                width: 100,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    currentPlay,
                    style: TextStyle(
                        fontSize: 24,
                        color:
                            currentPlay == 'X' ? Colors.white : Colors.black),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
