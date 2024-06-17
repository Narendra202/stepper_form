import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 160,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                      border: Border.all(
                        width: 1,
                        color: Colors.black54
                      )
                    ),

                    child: Column(
                      children: [
                         // Image.asset('images/man.png')
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: 160,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        border: Border.all(
                            width: 1,
                            color: Colors.black54
                        )
                    ),
                  ),
                ],
              ),
        
              SizedBox(height: 20,),
        
              Row(
                children: [
                  Container(
                    width: 160,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        border: Border.all(
                            width: 1,
                            color: Colors.black54
                        )
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: 160,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        border: Border.all(
                            width: 1,
                            color: Colors.black54
                        )
                    ),
                  ),
                ],
              ),
        
              SizedBox(height: 20,),
        
              Row(
                children: [
                  Container(
                    width: 160,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        border: Border.all(
                            width: 1,
                            color: Colors.black54
                        )
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: 160,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        border: Border.all(
                            width: 1,
                            color: Colors.black54
                        )
                    ),
                  ),
                ],
              ),
        
              SizedBox(height: 20,),
        
              Row(
                children: [
                  Container(
                    width: 160,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        border: Border.all(
                            width: 1,
                            color: Colors.black54
                        )
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: 160,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        border: Border.all(
                            width: 1,
                            color: Colors.black54
                        )
                    ),
                  ),
                ],
              ),
        
            ],
          ),
        ),
      )
    );
  }
}
