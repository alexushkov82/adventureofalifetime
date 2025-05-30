import 'package:get_it/get_it.dart';

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
}
