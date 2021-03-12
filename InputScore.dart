import 'package:flutter/material.dart';



//첫페이지
class InputScore extends StatefulWidget {
  @override
  _InputScoreState createState() => _InputScoreState();
}

class _InputScoreState extends State<InputScore> {
  final _formKey = GlobalKey<FormState>();

  //값을 가져오는 컨트롤러 인스턴스
  final _testController = TextEditingController();
  final _scoreController = TextEditingController();
  final _gradeController = TextEditingController();



  @override
  //화면 종료할 때 인스턴스 해제
  void dispose(){
    _testController.dispose();
    _scoreController.dispose();
    _gradeController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('성적입력'),),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[

              //모의고사 입력
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '모의고사 이름', //score
                ),
                controller: _testController, //컨트롤러와 text form 연결
                keyboardType: TextInputType.text,
                validator: (value){
                  if(value.trim().isEmpty){
                    return '키를 입력하세요';
                  }
                  return null; //눌 반환하면 에러X
                },
              ),
              SizedBox(
                height: 16,
              ),

              //점수입력
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '점수', //score
                ),
                controller: _scoreController, //컨트롤러와 text form 연결
                keyboardType: TextInputType.number,
                validator: (value){
                  if(value.trim().isEmpty){
                    return '키를 입력하세요';
                  }
                  return null; //눌 반환하면 에러X
                },
              ),
              SizedBox(
                height: 16,
              ),

              //등급입력
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '등급', //grade
                ),
                controller: _gradeController,
                keyboardType: TextInputType.number,
                validator: (value){
                  if(value.trim().isEmpty){
                    return '등급을 입력하세요';
                  }
                  return null; //눌 반환하면 에러X
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                alignment: Alignment.centerRight,
                child: ElevatedButton(onPressed: (){
                  //폼에 입력된 값 검증
                    //if(_formKey.currentState.validate()){ //검증시 처리 ScoreResult 페이지로 이동
                      //Navigator.push(context, MaterialPageRoute(
                        //builder: (context) => ScoreResult(double.parse(_scoreController.text.trim()), double.parse(_gradeController.text.trim()),),
                      //),);
                    //}

                        },
                  child: Text('입력'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



//입력 받은 데이터 값
class Memo {
  final String test;
  final int score;
  final int grade;
  final String saveTime;


  Memo({this.test, this.score, this.grade, this.saveTime});

  Map<String, dynamic> toMap(){
    return {
      'test': test,
      'score': score,
      'grade': grade,
      'saveTime': saveTime,
    };
  }

  //각 메모 정보를 보기 쉽도록 print(toString)
  @override
  String toString(){
    return 'Memo{test: $test, score: $score, grade: $grade}';
  }
}



//두번째페이지(입력 후)
class ScoreResult extends StatelessWidget {
  final double score;
  final double grade;

  ScoreResult(this.score, this.grade); //키를 받는 생성자

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('내 성적'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        //텍스트 필드의 controller 항목에 TextEditingController 인스턴스 연결


        child: Container(
          child: Text('.'),

        ),
      )

      //성적 받아오기

    );
  }
}

