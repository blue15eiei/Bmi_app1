import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//Class state less สั่งแสดงผลหน้าจอ
class MyApp extends StatelessWidget {
 const MyApp({super.key});
// This widget is the root of your application.
@override
Widget build(BuildContext context) {
 return MaterialApp(
   title: 'BMI APPLICATION',
   theme: ThemeData(
     colorScheme:
         ColorScheme.fromSeed(seedColor: Color.fromARGB(193, 245, 2, 2)),
     useMaterial3: true,
),
home: const bmipage(title: 'BMI APPLICATION'),
);
}
}
//Class stateful เรียกใช้การท างานแบบโต้ตอบ (เรียกใช้ State)
class bmipage extends StatefulWidget {
const bmipage({super.key, required this.title});
final String title;
@override
State<bmipage> createState() => _MyHomePageState();
}
//class state เขียน Code ภาษา dart เพอื่ รับค่าจากหน้าจอมาคา นวณและส่งคา่ กลับไปแสดงผล
class _MyHomePageState extends State<bmipage> {

double _weightD = 0.0 , _heightD =0.0, _bmI= 0.0;
String _showBMI = "" , _showResult = "" ,  _showImage = "";


 final TextEditingController _weightText = TextEditingController();
 final TextEditingController _heightText = TextEditingController();

void _BMI(){
  if(_weightText.text.isEmpty)
  {
      _showBMI = "กรุณากรอกน้ำหนัก";
  }
  else if(_heightText.text.isEmpty)
  {
      _showBMI = "กรุณากรอกส่วนสูง";
  }
  else{
  _weightD = double.parse(_weightText.text);
  _heightD = double.parse(_heightText.text)/100;
  _bmI= _weightD / (_heightD * _heightD);
  _showBMI = "ค่า BMI ของคุณคือ ${_bmI.toStringAsFixed(2)} ";
  if (_bmI < 18.5){
    _showResult = "ผอม";
    _showImage = 'assets/ผมมาก.png';
  }
  else if(_bmI <= 25.0){
    _showResult = "สมส่วน";
    _showImage = 'assets/ปกจิ.png';
  }
  else if(_bmI <= 25.0){
    _showResult = "เริ่มอ้วน";
    _showImage = 'assets/เริ่มอ้วน.png';
  }
  else if(_bmI <= 30.0){
    _showResult = "อ้วน";
    _showImage = 'assets/อ้วน.jpg';
  }
 
  else {
    _showResult = "อ้วนเกิน";
    _showImage = 'assets/อ้วนมากผิดปกต.jpg';
  }

  }
    setState(() {
      _showBMI;
    });
}

void _Cancle(){
  _weightText.clear();
  _heightText.clear();
  _showBMI = "";
  _showResult = "";
  _showImage =  "";
  setState(() {
    _showBMI;
    _showResult;
    _showImage;
  });
  
}

void _intialstate() {
  setState(() {});
}
static const TextStyle mainTextStyle = 
  TextStyle(color: Color.fromARGB(255, 18, 140, 255), fontSize: 18);
  
//ส่วนออกแบบหน้าจอ
//5151

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
title: Text('BMI Application'),
backgroundColor: const Color.fromARGB(209, 19, 180, 255), // เปลี่ยนสี AppBar
 ),
        body: Stack(
            children: [
              // เพิ่มภาพพื้นหลัง
              Container(
              decoration: BoxDecoration(
               image: DecorationImage(
                image: AssetImage("assets/mybg.jpg"), // พาธของภาพที่อยู่ในโฟลเดอร์ assets
                 fit: BoxFit.cover, // ปรับขนาดภาพให้เต็มพื้นที่
               ),
              ),
             ),
             SingleChildScrollView(child:
             Padding(
               padding: const EdgeInsets.all(70.0),
               child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child:SizedBox(
                       width: 500,
                       height: 300,
                       child: Image.asset('assets/Logo.png'), //Widgetใส่รูป
                     ),
                  ),

                        SizedBox(
                          height: 20,
                        ),

                  Column(
                    children: [
                      TextField(
                        controller: _weightText,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      ),
                      labelText: 'น้ำหนัก(กิโลกรัม)',
                      prefixIcon: Icon(Icons.fitness_center_rounded),
                     ),
                    ),

                     SizedBox(
                          height: 30,
                        ),

                      TextField(
                        controller: _heightText,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      ),
                      labelText: 'ส่วนสูง(เซนติเมตร)',
                      prefixIcon: Icon(Icons.height_rounded),
                     ),
                    ), 
                     SizedBox(
                          height: 30,
                        ),


                     SizedBox(
                          width: 80,
                        ),
                             ],            
                         ),


                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children : <Widget>[
                         ElevatedButton(
                        onPressed: _BMI,
                       style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 37, 152, 247),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      textStyle: TextStyle(fontSize: 20),
                      ),
                      child: Text('ผลสุขภาพ'),
                      ),
                       SizedBox(
                          width: 50,
                        ),


                       Center(child :  ElevatedButton(
                        onPressed: _Cancle,
                       style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 37, 152, 247),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      textStyle: TextStyle(fontSize: 20),
                      ),
                       child : Text('ยกเลิก'),
                      )
                       ),
                      ],
                      ),
                       SizedBox(height: 30),
                       Text(_showBMI , style: mainTextStyle,),
                       Text(_showResult , style: mainTextStyle,),
                        Center(
                    child:SizedBox(
                       width: 200,
                       height: 100,
                       child: _showImage.isNotEmpty
                       ?Image.asset(_showImage)
                       :SizedBox(),
                       //Widgetใส่รูป
                     ),
                  ),
              ],
           ),
           ),
             ),
            ],
          ),

        );
       
  
    
  }
}

