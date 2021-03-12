import 'package:flutter/material.dart';

class QuestionsPage extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  child: Text('O 국어문법트레이닝 500제', style: TextStyle(fontSize: 20,),),
                ),
              ],
            ),
            onTap: (){
              Navigator.pushNamed(context, '/SampleQuestion');
            },
          ),
          SizedBox(height: 10,),
          GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  child: Text('O 문학 skill 어쩌고', style: TextStyle(fontSize: 20),),
                ),
              ],
            ),
            onTap: (){
              Navigator.pushNamed(context, '/SampleQuestion');
            },
          ),
          SizedBox(height: 10,),
          GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  child: Text('O 문제로 국어 고등 뚝딱', style: TextStyle(fontSize: 20),),
                ),
              ],
            ),
            onTap: (){
              Navigator.pushNamed(context, '/SampleQuestion');
            },
          ),
        ],
      ),
    );
  }
}
