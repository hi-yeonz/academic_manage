import 'package:flutter/material.dart';

class PersonalPage extends StatefulWidget {
  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

          //내 정보
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Title(
                    color: Colors.black,
                    child: Text(
                      '홍길동',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ]),
          ),
          SizedBox(
            width: 10,
          ),

          //버튼 타입
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Text Button : 구 Flat Button 대체됨.
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 8, bottom: 8),
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  onPressed: () {},
                  child: Text(
                    "O 내 성적 모아보기".toUpperCase(),
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),

              //Outlined Button : 바깥선/내부색상  설정 가능
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 8),
                child: OutlinedButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  child: Text("O 성적 입력".toUpperCase(),
                      style: TextStyle(fontSize: 18)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/InputScore');
                  },
                ),
              ),

              //Elevated Button : 구 RaisedButton 이 대체됨.
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 8),
                child: ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  child: Text("O 개인 정보 수정".toUpperCase(),
                      style: TextStyle(fontSize: 18)),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
