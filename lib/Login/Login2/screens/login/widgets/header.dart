import 'package:flutter/material.dart';

import 'package:sakecblue/Login/Login2//constants.dart';
import 'package:sakecblue/Login/Login2//widgets/logo.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image(
            image: AssetImage('images/app_logo.png'),
            height: 70,
            width: 70,
          ),
//          Logo(
//            color: kBlue,
//            size: 48.0,
//          ),
          const SizedBox(height: kSpaceM),
          Text(
            'Welcome to CovidProtect',
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: kBlack, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: kSpaceS),
          Text(
            "'Your Safety, Our Priority'",
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: kBlack.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }
}
