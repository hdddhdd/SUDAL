import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/datepicker.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 116, 123)),
        useMaterial3: true,
      ),
      home: const MapPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MapPage extends StatelessWidget {
  const MapPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text('여성의류매장')),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse('https://hdddhdd.github.io/SUDAL/index'),
            ),
            initialOptions: InAppWebViewGroupOptions(
              android: AndroidInAppWebViewOptions(useHybridComposition: true),
            ),
          ),
          Positioned(
            bottom: 30.0,
            right: 30.0,
            child: ElevatedButton(
             onPressed: () {
                // 버튼 클릭 시 다음 페이지로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DatePickerPage(
                      title: '예약할 날짜를 골라주세요.',
                    ),
                  ),
                );
              },
              child: Text('다음'),
            ),
          ),
        ],
      ),
    
    );
   
  }
}
