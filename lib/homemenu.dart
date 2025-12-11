import 'package:flutter/material.dart';
import 'bmipage.dart';
import 'about.dart';
import 'calpage.dart';
 
 
// Method หลักที่ Run
void main() {
  runApp(const MyApp());
}
 
// Class Stateless สั่งแสดงผลหน้าจอ
class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI APPLICATION',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(239, 245, 188, 2)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI APPLICATION'),
    );
  }
}
 
// Class Stateful เรียกใช้การทำงานแบบโต้ตอบ
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
 
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
 
// class State เขียน Code เพื่อรับค่าจากหน้าจอมาคำนวณและส่งค่ากลับไปแสดงผล
class _MyHomePageState extends State<MyHomePage> {
  void _intialstate() {
    setState(() {});
  }
 
  void _BMI() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => bmipage(title: 'BMI Result'),
      ),
    );
  }
 
  void _cancle() {
    print('ล้างข้อมูล');
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color.fromARGB(224, 17, 192, 245),
      ),
      body: Stack(
        children: [
          // ภาพพื้นหลัง
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/mybg.jpg"), // รูปพื้นหลัง
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(70.0),
              child: Column(
                children: [
                  // โลโก้
                  Center(
                    child: SizedBox(
                      width: 400,
                      height: 200,
                      child: Image.asset('assets/Logo.png'),
                    ),
                  ),
 
                  // ปุ่ม 1: About Application
                SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: 400,
                   height: 60,
                  child: ElevatedButton.icon(
                 onPressed: () {
                 Navigator.push(
                 context,
                MaterialPageRoute(builder: (context) => About(title: '',)),
               );
              },
               icon: Icon(Icons.info),
            label: Text('About Application'),
            style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 14, 194, 248),
            foregroundColor: Colors.white,
           textStyle: TextStyle(fontSize: 30),
             ),
            ),
          ),
        ),
 
                  // ปุ่ม 2: BMI APP
                  SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: 400,
                      height: 60,
                      child: ElevatedButton.icon(
                        onPressed: () {Navigator.push(
                 context,
                MaterialPageRoute(builder: (context) => bmipage (title: '',)),
               );
                        },
                        icon: Icon(Icons.favorite),
                        label: Text('ผลสุขภาพ'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 14, 194, 248),
                          foregroundColor: Colors.white,
                          textStyle: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                  ),
 
                  // ปุ่ม 3: Calories APP
                  SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: 400,
                      height: 60,
                      child: ElevatedButton.icon(
                        onPressed: () {Navigator.push(
                 context,
                MaterialPageRoute(builder: (context) => calpage(title: '',)),
               );
                        },
                        icon: Icon(Icons.local_fire_department),
                        label: Text('Calories APP'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 14, 194, 248),
                          foregroundColor: Colors.white,
                          textStyle: TextStyle(fontSize: 30),
                        ),
                      ),
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
 
 
 