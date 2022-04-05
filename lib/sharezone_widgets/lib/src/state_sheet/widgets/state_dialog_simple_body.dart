// Copyright (c) 2022 Sharezone UG (haftungsbeschränkt)
// Licensed under the EUPL-1.2-or-later.
//
// You may obtain a copy of the Licence at:
// https://joinup.ec.europa.eu/software/page/eupl
//
// SPDX-License-Identifier: EUPL-1.2

import 'package:flutter/material.dart';
import 'package:sharezone_widgets/common_widgets.dart';

class StateDialogSimpleBody extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final String description;

  const StateDialogSimpleBody({
    Key key,
    this.iconData,
    this.iconColor,
    this.description,
  }) : super(key: key);

  StateDialogSimpleBody.fromSimpleData({
    Key key,
    @required SimpleData simpleData,
  })  : iconData = simpleData.iconData,
        iconColor = simpleData.iconColor,
        description = simpleData.description,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 16),
        Icon(iconData, size: 35, color: iconColor),
        const SizedBox(height: 16),
        if (description != null)
          Text(
            description,
            textAlign: TextAlign.center,
          ),
      ],
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
    );
  }
}
