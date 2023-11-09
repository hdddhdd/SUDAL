import 'package:flutter/material.dart';

class OrderGroPage extends StatefulWidget {
  const OrderGroPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<OrderGroPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<OrderGroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold를 추가
      appBar: AppBar( // AppBar 설정
        title: Text(widget.title), // AppBar의 타이틀 설정
      ),
      body: GridView.count(
        crossAxisCount: 2, // 열 수
        childAspectRatio: 1.5, 
        children: [
          MyButton('육류','assets/meat.jpg'),
          MyButton('밀가루','assets/wheat.jpg'),
          MyButton('버터','assets/butter.jpg'),
          MyButton('샐러드','assets/salad.jpg'),
          MyButton('설탕','assets/sugar.jpg'),
          MyButton('쌀','assets/rice.jpg'),
          MyButton('우유','assets/milk.jpg'),
          MyButton('튀김가루','assets/fry.jpg'),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String buttonText;
  final String imagePath;

  MyButton(this.buttonText, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.0), // 0으로 설정하여 사각형 모양으로 만듭니다.
              ),
            ),
            onPressed: () {
              // 각 버튼을 클릭할 때 수행할 작업
              if (buttonText == "식품 주문") {
                // 버튼에 따른 동작 수행
              }
              // print('$buttonText 클릭되었습니다.');
            },
            child: Column(
              children: [
                Image.asset(
                  imagePath,
                  width: 80, // 이미지 너비 조정
                  height: 80, // 이미지 높이 조정
                ),
                Text(
                  buttonText,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
