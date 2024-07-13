import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:imake/routes/app_router.dart';
import 'package:imake/bloc_state_observer.dart';
import 'package:imake/routes/pages.dart';
import 'package:imake/tasks/data/local/data_sources/tasks_data_provider.dart';
import 'package:imake/tasks/data/repository/task_repository.dart';
import 'package:imake/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:imake/tasks/presentation/bloc/auth_bloc.dart'; // Import the AuthBloc
import 'package:imake/utils/color_palette.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocStateObserver();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await initializeDateFormatting('pt_BR', null);

  runApp(MyApp(preferences: preferences));
}

class MyApp extends StatelessWidget {
  final SharedPreferences preferences;

  const MyApp({Key? key, required this.preferences}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider(
          create: (context) => TaskRepository(taskDataProvider: TaskDataProvider(preferences)),
        ),
        BlocProvider(
          create: (context) => TasksBloc(context.read<TaskRepository>()),
        ),
        BlocProvider(
          create: (context) => AuthBloc(), // Provide the AuthBloc
        ),
      ],
      child: MaterialApp(
        title: 'Ricado - Imake - Gerenciador de Tarefas',
        debugShowCheckedModeBanner: false,
        initialRoute: Pages.initial,
        onGenerateRoute: onGenerateRoute,
        theme: ThemeData(
          fontFamily: 'Sora',
          visualDensity: VisualDensity.adaptivePlatformDensity,
          canvasColor: Colors.transparent,
          colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
          useMaterial3: true,
        ),
      ),
    );
  }
}
