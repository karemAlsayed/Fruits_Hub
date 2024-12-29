import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_hub/core/helper_functions/on_generate_routes.dart';
import 'package:fruit_hub/core/services/custom_bloc_observer.dart';
import 'package:fruit_hub/core/services/get_it_services.dart';
import 'package:fruit_hub/core/services/shared_prefrencess.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/features/Splash/presentation/views/splash_view.dart';
import 'package:fruit_hub/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fruit_hub/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  
  // Properly initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Using the options from firebase_options.dart
  );
  
  await Prefs.init();
  setup();
  
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Cairo',
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          scaffoldBackgroundColor: Colors.white),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('ar'),
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
