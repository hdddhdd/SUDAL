import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/success.dart';

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
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 116, 123)),
        useMaterial3: true,
      ),
      home: const DatePickerPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class DatePickerPage extends StatefulWidget {
  final String title;

  const DatePickerPage({Key? key, required this.title}) : super(key: key);

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100), // 모든 날짜를 선택 가능하도록 설정
                );
                if (selectedDate != null) {
                  setState(() {
                    date = selectedDate;
                  });
                }
              },
              child: Text(
                "날짜 선택하기",
              ),
            ),
            Text(
                '${date.year.toString()}년 ${date.month.toString().padLeft(2, '0')}월 ${date.day.toString().padLeft(2, '0')}일이 선택되었습니다.'),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(child: Text('예약 완료하기'),  onPressed: () {
                // 버튼 클릭 시 다음 페이지로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SuccessPage(
                      title: '',
                    ),
                  ),
                );
              },),
                )
          ],
        ),
      ),
    );
  }
}
