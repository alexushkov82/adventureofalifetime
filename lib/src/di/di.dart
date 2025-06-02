import 'package:get_it/get_it.dart';

import '../features/cart/data/repositories/cart_repository.dart';
import '../features/cart/data/repositories/cart_repository_impl.dart';
import '../features/cart/data/services/hive_service.dart';
import '../features/cart/presentation/bloc/cart_bloc/cart_bloc.dart';
import '../features/products/data/repositories/products_repository.dart';
import '../features/products/data/repositories/products_repository_impl.dart';
import '../features/products/data/services/api_service.dart';
import '../features/products/data/services/api_service_impl.dart';
import '../features/products/presentation/bloc/products_bloc/products_bloc.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<ApiService>(() => ApiServiceImpl());

  getIt.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(getIt<ApiService>()),
  );

  getIt.registerLazySingleton<ProductsBloc>(() => ProductsBloc(getIt<ProductsRepository>()));

  getIt.registerLazySingleton<HiveService>(() => HiveService());

  getIt.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(getIt<HiveService>()));

  getIt.registerLazySingleton<CartBloc>(() => CartBloc(getIt<CartRepository>()));
}
