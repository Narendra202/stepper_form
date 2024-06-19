import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {

  late Box databox;
  late int totelRegistration;
  var totelMale = 0;
  var totelFemale = 0;
  var totelOthers = 0;
  var greaterThen18 = 0;
  var lessThen18 = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databox = Hive.box('employee');
    totelRegistration = databox.length;

    for(int i = 0; i < databox.length; i++) {
      var male = databox.getAt(i);
      var female = databox.getAt(i);
      var other = databox.getAt(i);
      var greater18 = databox.getAt(i);
      var less18 = databox.getAt(i);


      if(male.gender.toLowerCase() == 'male'){
        totelMale++;
      }
      if(female.gender.toLowerCase() == 'female'){
        totelFemale++;
      }
      if(other.gender.toLowerCase() == 'other'){
        totelOthers++;
      }
      if(greater18.maxage > 18){
        greaterThen18++;
      }
      if(less18.maxage < 18){
        lessThen18++;
      }
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blue.shade50,
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: 160,
                    height: 170,
                    decoration: BoxDecoration(
                      color: Colors.cyan.shade50,
                      borderRadius: const BorderRadius.all(Radius.circular(3)),
                      border: Border.all(
                        width: 1,
                        color: Colors.black54
                      )
                    ),

                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Image(image: AssetImage('assets/images/application.png'),width: 80,height: 80,),
                          const SizedBox(height: 10,),
                          const Text('Total Registraion', style: TextStyle(color: Colors.cyan,fontWeight: FontWeight.w500,fontSize: 16),),
                          Text(totelRegistration.toString(), style: const TextStyle(color: Colors.cyan, fontWeight: FontWeight.w600,fontSize: 25),)
                        ],
                      ),
                    )
                    // child: Image(image: AssetImage('assets/images/man.png'),width: 50,height: 50,),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: 160,
                    height: 170,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade100,
                        borderRadius: const BorderRadius.all(Radius.circular(3)),
                        border: Border.all(
                            width: 1,
                            color: Colors.black54
                        )
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Image(image: AssetImage('assets/images/other.png'),width: 80,height: 80,),
                          const SizedBox(height: 10,),
                          const Text('Others', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w500,fontSize: 16),),
                          Text(totelOthers.toString(), style:const TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w600,fontSize: 25),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40,),
        
              Row(
                children: [
                  Container(
                    padding:const EdgeInsets.all(10),
                    width: 160,
                    height: 170,
                    decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius:const BorderRadius.all(Radius.circular(3)),
                        border: Border.all(
                            width: 1,
                            color: Colors.black54
                        )
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Image(image: AssetImage('assets/images/man.png'),width: 80,height: 80,),
                          const SizedBox(height: 10,),
                          const Text('Male', style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500,fontSize: 16)),
                          Text(totelMale.toString(), style:const TextStyle(color: Colors.red, fontWeight: FontWeight.w600,fontSize: 25),)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    padding:const EdgeInsets.all(10),
                    width: 160,
                    height: 170,
                    decoration: BoxDecoration(
                        color:Colors.deepPurple.shade50,
                        borderRadius:const BorderRadius.all(Radius.circular(3)),
                        border: Border.all(
                            width: 1,
                            color: Colors.black54
                        )
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Image(image: AssetImage('assets/images/woman.png'),width: 80,height: 80,),
                          const SizedBox(height: 10,),
                          const Text('Female', style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w500,fontSize: 16)),
                          Text(totelFemale.toString(), style:const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w600,fontSize: 25),)
                        ],
                      ),
                    ),

                  ),
                ],
              ),

              const SizedBox(height: 40,),
        
              Row(
                children: [
                  Container(
                    padding:const EdgeInsets.all(10),
                    width: 160,
                    height: 170,
                    decoration: BoxDecoration(
                        color:Colors.black12,
                        borderRadius:const BorderRadius.all(Radius.circular(3)),
                        border: Border.all(
                            width: 1,
                            color: Colors.black54
                        )
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Image(image: AssetImage('assets/images/age.png'),width: 80,height: 80,),
                          const SizedBox(height: 10,),
                          const Text('Greater Then 18', style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w500,fontSize: 16)),
                          Text(greaterThen18.toString(), style:const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600,fontSize: 25),)
                        ],
                      ),
                    ),

                  ),
                  const SizedBox(width: 10,),
                  Container(
                    padding:const EdgeInsets.all(10),
                    width: 160,
                    height: 170,
                    decoration: BoxDecoration(
                        color:Colors.red.shade100,
                        borderRadius:const BorderRadius.all(Radius.circular(3)),
                        border: Border.all(
                            width: 1,
                            color: Colors.black54
                        )
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Image(image: AssetImage('assets/images/no-minors.png'),width: 80,height: 80,),
                          const SizedBox(height: 10,),
                          const Text('Less Then 18', style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500,fontSize: 16)),
                          Text(lessThen18.toString(), style:const TextStyle(color: Colors.red, fontWeight: FontWeight.w600,fontSize: 25),)
                        ],
                      ),
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
