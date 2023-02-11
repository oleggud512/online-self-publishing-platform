import 'package:client/firebase_options.dart';
import 'package:client/src/app.dart';
import 'package:client/src/features/localization/data/localization_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await dotenv.load();
  
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };

  final container = ProviderContainer();
  await container.read(localizationControllerProvider.notifier).loadLocale();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(UncontrolledProviderScope(
    container: container,
    child: const MyApp()
  ));
}