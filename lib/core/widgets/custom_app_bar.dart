

import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';

AppBar buildAppBar(context,{required String title, required bool arrowBack,}) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      title:  Text(
      title,
        textAlign: TextAlign.center,
        style :TextStyles.bold19,
        
      ),
      leading: arrowBack
          ? IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            )
          : null,
    );
  }