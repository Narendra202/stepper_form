
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_crud_app/model/emp_model.dart';
import 'package:hive_crud_app/screens/add_emp.dart';
import 'package:hive_crud_app/screens/user_profile.dart';
import 'package:hive_flutter/adapters.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({super.key});

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {

  final searchController = SearchController();
  final textController = TextEditingController();

  List _filteredItems = [];

  var listData;
  late Box databox;
  bool isDark = false;
  List data = [];
  var selectedItem;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databox = Hive.box('employee');

    data = databox.values.toList();
    _filteredItems = data;
  }

  _filterValues(String enterKey){
    List result = [];
    if(enterKey.isEmpty){
      result = data;
    }
    else{
      result = data.where((user) => user.name.toString().toLowerCase().contains(enterKey.toString().toLowerCase())).toList();
    }

    setState(() {
      _filteredItems = result;
    });
  }


  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            height: 50,
            margin: const EdgeInsets.only(top: 0),
            child: TextFormField(
              controller: textController,
              onChanged: (value){
                _filterValues(value);
              },
              decoration:const InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                hintText: 'Search'
              ),
            )
            // SearchAnchor(
            //   // searchController: searchController,
            //   headerHeight: 50,
            //       headerTextStyle: TextStyle(color: Colors.blue, fontSize: 20),
            //       // headerHintStyle: Text('Search Here..'),
            //       builder: (BuildContext context, SearchController controller) {
            //       return SearchBar(
            //         controller: controller,
            //         padding: const WidgetStatePropertyAll<EdgeInsets>(
            //             EdgeInsets.symmetric(horizontal: 16.0,)),
            //         onTap: () {
            //           controller.openView();
            //         },
            //
            //         onSubmitted: (value){
            //           print('Submitted : ' + controller.text);
            //         },
            //
            //         onChanged: (value) {
            //           controller.openView();
            //           // print('value : ' + value);
            //         },
            //         leading: const Icon(Icons.search),
            //         trailing: <Widget>[
            //           Tooltip(
            //             message: 'Change brightness mode',
            //             child: IconButton(
            //               isSelected: isDark,
            //               onPressed: () {
            //                 setState(() {
            //                   isDark = !isDark;
            //                 });
            //               },
            //               icon: const Icon(Icons.wb_sunny_outlined),
            //               selectedIcon: const Icon(Icons.brightness_2_outlined),
            //             ),
            //           )
            //         ],
            //       );
            //     },
            //     suggestionsBuilder:
            //     (BuildContext context, SearchController controller) {
            //     // print(controller.text);
            //
            //       return List<ListTile>.generate(databox.length, (int index) {
            //         data = databox.values.toList();
            //
            //         // final String item = 'item $index';
            //     return ListTile(
            //       title: Column(
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             // Text(data[index].name),
            //             Text(data[index].name),
            //             Divider()
            //           ]
            //       ),
            //       onTap: () {
            //         setState(() {
            //           controller.closeView(data[index].name);
            //         });
            //       },
            //     );
            //   });
            // }
            // ),
          ),
        ),



        floatingActionButton: CircleAvatar(
          child: FloatingActionButton.large(
            backgroundColor: const Color.fromRGBO(82, 170, 394, 1.0),
            // tooltip: 'Increment',
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>const EmployeeRegistration()));
            },
            child:const Icon(Icons.add, color: Colors.white, size: 18),
          ),
        ),

        body:  Container(
          margin:const EdgeInsets.only(top: 20),
          child: ValueListenableBuilder(
            valueListenable: databox.listenable(),
            builder: (context, databox, _) {
              var data = databox.values.toList();

              return ListView.builder(
                  itemCount: _filteredItems.length,
                  itemBuilder: (context , index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      child: Card(
                        child: Container(
                          padding:const EdgeInsets.all(5),
                          color: Colors.blue.shade50,
                          child: ListTile(
                            title:Text(_filteredItems[index].name, style: const TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.w500),),
                            subtitle: Text(_filteredItems[index].email, style: const TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.w500),),
                            leading:const FlutterLogo(),
                            trailing: PopupMenuButton(
                                itemBuilder: (BuildContext context) => [
                                      PopupMenuItem(
                                        // value: SampleItem.itemOne,
                                        child:const Text('Edit'),
                                        onTap: (){
                                          _editEmployee(data[index], index);
                                        },
                                      ),
                                      PopupMenuItem(
                                        // value: SampleItem.itemOne,
                                        child:const Text('Delete'),
                                        onTap: (){
                                          _deleteEmployee(data[index]);
                                        },
                                      ),
                                      PopupMenuItem(
                                        // value: SampleItem.itemOne,
                                        child:const Text('Proflie'),
                                        onTap: (){
                                          _userProfile(data[index]);
                                        },
                                      )
                                    ]

                                ),
                          ),
                        )

                      ),
                    );
                },
              );
            },
          ),
        ),
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
