//SuccessPage
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

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
      
      home: const SuccessPage(title: 'Flutter Demo Home Page',),
    );
  }
}
class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.white, // 배경 색상을 흰색으로 설정
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "예약이 완료되었습니다.",
                style: TextStyle(
                  color: Colors.black, // 텍스트 색상을 빨간색으로 설정
                  
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // 버튼 클릭 시 다음 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyHomePage(
                        title: '업종 카테고리',
                      ),
                    ),
                  );
                },
                child: Text("메인 화면으로 돌아가기"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
