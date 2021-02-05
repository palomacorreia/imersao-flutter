import 'package:flutter/material.dart';
import 'package:imersao_flutter/questions_screen.dart';

class ScoreScreen extends StatelessWidget {

  int result;
  int maximum;

  ScoreScreen({Key key, @required this.result, @required this.maximum }){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Image(
            image: AssetImage('lib/assets/Icon.png'),
          ),
        ),
        backgroundColor: Color(0xff374952),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 113,
                ),
                Text(
                  'VOCÊ ACERTOU:',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      '$result',
                      style: TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffDA0175)),
                    ),
                    Text(
                        '/$maximum',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff232122)),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 87,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.25),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(
                    0,
                    -1,
                  ),
                ),
              ],
            ),
            child: Center(
              child: FlatButton(
                onPressed: () {
                  Navigator.popUntil(
                    context,
                    (route)=>route.isFirst,
                  );
                },
                child: Text('Jogar Novamente',
                    style: TextStyle(
                      fontSize: 16,
                    )),
                color: Color(0xffDA0175),
                textColor: Color(0xffF7F7F7),
                padding: EdgeInsets.fromLTRB(60, 11, 60, 11),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
