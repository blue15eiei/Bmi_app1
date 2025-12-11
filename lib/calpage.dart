import 'package:flutter/material.dart';

//Method หลักทีRun
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
            ColorScheme.fromSeed(seedColor: Color.fromARGB(238, 44, 137, 190)),
        useMaterial3: true,
      ),
      home: const calpage (title: 'BMI APPLICATION'),
    );
  }
}

//Class stateful เรียกใช้การท างานแบบโต้ตอบ (เรียกใช้ State)
class calpage extends StatefulWidget {
  const calpage({super.key, required this.title});
  final String title;
  @override
  State<calpage> createState() => _MyHomePageState();
}

//class state เขียน Code ภาษา dart เพอื่ รับค่าจากหน้าจอมาคา นวณและส่งคา่ กลับไปแสดงผล
class _MyHomePageState extends State<calpage> {
  //ประกาศตัวแปร สร้างฟังก์ชั่น
  //ประกาศตัวแปร checkbox 2 ค่า
  Map<String, Map<String, dynamic>> values2 = {
'ราดหน้า': {'cal': 120, 'selected': false},
'ขา้วมนัไก่': {'cal': 150, 'selected': false},
'ข้าวขาหมู': {'cal': 180, 'selected': false},
'หมูกรอบ': {'cal': 200, 'selected': false},
'กะเต๋ว': {'cal': 150, 'selected': false},
};
//ประกาศตัวแปร
List<Map<String, dynamic>> extractedValues =[];
String selectedText = "";
//เริ่มการจากการฟังก์ชันกำหนดค่าเริ่มต้นเพื่อนำจาก Map ไปแสดงผลที่ Checkbox ใน ฟังก์ชัน initState
 @override
 void initState() {
 super.initState();
 extractedValues = extractValues(values2);
 }
//ฟังก์ชัน extractValues จะทำหน้าที่ดึงค่าจาก Map และคืนค่า List ของ Map ที่ประกอบด้วยname, price, และ selected.
 List<Map<String, dynamic>> extractValues(Map<String, Map<String, dynamic>> values2) {
 List<Map<String, dynamic>> result = [];
 values2.forEach((key, value) {
 result.add({
 'name': key,
 'cal': value['cal'], //ใช้ตัวแปรให้ตรงกับที่ตั้งไว้
 'selected': value['selected'],
 });
 });
 return result;
 }
 int totalcal=0;
String showtotalcal='';

 //ฟังกชัน updateSelectedText ฟังก์ชัน: ฟังก์ชันนี้จะอัปเดตข้อความ Text เมื่อกด Checkbox และแสดงชื่อกับราคาใน Text.
void updateSelectedText(String name, int cal) {
List<String> selectedItems = [];
int test = 0;
 totalcal = 0; // Reset total calories
extractedValues.forEach((item) {
if (item['selected']) {
selectedItems.add('อาหารที่ทานคือ : ${item['name']}, ปริมาณแคลลอรี่: ${item['cal']}');
 test = item['cal'];
 totalcal += test;
}
});
setState(() {
selectedText = selectedItems.join('\n');
showtotalcal = 'ปริมาณแคลอรีทั้งหมดที่ท่านรับประทานคือ $totalcal';
});
}

  static const TextStyle mainTextStyle1 = 
  TextStyle(color: Color.fromARGB(255, 44, 134, 207), fontSize: 20);
  static const TextStyle mainTextStyle2 = 
  TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18);
  static const TextStyle mainTextStyle3 = 
  TextStyle(color: Color.fromARGB(255, 143, 12, 250), fontSize: 20);
  //ประกาศตัวแปร checkbox ค่าเดียว
  Map<String, bool> values = {
'ดูหนัง': false,
'ฟังเพลง': false,
'เล่นเกม': false,
'ทำอาหาร': false,
'นอน': false,
};
 // สร้างฟังก์ชัน_getSelectedOptions เพื่อสร้างรายการของตัวเลือกที่ถูกเลือก
 String _getSelectedOptions() {
 List<String> selectedOptions = [];
 values.forEach((key, value) {
 if (value) {
 selectedOptions.add(key);
 }
 });
 if (selectedOptions.isEmpty) {
return '';
}
else {
return 'งานอดิเรกของคุณคือ: ${selectedOptions.join(', ')}';
}
 }
  void _intialstate() {
    setState(() {});
  }
  

  @override
//ส่วนออกแบบหน้าจอ
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calaries applicaton"),
        backgroundColor: Color.fromARGB(255, 54, 151, 216),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/mybg.jpg",
                ), // พาธของภาพที่อยู่ในโฟลเดอร์ assets
                fit: BoxFit.cover, // ปรับขนาดภาพให้เต็มพื้นที่
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(padding: const EdgeInsets.all(70.0),
             //วาดหน้าจอตามต้องการ
            child: Column(children:[
              Center(
                    child:SizedBox(
                       width: 400,
                       height: 200,
                       child: Image.asset('assets/Logo.png'), //Widgetใส่รูป
                     ),
                  ),
              Center(child: Text("โปรแกรมคำนวนแคลลอรี่",style: mainTextStyle1,)),
              SizedBox (height:10,),
              //CheckBok 1 ค่า             
  
 Card(elevation: 6,shadowColor: Colors.grey.withOpacity(0.3),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child:Padding(padding: const EdgeInsets.all(40.0),
                  child:Column(

//ดึงค่า value จาก Map มาแสดงที่ checkbox
                    children: values.keys.map((String key) {
                      return CheckboxListTile(
                        title: Text(key,style: mainTextStyle2,),
                        value: values[key],
                        onChanged: (bool? value) {
                          setState(() {
                            values[key] = value!;
                          });
                        },
                      );
                    }).toList(),
                  ),
                  ),
                  ),
                SizedBox (height:10,),
                Text(_getSelectedOptions(),style: mainTextStyle2,),
                //checkbox 2


Card(elevation: 6,shadowColor: Colors.grey.withOpacity(0.3),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child:Padding(padding: const EdgeInsets.all(40.0),
                  child:Column(
              children: extractedValues.map((item) {
                return CheckboxListTile(
                  title: Text(item['name']),
                  subtitle: Text('แคลอรี: ${item['cal']}'),
                  value: item['selected'],
                  onChanged: (bool? value) {
                    setState(() {
                      item['selected'] = value!;
                      updateSelectedText(item['name'], item['cal']);
                    });
                  },
                );
              }).toList(),
            ),
                  ),
                  ),
                Text(selectedText),
                Text(showtotalcal),



           ]),
            
            ),
          ),
        ],
      ),
    );
  }
  
  
}



