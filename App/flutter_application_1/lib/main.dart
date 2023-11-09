import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/map.dart';
import 'package:flutter_application_1/pages/map.dart';
import 'package:flutter_application_1/pages/order.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 116, 123)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //       backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      //   title: Text(widget.title),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   '하루만',
            //   style: TextStyle(fontSize: 60),
            // ),
            Image.asset(
              '../assets/logo.png',
              width: 100 ,
              height: 100,
            ),
           ElevatedButton(
  onPressed: () {
    // 버튼 클릭 시 다음 페이지로 이동
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MapPage(
          title: 'ss',
        ),
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    minimumSize: Size(200, 50), // 버튼의 최소 크기를 조정
  ),
  child: Text('예약하기'),
),
Container(height: 20,),
ElevatedButton(
  onPressed: () {
    // 버튼 클릭 시 다음 페이지로 이동
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OrderPage(
          title: 'ss',
        ),
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    minimumSize: Size(200, 50), // 버튼의 최소 크기를 조정
  ),
  child: Text('주문하기'),
)

          ],
        ),
      ),
    );
  }
}
