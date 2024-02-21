import 'package:flutter/material.dart';

import 'package:sakecblue/Login/Login2//constants.dart';
import 'package:sakecblue/Login/Login2//screens/onboarding/widgets/icon_container.dart';

class EducationLightCardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconContainer(
          icon: Icons.brush,
          padding: kPaddingS,
        ),
        IconContainer(
          icon: Icons.camera_alt,
          padding: kPaddingM,
        ),
        IconContainer(
          icon: Icons.straighten,
          padding: kPaddingS,
        ),
      ],
    );
  }
}
