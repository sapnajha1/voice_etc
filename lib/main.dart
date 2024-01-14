import 'package:englishetc_voice_ai/mainscreens/desktop.dart';
import 'package:englishetc_voice_ai/mainscreens/mobile.dart';
import 'package:englishetc_voice_ai/mainscreens/tablet.dart';
import 'package:englishetc_voice_ai/responsive/responsive_layout.dart';
import 'package:englishetc_voice_ai/splash.dart';
import 'package:englishetc_voice_ai/theme/light_theme.dart';
import 'package:englishetc_voice_ai/theme/theme_provider.dart';
import 'package:englishetc_voice_ai/voice_re.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    //   ChangeNotifierProvider(
    // create: (context) => ThemeProvider(),
    //   child:
      const MyApp());
  // );

  FlutterTts flutterTts = FlutterTts();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get googleSignInAccount => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'English_AI',
        debugShowCheckedModeBanner: false,
        // theme: lightTheme,
        // ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        //   useMaterial3: true,
        // ),

        // home:ErrorPronunciation()
        home: splashScreen()
        // home: Responsive_layout(
        //           mobileScaffold: MobilePage(title: 'mobilepage',userdata:googleSignInAccount),
        //           tabletScaffold: tabletPage(title: 'tabletpage',userdata:googleSignInAccount),
        //           desktopScaffold: DesktopPage(title: 'desktoppage',userdata:googleSignInAccount))

        );
  }
}
