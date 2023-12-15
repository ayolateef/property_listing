import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import '../navigation/di.dart';

GetIt getIt = GetIt.instance;

class AppStartUp {
  Future<void> setUp() async {
    getIt.allowReassignment = true;
    await Firebase.initializeApp(
    );
    await registerServices(getIt);

  }

  Future<void> registerServices(ioc) async {
    setupSharedServices(ioc);
  }
}

