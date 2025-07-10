import 'package:bmi_app/components/reusableCard.dart';
import 'package:flutter/material.dart';

import 'Result.dart';

enum Gender {male, female}
double height = 130;
int weight = 55;
int age = 22;

class Inputpage extends StatefulWidget {
  const Inputpage({super.key});

  @override
  State<Inputpage> createState() => _InputpageState();
}

class _InputpageState extends State<Inputpage> {
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'User Information',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Reusablecard(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      color: selectedGender == Gender.male ? Colors.deepPurple : Colors.grey[300],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.man_rounded, size: 80),
                          Text('Male', style: TextStyle(
                            fontSize: 18,
                          )
                          )
                        ],
                      ),
                    )
                ),
                Expanded(
                    child: Reusablecard(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      color: selectedGender == Gender.female ? Colors.deepPurple : Color(0xFFEEEEEE),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.woman, size: 80),
                          Text('Female', style: TextStyle(
                            fontSize: 18,
                          )
                          )
                        ],
                      ),
                    )
                )
              ],
            ),
          ),
          Expanded(
              child:Reusablecard(
                color: Colors.grey[300],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Height', style: TextStyle(fontSize: 16),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toStringAsFixed(0),style: TextStyle(fontSize: 30),),
                        Text(' cm'),
                      ],
                    ),
                    Slider(
                        value:height,
                        min: 100,
                        max: 220,
                        onChanged: (newHeight){
                          setState(() {
                            height = newHeight;
                          });
                        }
                    )
                  ],
                ),
              )
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Reusablecard(
                      color: Colors.grey[300],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Weight'),
                          Text('$weight', style: TextStyle(fontSize: 30),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  icon:Icon(Icons.remove)
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  icon:Icon(Icons.add)
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                ),
                Expanded(
                    child: Reusablecard(
                      color: Colors.grey[300],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Age'),
                          Text('$age', style: TextStyle(fontSize: 30),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: (){
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  icon: Icon(Icons.remove),
                              ),
                              IconButton(
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: Icon(Icons.add),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        height: height,
                        weight: weight,
                        age: age,
                        gender: selectedGender,
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.arrow_forward, size: 24),
                label: Text(
                  'Calculate BMI',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
