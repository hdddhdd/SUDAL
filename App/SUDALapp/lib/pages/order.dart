import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/order_grocery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 116, 123)),
        useMaterial3: true,
      ),
      home: const OrderPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<OrderPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1, // 열 수
      childAspectRatio: 3.0, // 높이를 조절하려면 이 값을 조정 (더 작은 값으로 변경하면 높이가 줄어듭니다.)
      children: [
        const Center(
          child: Text(
            "현재 식품 카테고리만 오픈되어 있습니다.",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
        MyButton('식품 주문'),
        // MyButton('의류 주문'),
      ],
    );
  }
}

class MyButton extends StatelessWidget {
  final String buttonText;

  MyButton(this.buttonText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.0), // 0으로 설정하여 사각형 모양으로 만듭니다.
          ),

          padding: EdgeInsets.all(30), // 여백 제거
        ),
        onPressed: () {
          // 각 버튼을 클릭할 때 수행할 작업
          if ('$buttonText' == "식품 주문"){
           
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderGroPage(
                      title: 'ss',
                    ),
                  ),
                );
             
          }
          // print('$buttonText 클릭되었습니다.');
        },
        child: Text(buttonText),
      ),
    );
  }
}
