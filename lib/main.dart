import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller1 = new TextEditingController();
  TextEditingController _controller2 = new TextEditingController();
  TextEditingController _controller3 = new TextEditingController();
  TextEditingController _controller4 = new TextEditingController();
  double carprice = 0;
  double down = 0;
  double year = 0;
  double interest = 0;
  double finance = 0;
  double interestperyear = 0;
  double totalinterest = 0;
  double totalinterandfinance = 0;
  double paypermonth = 0;
  void calculation() {
    finance =
        (double.parse(_controller1.text) - double.parse(_controller2.text));
    interestperyear = finance * (double.parse(_controller4.text) / 100);
    totalinterest = interestperyear * (double.parse(_controller3.text));
    totalinterandfinance = finance + totalinterest;
    setState(() {
      paypermonth =
          totalinterandfinance / ((double.parse(_controller3.text)) * 12);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.notes,
          size: 30,
          color: Colors.white,
        ),
        toolbarHeight: 30,
        backgroundColor: Color.fromARGB(255, 252, 121, 208),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.info,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: body(),
    );
  }

  Widget body() {
    return Container(
      color: Colors.grey[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 170,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 122, 189),
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(100))),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Car Loan",
                    style: GoogleFonts.robotoMono(
                        fontSize: 35, color: Colors.white),
                  ),
                  Text(
                    "Haris Kusayum",
                    style: GoogleFonts.robotoMono(
                        fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 5, 40, 0),
            child: Column(
              children: [
                inputForm("ราคารถ", _controller1, "เช่น 800000"),
                inputForm("เงินดาวน์", _controller2, "เช่น 100000"),
                inputForm("จำนวนปีที่ผ่อน", _controller3, "เช่น 4"),
                inputForm("ดอกเบี้ย % ต่อปี", _controller4, "เช่น 5"),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {calculation();},
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 252, 130, 197),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "คำนวณ",
                  style:
                      GoogleFonts.robotoMono(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ดอกเบี้ยต่อปี : " + interestperyear.toStringAsFixed(2),
                style: GoogleFonts.robotoMono(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "รวมดอกเบี้ยทั้งหมด : "+ totalinterest.toStringAsFixed(2),
                style: GoogleFonts.robotoMono(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "ผ่อนเดือนละ : "+ paypermonth.toStringAsFixed(2),
                style: GoogleFonts.robotoMono(fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget inputForm(
      String title, TextEditingController controller, String hinttext) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.robotoMono(fontSize: 18),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintText: hinttext),
          ),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
