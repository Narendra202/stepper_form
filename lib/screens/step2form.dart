import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Step2Form extends StatefulWidget {
  const Step2Form({super.key,required this.countryName, required this.cityName, required this.communeName, this.employeeModel});

  final Function(dynamic) countryName;
  final Function(dynamic) cityName;
  final Function(dynamic) communeName;

  final employeeModel;
  @override
  State<Step2Form> createState() => _Step2FormState();
}

class _Step2FormState extends State<Step2Form> {

  var countryValue;
  var cityValue;
  var communeValue;


  List countryList = [];
  List cityList = [];
  List communeList = [];


  List selectedCityList = [];
  List selectedCommuneList = [];



  Future  getCoutryList() async{
    final apiurl = 'http://18.200.56.223:8529/_db/Egov-Dev/Birth/masterData/getProvince';

    http.Response response = await http.get(Uri.parse(apiurl));

    // print(response);
    if(response.statusCode == 200){
      var apijsondata = json.decode(response.body);
      // apijsondata["data"].forEach((e)=>print(e["provinceName"]));
      // print(apijsondata['data']);
      setState(() {
        countryList = apijsondata['data'];
      });
    }

  }

    Future getCity() async{
      final cityapiurl = 'http://18.200.56.223:8529/_db/Egov-Dev/Birth/masterData/getCity';
      http.Response response = await http.get(Uri.parse(cityapiurl));

      if(response.statusCode == 200){
        var cityapijson = json.decode(response.body);
        setState(() {
          cityList = cityapijson['data'];
        });
      }
    }


    Future getCommone() async{
      final communeapiurl = 'http://18.200.56.223:8529/_db/Egov-Dev/Birth/masterData/getCommune';
      http.Response response = await http.get(Uri.parse(communeapiurl));

      if(response.statusCode == 200){
        var communeapiurl = json.decode(response.body);
        setState(() {
          communeList = communeapiurl['data'];
        });
      }
    }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCoutryList();
    getCity();
    getCommone();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton(
            isExpanded: true,
            hint: Text('Select Country'),
            value: countryValue,
            items: countryList.map((value) {
              return DropdownMenuItem(
                  value: value['_key'].toString(),
                  child: Text(value['provinceName'].toString())
              );
            }).toList(),

            onChanged: (newValue){
              setState(() {
                countryValue = newValue;
                // print(countryValue);
                widget.countryName(countryValue);
                for(int i = 0; i < cityList.length ; i++){
                  if(cityList[i]['provinceId'] == countryValue){
                    // print(cityList[i]['_key']);
                    selectedCityList.add(cityList[i]);
                    // print(selectedCityList);
                    // getCity();
                  }
                }
              });
            }
        ),

        DropdownButton(
            isExpanded: true,
            hint: Text('Select City '),
            value: cityValue,
            items: selectedCityList.map((value) {
              return DropdownMenuItem(
                  value: value['_key'],
                  child: Text(value['cityName'])
              );
            }).toList(),
            onChanged: (newValue){
              // print(cityValue)
                 setState(() {
                   cityValue = newValue;
                   widget.cityName(cityValue);
                   for(int i = 0; i < communeList.length ; i++){
                     // print()
                     if(communeList[i]['cityId'] == cityValue) {
                       selectedCommuneList.add(communeList[i]);
                       // print(selectedCommuneList);
                     }
                   }
                 });
            }
        ),
        DropdownButton(
            isExpanded: true,
            hint: Text('Select Commune'),
            value: communeValue,
            items: selectedCommuneList.map((value) {
              return DropdownMenuItem(
                  value: value['ID'],
                  child: Text(value['communeName'])
              );
            }).toList(),
            onChanged: (newValue){
              setState(() {
                communeValue = newValue;
                widget.communeName(communeValue);
              });
            }
        )
      ],
    );
  }
}
