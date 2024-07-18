import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notepad/firebase_options.dart';
import 'package:notepad/src/screens/auth_screen/login_screen.dart';
import 'package:notepad/src/screens/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notepad/src/binding/root_bindings.dart';
import 'package:notepad/src/screens/add_note_screen.dart';
import 'package:notepad/src/screens/search_screen.dart';
import 'package:notepad/src/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(DevicePreview(
      enabled: !kReleaseMode, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          // ignore: deprecated_member_use
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,

          themeMode: ThemeMode.light,
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          getPages: [
            GetPage(
                name: "/splash",
                page: () => const SplashScreen(),
                binding: RootBinding()),
            GetPage(
                name: "/home",
                page: () => const HomeScreen(),
                binding: RootBinding()),
            GetPage(
                name: "/add",
                page: () => const AddNoteScreen(),
                binding: RootBinding()),
            GetPage(
                name: "/search",
                page: () => const SearchScreen(),
                binding: RootBinding()),
            GetPage(
                name: "/logout",
                page: () => LoginScreen(),
                binding: RootBinding()),
          ],
          initialRoute: '/splash',
          builder: (context, widget) {
            // ScreenUtil.setContext(context);
            return MediaQuery(
              //Setting font does not change with system font size
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(),
    );
    return const SplashScreen();
  }
}
