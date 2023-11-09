import 'package:flutter/material.dart';
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
      appBar: AppBar(title: Text('WebView With In App WebView')),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse('https://youtube.com'),
        ),
        initialOptions: InAppWebViewGroupOptions(
            android: AndroidInAppWebViewOptions(useHybridComposition: true)),
      ),
    );
    // return Scaffold(
    //   // appBar: AppBar(
    //   //       backgroundColor: Theme.of(context).colorScheme.inversePrimary,

    //   //   title: Text(widget.title),
    //   // ),
    //   body:  Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
          
    //        Text('지도페이지')
    //       ],
    //     ),
    //   ),
    // );
  }
}
