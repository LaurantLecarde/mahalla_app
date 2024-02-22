import 'package:flutter/cupertino.dart';

void navigatePush(BuildContext context, Widget to){
  Navigator.of(context).push(CupertinoPageRoute(builder: (context)=>to));
}
void navigatePushRemove(BuildContext context, Widget to){
  Navigator.of(context).pushAndRemoveUntil(CupertinoPageRoute(builder: (context)=>to), (route) => false);
}
void navigatePop(BuildContext context){
  Navigator.of(context).pop();
}
