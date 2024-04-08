import 'package:flutter/material.dart';
import 'package:zinc_flutter_assignment/app.dart';
import 'package:get_it/get_it.dart';
import 'package:zinc_flutter_assignment/environment/store_environment.dart';
import 'package:zinc_flutter_assignment/repository/store_repository_impl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  registerGetIt();
  runApp(const MyApp());
}

void registerGetIt() {
  GetIt.I.registerSingleton<StoreRepositoryImpl>(
      StoreRepositoryImpl(apiEndpoint: StoreEnv.api));
}
