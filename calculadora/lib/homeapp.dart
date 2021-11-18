import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  String output = "0";

  String _out = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPresse(String btnVal) {
    print(btnVal);

    if (btnVal == "C") {
      _out = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (btnVal == "+" ||
        btnVal == "-" ||
        btnVal == "*" ||
        btnVal == "/") {
      num1 = double.parse(output);
      operand = btnVal;
      _out = "0";
      output = output + btnVal;
    } else if (btnVal == ".") {
      if (_out.contains(".")) {
        print("Já exixte");
        return;
      } else {
        _out = _out + btnVal;
      }
    } else if (btnVal == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _out = (num2 + num1).toString();
      }

      if (operand == "-") {
        _out = (num2 - num1).toString();
      }

      if (operand == "*") {
        _out = (num2 * num1).toString();
      }

      if (operand == "/") {
        _out = (num2 / num1).toString();
      }

      num1 = 0.0;
      num2 = 0.0;

    } else {
      _out = _out + btnVal;
    }

    //Metodo para atializacao
    setState(() {
      output = double.parse(_out).toStringAsFixed(2); //14,5 = 14.50
    });
  }


Widget buildButton(String ByuttonVal){
  return Expanded(
    child: Container(
      padding:  EdgeInsets.all(0),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade500,
          offset: Offset(2.0,2.0),
          blurRadius: 8.0,
          spreadRadius: 1.0)
        ]
       ),
       child: MaterialButton(
         padding: EdgeInsets.all(30.0),
         child: Text(ByuttonVal, style: TextStyle(fontSize: 22),),
         onPressed: () => buttonPresse(ByuttonVal),
       ),
    )
    );

}




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
              alignment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 50.0),
          child:  Text(
            output,
            style: TextStyle(fontSize: 60.0),
           ),
         ),
         Expanded(
           child: Divider(),
           ),
           Column(
             children: <Widget>[
               Row(
                 children: <Widget>[
                buildButton("C"),
               buildButton("."),
               buildButton("<-"),
               buildButton("*")
                 ]
               ),
           Row(
             children: <Widget>[
               buildButton("7"),
               buildButton("8"),
               buildButton("9"),
               buildButton("/")
             ],
           ),
           Row(
             children: <Widget>[
               buildButton("4"),
               buildButton("5"),
               buildButton("6"),
               buildButton("+")
             ],
           ),
            Row(
             children: <Widget>[
               buildButton("1"),
               buildButton("2"),
               buildButton("3"),
               buildButton("-")
             ],
           ),
            Row(
             children: <Widget>[
               buildButton("0"),
               buildButton("="),
             ],
           ),
       ],
      ),
     
            ])
     )
    ));
  }
}
