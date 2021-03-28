import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterarchitecture/src/bloc/app_bloc/app_cubit.dart';
import 'package:flutterarchitecture/src/bloc/app_bloc/app_state.dart';
import 'package:flutterarchitecture/src/repository/user/user_repository.dart';
import 'package:flutterarchitecture/src/utils/route.dart';
import 'package:flutterarchitecture/src/utils/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// [MyApp] start the application
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [RepositoryProvider.value(value: UserRepository.initial())],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (ctx) => AppCubit(ctx.read<UserRepository>())),
          ],
          child: BlocBuilder<AppCubit, AppState>(
            buildWhen: (previous, current) {
              final isDiff = previous.locale != current.locale ||
                  previous.themeMode != current.themeMode;
              return isDiff;
            },
            builder: (ctx, state) {
              return MaterialApp(
                localizationsDelegates: [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                initialRoute: RouteUtil.initial,
                routes: RouteUtil.routes,
                locale: state.locale,
                themeMode: state.themeMode,
                theme: lightTheme,
                darkTheme: darkTheme,
              );
            },
          ),
        ));
    ;
  }
}
