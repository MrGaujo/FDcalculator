import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(home: Homepage(), debugShowCheckedModeBanner: false));
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _controller1 = new TextEditingController();
  final TextEditingController _controller2 = new TextEditingController();
  final TextEditingController _controller3 = new TextEditingController();
  double interest;
  double total;
  _HomepageState() : interest = 0.0, total = 0.0;

  void calculation() {
    final calinterestrate = double.parse(_controller2.text);
    100 / 12 * int.parse(_controller3.text);
    final calinterest = calinterestrate * int.parse(_controller1.text);

    setState(() {
      interest = calinterest;
      total = int.parse(_controller1.text) + interest;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.note, size: 30, color: Colors.white),
        toolbarHeight: 30,
        backgroundColor: Colors.blue,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(Icons.info, size: 30, color: Colors.white),
          ),
        ],
      ),
      body: body(),
    );
  }

  Widget body() {
    return Container(
      color: Colors.grey[100],
      child: Column(
        children: [
          Container(
            height: 170,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(150)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Fixed Deposit",
                      style:
                          GoogleFonts.roboto(fontSize: 35, color: Colors.white),
                    ),
                    Text("Calculator",
                        style: GoogleFonts.roboto(
                            fontSize: 35, color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 40, 0),
            child: Column(
              children: [
                inputForm(
                    title: "Deposite Amount:",
                    controller: _controller1,
                    hintText: "Rs 3000"),
                inputForm(
                    title: "Interest Rate:",
                    controller: _controller2,
                    hintText: "5%"),
                inputForm(
                    title: "Duration: ",
                    controller: _controller3,
                    hintText: "5.5%"),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    calculation();
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25)),
                    child: Center(
                      child: Text("CALCULATE",
                          style: GoogleFonts.robotoMono(
                              fontSize: 25, color: Colors.white)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(children: [
                  Text("Result: ", style: GoogleFonts.robotoMono(fontSize: 20)),
                  SizedBox(height: 20),
                  Center(
                    child: Text("Interest:RM " + interest.toStringAsFixed(2),
                        style: GoogleFonts.robotoMono(fontSize: 20)),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text("Total: RM" + total.toStringAsFixed(2),
                        style: GoogleFonts.robotoMono(fontSize: 20)),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child:
                        Text(": ", style: GoogleFonts.robotoMono(fontSize: 20)),
                  ),
                ])
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget inputForm(
      {required String title,
      required TextEditingController controller,
      required String hintText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: GoogleFonts.roboto(
              fontSize: 20,
            )),
        SizedBox(height: 5),
        Container(
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintText: hintText,
              )),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
