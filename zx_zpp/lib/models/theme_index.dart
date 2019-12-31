

import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'config_theme.dart';

class Store{
  static init({model , child , dispose = true}){
    final providers = Providers()
      ..provide(Provider.value(ThemeConfigModel()));
    return ProviderNode(
      child:child,
      providers:providers,
      dispose:dispose
    );
  }

  static connect<T>({builder,child,scope}){
    return Provide<T>(
      builder: builder,
      child: child,
      scope: scope,
    );
  }

  static T value<T>(context,{scope}){
    return Provide.value<T>(context,scope: scope);
  }
}