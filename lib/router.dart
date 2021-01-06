// เก็บ array ของ page route

import 'package:flutter/material.dart';
import 'package:moofriend/widget/authen.dart';
import 'package:moofriend/widget/detail_post.dart';
import 'package:moofriend/widget/myservice.dart';
import 'package:moofriend/widget/register.dart';

final Map<String, WidgetBuilder> routes = {
  '/authen': (BuildContext context) => Authen(),
  '/register': (BuildContext context) => Register(),
  '/myservice': (BuildContext context) => MyService(),
  '/detailpost': (BuildContext context) => DetailPost(),
};
