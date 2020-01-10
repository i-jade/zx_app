import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier{

  Image _image = Image.asset("./assets/12.png",fit: BoxFit.cover,);

  void setImage(image){
    _image = image ;
    notifyListeners();
  }

  Image get userImage => _image;


}