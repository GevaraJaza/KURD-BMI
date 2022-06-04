import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Result extends StatelessWidget {
  const Result(
      {Key? key, required this.Gender, required this.age, required this.result})
      : super(key: key);

  final bool Gender;
  final int age;
  final double result;

  String get hresult {
    String fresult = "";
    if(result >=30) fresult = "قەڵەوی پلە یەک";
    else if(result >=25 && result <=29.9) fresult = 'قەڵەو';
    else if(result >=18 && result <=24.9) fresult = "ئاسایی";
    else if(result <18) fresult = "لاواز";
    return fresult;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "ئەنجام",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("رەگەز : ${Gender ? 'نێر' : 'مێ'}",style: Theme.of(context).textTheme.headline2,),
              Text("ئەنجام : ${result.toStringAsFixed(2)}",style: Theme.of(context).textTheme.headline2,),
              Text("تەندروستی : $hresult",style: Theme.of(context).textTheme.headline2,textAlign: TextAlign.center,),
              Text("تەمەن : $age",style: Theme.of(context).textTheme.headline2,)
            ],
          ),
        ),
      ),
    );
  }
}
