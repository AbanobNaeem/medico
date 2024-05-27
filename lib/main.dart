// Project imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpert/src/core/resources/bloc_observer.dart';
import 'package:xpert/src/core/resources/injection.dart';
import 'package:xpert/src/core/resources/shared_preferences.dart';

import 'src/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initGetIt();

  Future.wait([
    CacheHelper.init(),
    ScreenUtil.ensureScreenSize(),
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ])
  ]).then((_) {
    Bloc.observer = AppObserver();
    runApp(
      Phoenix(
        child: MyApp(),
        /////////////
      ),
    );
  });
}
