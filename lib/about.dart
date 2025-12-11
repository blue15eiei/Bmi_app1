import 'package:flutter/material.dart';

// Method หลักที่ Run
void main() {
  runApp(const MyApp());
}

// Class StatelessWidget สั่งแสดงผลหน้าจอหลัก
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI APPLICATION',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(239, 245, 188, 2)),
        useMaterial3: true,
      ),
      home: const About(title: 'BMI APPLICATION'),
    );
  }
}

// Class Stateful สำหรับหน้าหลัก
class About extends StatefulWidget {
  const About({super.key, required this.title});
  final String title;

  @override
  State<About> createState() => _AboutState();
}

// Class State สำหรับรับค่าจากหน้าจอมาคำนวณและแสดงผล
class _AboutState extends State<About> {
  void _initialState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About application"),
        backgroundColor: const Color.fromARGB(121, 0, 255, 234),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/mybg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: 400,
                      height: 200,
                      child: Image.asset('assets/Logo.png'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "เกี่ยวกับเรา",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "แอปสุขภาพ BMI (Body Mass Index) คือเครื่องมือที่ช่วยคำนวณดัชนีมวลกายจากน้ำหนักและส่วนสูง เพื่อประเมินว่าอยู่ในเกณฑ์สุขภาพที่เหมาะสมหรือไม่ "
                    "แอปใช้งานง่าย แสดงผลชัดเจน พร้อมข้อมูลเสริมเกี่ยวกับระดับ BMI และคำแนะนำเบื้องต้นในการดูแลสุขภาพตามผลลัพธ์ที่ได้ "
                    "ไม่ว่าคุณจะเพิ่งเริ่มดูแลตัวเองหรืออยู่ระหว่างควบคุมน้ำหนัก แอปนี้จะช่วยให้คุณเข้าใจสุขภาพของตนเองได้ดียิ่งขึ้น",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "ผู้สร้าง: นายบุรพา สุวรรณเพ็ชร์",
                    style: TextStyle(fontSize: 14),
                  ),
                  const Text(
                    "ติดต่อ: buraphaaa123@gmail.com",
                    style: TextStyle(fontSize: 14),
                  ),
                  const Text(
                    "ที่อยู่:  หมูบ้านพฤกษา13 อำเภอคลองหลวง ตำบลคลองสาม ปทุมธานี 12000",
                    style: TextStyle(fontSize: 14),
                  ),
                  const Text(
                    "เบอร์โทร: 093-0527770",
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
