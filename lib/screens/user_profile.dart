import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key, required this.userProfileValue});

  final userProfileValue;
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.userProfileValue.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,

      appBar: AppBar(
        backgroundColor: Colors.pink.shade600,
        centerTitle: true,
        title: Text('Welcome to ' + widget.userProfileValue.name,style: TextStyle(color: Colors.white, fontSize: 20),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: (){
            Navigator.pop(context);
          },
        ),

      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.purple.shade500,
            border: Border.all(
              width: 1,
              color: Colors.white
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name : ' + widget.userProfileValue.name,style: TextStyle(color: Colors.white, fontSize: 20),),
              Divider(),
              Text('Email : ' + widget.userProfileValue.email,style: TextStyle(color: Colors.white, fontSize: 20),),
              Divider(),
              Text('Mobile : ' + widget.userProfileValue.mobile,style: TextStyle(color: Colors.white, fontSize: 20),),
              Divider(),
              Text('Date of Birth : ' + widget.userProfileValue.dob,style: TextStyle(color: Colors.white, fontSize: 20),),
              Divider(),
              Text('Values : ' + widget.userProfileValue.values,style: TextStyle(color: Colors.white, fontSize: 20),),
              Divider(),
              Text('Gender : ' + widget.userProfileValue.gender,style: TextStyle(color: Colors.white, fontSize: 20),),
              Divider(),
              Text('MaxAge : ' + widget.userProfileValue.maxage.toString(),style: TextStyle(color: Colors.white, fontSize: 20),),
              Divider(),
              Row(
                children: [
                  Text('Hobbies : ',style: TextStyle(color: Colors.white, fontSize: 20),),
                  for(var item in widget.userProfileValue.hobbies) Text(item + ' , ', style: TextStyle(color: Colors.white,fontSize: 18),),
                ],
              ),
              Divider(),
              Text('Country : ' + widget.userProfileValue.country,style: TextStyle(color: Colors.white, fontSize: 20),),
              Divider(),
              Text('City : ' + widget.userProfileValue.city,style: TextStyle(color: Colors.white, fontSize: 20),),
              Divider(),
              Text('Commune : ' + widget.userProfileValue.commune,style: TextStyle(color: Colors.white, fontSize: 20),),

            ],
          ),
        ),
      )
    );
  }
}
