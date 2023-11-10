import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/map.dart';
import 'package:flutter_application_1/pages/map.dart';
import 'package:flutter_application_1/pages/order_grocery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 166, 155)),
        useMaterial3: true,
      ),
      home: const OrderPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class OrderPage extends StatelessWidget {
  final String title;

  const OrderPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: GridView.count(
        crossAxisCount: 1, // 열 수
        childAspectRatio: 3.0, // 높이를 조절하려면 이 값을 조정 (더 작은 값으로 변경하면 높이가 줄어듭니다.)
        children: [
          MyButton('식품', () {
            // "식품 주문" 버튼을 누를 때 실행할 동작을 여기에 추가
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OrderGroPage(
                  title: '식품 주문하기',
                ),
              ),
            );
          }),
         
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;

  MyButton(this.buttonText, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 166, 155),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}

class OrderGroceryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('식품'),
      ),
      body: Center(
        child: Text('여기에 식품 주문 화면을 만들 수 있습니다.'),
      ),
    );
  }
}
