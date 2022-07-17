import 'package:bmi/constants/constants.dart';
import 'package:bmi/views/bmi_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BmiDataScreen extends StatefulWidget {
  BmiDataScreen({Key? key, }) : super(key: key);
  
  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height=100;  
  int weight=45;
  int age=17;
  String? gender;
  double calculateBMI(){
      double heightInMeter = height / 100;
      final h = (heightInMeter * heightInMeter);
      final bmi = weight / h;
      return bmi;
  }
 
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    return  Scaffold(
        backgroundColor:Color(0xff2a454b),
        appBar: AppBar(
          title:Text('BMI Calculator'),
          ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children:[
                  Expanded(
                    child:  GestureDetector(
                      onTap:(){
                        gender = "female";
                        setState(() {
                          print(gender);
                        });
                      },
                      child: BmiCard(
                        borderColor: (gender == "female") ? Colors.white: Colors.transparent,
                        child:GenderIconText(
                          icon:Icons.female,
                          title: "Female",
                        )),
                    )
                  ),
                   Expanded(
                    child: GestureDetector(
                      onTap:(){
                        gender = "male";
                        setState(() {
                          print(gender);
                        });
                      },
                      child: BmiCard(
                        borderColor: (gender == "male") ? Colors.white: Colors.transparent,
                        child: GenderIconText(
                        icon:Icons.male,
                        title:"Male"
                      ),),
                    ),
                  )

                ])
              ),
              Expanded(
              child: Container(
                child:BmiCard(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Text('Height',
                      style:labelTextStyle
                      ),
                        SizedBox(height:10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("$height",
                          style:GoogleFonts.nunito(
                            fontSize:30,
                            fontWeight:FontWeight.bold,
                            color:Colors.white
                          )
                          ),
                        
                          Text('cm',
                          style:labelTextStyle
                          ),
                        ],  
                      ),
                      Slider(
                        value: height.toDouble(),
                        min: 80,
                        max: 200,
                        thumbColor: Colors.white,
                        activeColor: Color(0xffff5282),
                       onChanged: (value){
                        height=value.toInt();
                        setState(() {
                          
                        });
                      })
                    ]
                  ) ,)
              )
              ),
              Expanded(
              child: Container(
                child: Row(
                  children:[
                    Expanded(child: BmiCard(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Text('Weight',style:labelTextStyle),
                          SizedBox(height:15),
                          Text('$weight',style:numberStyle),
                          SizedBox(height:15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              RawMaterialButton(
                                onPressed: (){
                                  weight -= 1;
                                  setState(() {
                                    
                                  });
                                },
                                elevation: 0,
                                child:Icon(Icons.remove,color:Colors.white),
                                shape:CircleBorder(),
                                fillColor: Color(0xffff5282),
                                constraints:  BoxConstraints.tightFor(
                                  width:35,
                                  height:35
                                )
                              ),
                               RawMaterialButton(
                                onPressed: (){
                                  weight += 1; //
                                  setState(() {
                                    
                                  });
                                },
                                elevation: 0,
                                child:Icon(Icons.add,color:Colors.white),
                                shape:CircleBorder(),
                                fillColor: Color(0xffff5282),
                                constraints: BoxConstraints.tightFor(
                                  width:35,
                                  height:35
                                ),
                              ),
                              
                            ]
                          )
                        ]
                      )
                    )),
                    Expanded(child: 
                     BmiCard(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Text('Age',style:labelTextStyle),
                          SizedBox(height:15),
                          Text('$age',style:numberStyle),
                          SizedBox(height:15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              RawMaterialButton(
                                onPressed: (){
                                  age -= 1;
                                  setState(() {
                                    
                                  });
                                },
                                elevation: 0,
                                child:Icon(Icons.remove,color:Colors.white),
                                shape:CircleBorder(),
                                fillColor: Color(0xffff5282),
                                constraints:  BoxConstraints.tightFor(
                                  width:35,
                                  height:35
                                )
                              ),
                               RawMaterialButton(
                                onPressed: (){
                                  age += 1;
                                  setState(() {
                                    
                                  });
                                },
                                elevation: 0,
                                child:Icon(Icons.add,color:Colors.white),
                                shape:CircleBorder(),
                                fillColor: Color(0xffff5282),
                                constraints: BoxConstraints.tightFor(
                                  width:35,
                                  height:35
                                ),
                              ),
                              
                            ]
                          )
                        ]
                      )
                    )
                    )
                  ]
                ),
              )
              ),
              GestureDetector(
                onTap: (){
                  print(calculateBMI());
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BmiResultScreen(bmi: calculateBMI())));
                },
                child: Container(
                  height: currentHeight*0.1,
                  width: currentWidth*1,
                 
                  color:Color(0xfff13c77),
                  child:Center(child: Text('Hitung BMI',style: labelTextStyle,))
                ),
              )
              
          ]
        ),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
     this.child,  this.borderColor = Colors.white,
  }) : super(key: key);

  final Widget? child;
   final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    return Container(
       decoration: BoxDecoration(
        color:Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color:borderColor!)
      ),
      margin: EdgeInsets.all(currentHeight*0.025),
      child: child
    );
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key, required this.title, required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        Icon(
        icon, 
        color: Colors.white, 
        size:currentHeight*0.1,
        ),
        SizedBox(height: currentHeight*0.025,),
        Text(
          title,
         style:labelTextStyle
        )
      ]
    );
  }
}