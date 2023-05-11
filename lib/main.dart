import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI Calculator",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: BmiCalc(),
    );
  }
}

class BmiCalc extends StatefulWidget {
  const BmiCalc({Key? key}) : super(key: key);

  @override
  State<BmiCalc> createState() => _BmiCalcState();
}

class _BmiCalcState extends State<BmiCalc> {

  final heightController=TextEditingController();
  final weightController=TextEditingController();

  final _formkey = GlobalKey<FormState>();
  String result="";
  _calculateBMI(double height,double weight)
  {
    height=height/100;
    double bmi=weight/(height*height);

    setState(() {
      result="Your BMI is ${bmi.toStringAsFixed(3)}\n\n";
      if (bmi < 18.5) {
        result += 'You are underweight.';
      } else if (bmi >= 18.5 && bmi <= 24.9) {
        result += 'You have a normal weight.';
      } else if (bmi >= 25.0 && bmi <= 29.9) {
        result += 'You are overweight.';
      } else {
        result += 'You are obese.';
      }

    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bmi Calculator'),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(

                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "Please Enter Height : ",
                  labelText: "Enter Your Height (In CMs)"

                ),
                controller: heightController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "Please Enter Weight : ",
                labelText: "Enter Your weight (In kilograms)"

                ),
                controller: weightController,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                _calculateBMI(double.parse(heightController.text),double.parse(weightController.text));
              }, child: Text("Submit")),
            ),

            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  result,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black,
                  fontSize: 25
                  ),
                ),
            ),


          ],
        ),
      ),
    );
  }


}
