import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kuliku/controllers/basic_controller.dart';
import 'package:kuliku/models/user_model.dart';
import 'package:kuliku/providers/auth_provider.dart';
import 'package:kuliku/utils/colors.dart';

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AuthProvider authProvider = Get.put(AuthProvider(), permanent: true);
  final BasicController bController =
      Get.put(BasicController(), permanent: true);
  final box = GetStorage();

  Stream<UserModel> autoLogin() async* {
    if (box.read('token') != null) {
      String token = box.read('token');
      if (await authProvider.loginWithToken(token)) {
        yield authProvider.user!;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserModel>(
      stream: autoLogin(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(color: Colors.white);
        }
        return GetMaterialApp(
          title: "Application",
          theme: ThemeData(
            colorScheme: ThemeData()
                .colorScheme
                .copyWith(primary: AppColors.primaryColor),
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: snapshot.hasData ? Routes.MAIN : Routes.ON_BOARDING,
          getPages: AppPages.routes,
        );
      },
    );
  }
}
