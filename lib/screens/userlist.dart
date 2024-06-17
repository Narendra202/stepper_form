
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_crud_app/model/emp_model.dart';
import 'package:hive_crud_app/screens/add_emp.dart';
import 'package:hive_crud_app/screens/step1form.dart';
import 'package:hive_crud_app/screens/step2form.dart';
import 'package:hive_crud_app/screens/user_profile.dart';
import 'package:hive_flutter/adapters.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({super.key});

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  
  late Box databox;

  var selectedItem;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databox = Hive.box('employee');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //
      // ),
      floatingActionButton: CircleAvatar(
        child: FloatingActionButton.large(
          backgroundColor: const Color.fromRGBO(82, 170, 394, 1.0),
          // tooltip: 'Increment',
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmployeeRegistration()));
          },
          child: Icon(Icons.add, color: Colors.white, size: 18),
        ),
      ),

      body: ValueListenableBuilder(
        valueListenable: databox.listenable(),
        builder: (context, databox, _) {
          var data = databox.values.toList();
      
          return ListView.builder(
              itemCount: databox.length,
              itemBuilder: (context , index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: Card(
                    child: ListTile(
                      title:Text(data[index].name),
                      subtitle: Text(data[index].email),
                      leading: FlutterLogo(),
                      trailing: PopupMenuButton(

                          itemBuilder: (BuildContext context) => [
                                PopupMenuItem(
                                  // value: SampleItem.itemOne,
                                  child: Text('Edit'),
                                  onTap: (){
                                    _editEmployee(data[index], index);
                                  },
                                ),
                                PopupMenuItem(
                                  // value: SampleItem.itemOne,
                                  child: Text('Delete'),
                                  onTap: (){
                                    _deleteEmployee(data[index]);
                                  },
                                ),
                                PopupMenuItem(
                                  // value: SampleItem.itemOne,
                                  child: Text('Proflie'),
                                  onTap: (){
                                    _userProfile(data[index]);
                                  },
                                )
                              ]

                          ),
                    )
      
                  ),
                );
            },
          );
        },
      ),
    );

    
  }

  _userProfile(EmployeeModel employeeModel){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  UserProfile(userProfileValue: employeeModel)),
    );
  }

  _deleteEmployee(EmployeeModel employeeModel){
    employeeModel.delete();
  }

  _editEmployee(EmployeeModel employeeModel, int index){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EmployeeRegistration(employeeModel: employeeModel,index: index,)),
    );
  }
}
