import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterarchitecture/src/bloc/app_bloc/app_cubit.dart';

/// [CubitExtension] this's extension of BuildContext to get
/// the faster a cubit
extension CubitContext on BuildContext {
  /// [appCubit] get faster AppCubit from context
  AppCubit get appCubit => BlocProvider.of<AppCubit>(this);
}
