
// import 'dart:ffi';
// import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';



enum ExerciseFilter { walking, running, cycling, hiking }


class Step1Form extends StatefulWidget {
  const Step1Form( {super.key, required this.nameValue, required this.emailValue, required this.mobileValue, required this.dateofbirthValue,required this.dropdownValue, required this.genderValue, required this.maxAgeValue, required this.hobbiesValue,this.employeeModel});


  // final void Function(dynamic) onCreate;
  final void Function(dynamic) nameValue;
  final void Function(dynamic) emailValue;
  final void Function(dynamic) mobileValue;
  final void Function(dynamic) dateofbirthValue;
  final void Function(dynamic) dropdownValue;
  final void Function(dynamic) genderValue;
  final void Function(dynamic) maxAgeValue;
  final void Function(dynamic) hobbiesValue;
  // final void Function(dynamic) genderValue;

  final employeeModel;

  @override
  State<Step1Form> createState() => _Step1FormState();
}

class _Step1FormState extends State<Step1Form> {
  static TextEditingController nameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController mobileController = TextEditingController();
  static TextEditingController dateOfBirth = TextEditingController();
  late String dropDownValue = items.first;
  var  genderGroupValue;
  late double sliderValue = 10;
  Set hobbiesValueList = {};
  List hobbiesListNewItem = [];
  // Set hobbiesval = {};
  List hobbiesList = ['walking', 'running', 'cycling', 'hiking'];

  // var dateOfBirth;
  // String dropDownValue = items.first;
  late int mobilenumberValue;
  final items = ['One', 'Two', 'Three', 'Four'];

  DateTime initDate = DateTime.now();
  // late String dateOfBirth;
  selectedDate(BuildContext context) async{
   final DateTime? pickedDate = await showDatePicker(
        context: context,
        firstDate:DateTime(1970),
        initialDate: initDate,
        lastDate: DateTime(2025)
    );

   if(pickedDate != null && pickedDate != initDate){
     setState(() {
       initDate = pickedDate;
       dateOfBirth.text = DateFormat('yyyy-MM-dd').format(initDate);
     });
   }
  }

  // @override
  // void dispose() {
  //   // widget.nameController?.dispose();
  //   super.dispose();
  // }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
           SizedBox(height: 15,),
           TextFormField(
             controller: nameController,
             validator: (value){
               if(value == null || value.isEmpty){
                 return 'Please Enter some text';
               }
             },
             onChanged: widget.nameValue,

             decoration: InputDecoration(
               hintText: 'Enter Name',
               labelText: 'Enter Name',
               border: OutlineInputBorder()
             ),
           ),
          SizedBox(height: 15,),
          TextFormField(
            controller: emailController,
            onChanged: widget.emailValue,
            decoration: InputDecoration(
              hintText: 'Enter Email',
              labelText: 'Enter Email',
              border: OutlineInputBorder()
            ),
          ),
        SizedBox(height: 15,),
        TextFormField(
          controller:mobileController,
          onChanged: widget.mobileValue,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Enter Mobile',
            labelText: 'Enter Mobile',
            border: OutlineInputBorder()
          ),
        ),
        SizedBox(height: 15,),
        TextFormField(
          controller: dateOfBirth,
          decoration: InputDecoration(
            hintText: 'Date of Birth',
            labelText: 'Click here to Select Date',
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.date_range),
          ),

          onTap: () async {
              await selectedDate(context);
              widget.dateofbirthValue(dateOfBirth.text);
          },
        ),
        SizedBox(height: 15,),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border:Border.all(color: Colors.black54)
          ),
          child: Column(
            children: [
              Text('Select Value',style: TextStyle(fontSize: 20),),
              DropdownButton(
                // style: TextStyle(fontSize: 20,color: Colors.black,),
                isExpanded: true,
                value: dropDownValue,

                  items: items.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem(
                            value: value,
                            child: Text(value)
                        );
                  }).toList(),
                  onChanged: (String? value){
                    setState(() {
                      dropDownValue = value!;
                      widget.dropdownValue(dropDownValue);
                      // print(widget.dropdownValue(dropDownValue);)
                      // print(widget.);
                    });
                  }
              ),
            ],
          ),
        ),
        SizedBox(height: 15,),
        Container(
          padding: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(width: 1,color: Colors.black54)
          ),
          child: Column(
            children: [
              Text('Select Gender', style: TextStyle(fontSize: 20),),
              ListTile(
                title: Text('Male'),
                leading: Radio(
                  value: 'male',
                  groupValue: genderGroupValue,
                  onChanged: (value){
                    setState(() {
                      genderGroupValue = value!;
                      // print(genderGroupValue);
                      widget.genderValue(genderGroupValue);
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('Female'),
                leading: Radio(
                  value: 'female',
                  groupValue: genderGroupValue,
                  onChanged: (value){
                    setState(() {
                      genderGroupValue = value!;
                      // print(genderGroupValue);
                      widget.genderValue(genderGroupValue);
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('Other'),
                leading: Radio(
                  value: 'other',
                  groupValue: genderGroupValue,
                  onChanged: (value){
                    setState(() {
                      genderGroupValue = value!;
                      // print(genderGroupValue);
                      widget.genderValue(genderGroupValue);
                    });
                  },
                ),
              )
            ],
          ),
        ),

        SizedBox(height: 15,),
        Container(
          padding: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(width: 1,color: Colors.black54)
          ),
          child: Column(
            children: [
              Text('What is Your Maximum Age',style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),
              Slider(
                  value: sliderValue,
                  max: 100,
                  divisions: 100,
                  label:sliderValue?.round().toString(),

                  onChangeEnd: (value){
                    setState(()  {
                        sliderValue = value;
                        widget.maxAgeValue(sliderValue);
                      // }
                    });
                  },
                onChanged: (double value) {  },
              ),
            ],
          ),
        ),

        SizedBox(height: 15,),
        Container(
          width: 310,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(width: 1,color: Colors.black54)
          ),
          child: Column(
            children: [
              Text('Select Hobbies',style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),
              Wrap(
                spacing: 15,
                children: hobbiesList.map((value) {
                  return FilterChip(
                      backgroundColor: Colors.pink.shade600,
                      label: Text(value,style: TextStyle(color: Colors.white,fontSize: 15),),
                      labelPadding: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                      selected:hobbiesListNewItem.contains(value),
                      onSelected: (selected){
                         setState(() {
                           if(selected){
                             hobbiesListNewItem.add(value);
                           }else{
                             hobbiesListNewItem.remove(value);
                           }

                         });
                         widget.hobbiesValue(hobbiesListNewItem);
                      }
                  );
                }).toList(),
              )
            ],
          ),
        )
      ],
    );
  }



}



