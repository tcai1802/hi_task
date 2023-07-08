import 'package:flutter/material.dart';
import 'package:hi_task/src/res/colors/app_colors.dart';
import 'package:hi_task/src/res/dimensions/app_dimensions.dart';
import 'package:hi_task/src/res/drawable/app_drawable.dart';
import 'package:hi_task/src/res/strings/english_strings.dart';

class Resources {
  final BuildContext _context; // using later
  Resources(this._context);
  EnglishStrings? get strings {
    return EnglishStrings();
  }

  AppColors get color {
    return AppColors();
  }

  AppDimensions get dimension {
    return AppDimensions();
  }

  AppDrawable get drawable {
    return AppDrawable();
  }

  static Resources of(BuildContext context) {
    return Resources(context);
  }
}
