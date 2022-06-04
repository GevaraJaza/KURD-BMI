import 'dart:math';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';
import 'package:bmiapp/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UnityAds.init(gameId: '4772262');
    UnityAds.init(gameId: '4772263');
  }
  bool ismale = true;
  double height = 170;
  int age = 22;
  int weight = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BODY MASS INDEX"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            //expanded one
            Expanded(
              child: Row(children: [
                m1Expanded(context, "male"),
                SizedBox(
                  width: 15,
                ),
                m1Expanded(context, "female"),
              ]),
            ),

            SizedBox(
              height: 10,
            ),
            //height slider
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blueGrey),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("بەرزی باڵا",style: Theme.of(context).textTheme.headline2,),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(height.toStringAsFixed(1),style: Theme.of(context).textTheme.headline1,),
                    Text(" CM ",style: Theme.of(context).textTheme.bodyText1,),
                  ],
                ),
                Slider(
                  min: 50.0,
                  max: 250.0,
                  value: height, onChanged: (newval){
                  setState(() {
                    height = newval;
                  });
                })
              ]),
            )),
            SizedBox(
              height: 10,
            ),

            //expanded tqo
            Expanded(
              child: Row(children: [
                m2Expanded(context, "weight"),
                SizedBox(
                  width: 15,
                ),
                m2Expanded(context, "age"),
              ]),
            ),
            SizedBox(
              height: 10,
            ),
            //calculate button
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.teal),
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 12,
              child: TextButton(
                  onPressed: () {
                    UnityAds.showVideoAd(placementId: 'Rewarded_Android');
                    UnityAds.showVideoAd(placementId: 'Rewarded_iOS');
                    var res = weight / pow(height / 100, 2);
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return Result(Gender: ismale, age: age, result: res);
                    }));
                  },
                  child: Text(
                    "بینینی ئەنجام",
                    style: Theme.of(context).textTheme.headline2,
                  )),
            )
          ],
        ),
      )),
    );
  }

//expanded one
  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        setState(() {
          ismale = (type == 'male') ? true : false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: (ismale && type == 'male') || (!ismale && type == 'female')
                ? Colors.teal
                : Colors.blueGrey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              type == 'male' ? Icons.male : Icons.female,
              size: 90,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              type == 'male' ? 'نێر' : 'مێ',
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
      ),
    ));
  }

  //expanded two
  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.blueGrey),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            type == 'age' ? 'تەمەن' : 'کێش',
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(
            type == 'age' ? '$age' : '$weight',
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                heroTag: type == 'age' ? 'age--' : 'weight--',
                onPressed: () =>
                    setState(() => type == 'age' ? age++ : weight++),
                child: Icon(Icons.add),
                mini: true,
              ),
              SizedBox(
                width: 8,
              ),
              FloatingActionButton(
                heroTag: type == 'age' ? 'age++' : 'weight++',
                onPressed: () =>
                    setState(() => type == 'age' ? age-- : weight--),
                child: Icon(Icons.remove),
                mini: true,
              )
            ],
          )
        ],
      ),
    ));
  }
}
