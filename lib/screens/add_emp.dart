

// import 'dart:ffi';

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_crud_app/model/emp_model.dart';
import 'package:hive_crud_app/screens/step1form.dart';
import 'package:hive_crud_app/screens/step2form.dart';
import 'package:hive_crud_app/screens/userlist.dart';

class EmployeeRegistration extends StatefulWidget {
  const EmployeeRegistration({super.key, this.employeeModel, this.index});

  final EmployeeModel? employeeModel;
  final int? index;
  @override
  State<EmployeeRegistration> createState() => _EmployeeRegistrationState();
}

class _EmployeeRegistrationState extends State<EmployeeRegistration> {

  int selectedStep = 0;

  late String namefield;
  late String emailfield;
  late String mobilefield;
  late String dateofbirthfield;
  late String dropdownfield;
  late String genderfield;
   late double maxAgefield;
  late List hobbiesfield;
  late String countryfield;
  late String cityfield;
  late String communefield;

  late final Box databox;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databox = Hive.box('employee');

    if(widget.employeeModel != null){

     print(widget.index);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Registration Form',style: TextStyle(color: Colors.pink.shade600),),
        // backgroundColor: Colors.pink.shade600,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,color: Colors.pink.shade600,),
        ),
        // actions: [
        //   IconButton(
        //       onPressed: (){
        //         Navigator.pop(context);
        //       },
        //       icon: Icon(Icons.arrow_back)
        //   )
        // ],
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(primary: Colors.pink.shade600)
        ),
        child: Stepper(
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  Expanded(
                      child: FilledButton(
                        child:  Text(selectedStep == 2 ? 'Confirm' : 'Next'),
                        onPressed: details.onStepContinue,
                      )
                  ),
                  SizedBox(width: 12,),
                  if(selectedStep != 0)
                    Expanded(
                        child: FilledButton(
                          child: Text('Cancel'),
                          onPressed: details.onStepCancel,
                        )
                    )
                ],
              ),
            );
          },
          currentStep: selectedStep,
          onStepCancel: (){
            if(selectedStep != 0){
              setState(() {
                selectedStep = selectedStep - 1;
              }
              );
            }
            },
          onStepContinue: () async{

           if(selectedStep == 3 - 1){

             if(widget.employeeModel == null) {
               EmployeeModel data = EmployeeModel(name: namefield,
                   email: emailfield,
                   mobile: mobilefield,
                   dob: dateofbirthfield,
                   values: dropdownfield,
                   gender: genderfield,
                   maxage: maxAgefield,
                   hobbies: hobbiesfield,
                   country: countryfield,
                   city: cityfield,
                   commune: communefield);
               databox.add(data);
             }

             else{
               EmployeeModel data = EmployeeModel(name: namefield,
                   email: emailfield,
                   mobile: mobilefield,
                   dob: dateofbirthfield,
                   values: dropdownfield,
                   gender: genderfield,
                   maxage: maxAgefield,
                   hobbies: hobbiesfield,
                   country: countryfield,
                   city: cityfield,
                   commune: communefield);
                 databox.putAt(widget.index ?? 0, data);
             }

             Navigator.pop(context);
           }
          else{
             setState(() {
               selectedStep = selectedStep + 1;
             });
           }
          },
          onStepTapped: (int index){
            setState(() {
              selectedStep = index;
            });
          },
         steps: [
           Step(
               state : selectedStep > 0 ? StepState.complete : StepState.indexed,
               isActive : selectedStep >= 0,
               title: Text('Step 1'),
               // content: Text('hello')
               content:Step1Form(nameValue: (value){ namefield = value;}, emailValue: (value){emailfield = value;},mobileValue: (value){mobilefield = value;},
                                  dateofbirthValue: (value){dateofbirthfield = value;}, dropdownValue: (value){dropdownfield = value;},genderValue: (value){genderfield = value;},
                                  maxAgeValue: (value){maxAgefield = value;},hobbiesValue: (value){hobbiesfield = value;}, employeeModel: widget.employeeModel,)
           ),
           Step(
               state : selectedStep > 1 ? StepState.complete : StepState.indexed,
               isActive : selectedStep >= 1,
               title: Text('Step 2'),
               content: Step2Form(countryName: (value){countryfield = value;}, cityName: (value){cityfield = value;}, communeName: (value){communefield =value;},employeeModel: widget.employeeModel,)
           ),
           Step(
             state : selectedStep > 2 ? StepState.complete : StepState.indexed,
             isActive : selectedStep >= 2,
             title: Text('Step 3'),
             content: Text('hello'),
           ),


         ],

          ),
      ),

        // steps: StepList,

    );

  }

  // createData(){
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => Step1Form(nameController: nameController,)),
  //   );
  // }
}
