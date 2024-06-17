import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hive/hive.dart';
import 'profile_image.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  late Box _profileBox;

  @override
  void initState() {
    super.initState();
    _profileBox = Hive.box('employee');
    _loadProfileImage();
  }

  Future<void> _loadProfileImage() async {
    final profileImage = _profileBox.get('profileImage');
    if (profileImage != null && profileImage.imagePath != null) {
      setState(() {
        _image = File(profileImage.imagePath!);
      });

    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      print(_image);

      _saveProfileImage(pickedFile.path);
    }
  }

  void _saveProfileImage(String imagePath) {
    final profileImage = (imagePath: imagePath);
    _profileBox.put('profileImage', profileImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? Container(
                width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                        color: Colors.black87
                    )
                  ),
                  child: Center(
                                child: Icon(Icons.add_photo_alternate_rounded,size: 30,),
                              ),
                )
                : Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: Colors.black87
                  )
              ),
              child: Image.file(_image!)
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
          ],
        ),
      ),
    );
  }
}