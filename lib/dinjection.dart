import 'package:get_it/get_it.dart';
import 'package:laser_slides_flutter/feature/sendOsc/domain/repository/NetworkRepositories.dart';
import 'package:laser_slides_flutter/feature/sendOsc/domain/repository/NtwrkRepository.dart';
import 'package:laser_slides_flutter/feature/sendOsc/presentation/bloc/local/button_config_bloc/NetworkBloc.dart';
import 'package:laser_slides_flutter/feature/sendOsc/presentation/bloc/local/button_config_bloc/NetworkConfig_event.dart';
import 'package:laser_slides_flutter/feature/sendOsc/presentation/bloc/local/network_settings_bloc/NetworkSettingsBloc.dart';
import 'package:laser_slides_flutter/feature/sendOsc/presentation/bloc/local/osc_bloc/OscSenderBloc.dart';
import 'package:laser_slides_flutter/feature/sendOsc/domain/usecases/network_settings/getNtwkStngs.dart';
import 'package:laser_slides_flutter/feature/sendOsc/domain/usecases/network_settings/removeNtwrkStngs.dart';
import 'package:laser_slides_flutter/feature/sendOsc/domain/usecases/network_settings/saveNtwrkStngs.dart';
import 'package:laser_slides_flutter/feature/sendOsc/domain/usecases/button_configs/getNetworkConfig.dart';
import 'package:laser_slides_flutter/feature/sendOsc/domain/usecases/button_configs/removeNetworkConfig.dart';
import 'package:laser_slides_flutter/feature/sendOsc/domain/usecases/button_configs/saveNetworkConfig.dart';

import 'feature/sendOsc/data/data_sources/local/database/NetworkDatabase.dart';
import 'feature/sendOsc/data/repository/NetworkRepositoryImpl.dart';
import 'feature/sendOsc/data/repository/NtwrkRepositoryImpl.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database = await $FloorNetworkDatabase
      .databaseBuilder('network_database.db')
      .build();

  sl.registerSingleton<NetworkDatabase>(database);

  //repository
  sl.registerSingleton<NetworkConfigRepository>(
      NetworkRepositoryImpl(networkDatabase: sl())
  );

  sl.registerSingleton<NetworkSettingsRepository>(
      NetworkSettingsRepositoryImpl(sl())
  );

  //useCase
  sl.registerSingleton<GetNetworkConfigUseCase>(
      GetNetworkConfigUseCase(networkConfigRepository: sl())
  );

  sl.registerSingleton<SaveNetworkConfigUseCase>(
      SaveNetworkConfigUseCase(networkConfigRepository: sl())
  );

  sl.registerSingleton<RemoveNetworkConfigUseCase>(
      RemoveNetworkConfigUseCase(networkConfigRepository: sl())
  );

  sl.registerSingleton<GetNetworkSettingsUseCase>(
      GetNetworkSettingsUseCase(networkSettingsRepository: sl())
  );

  sl.registerSingleton<SaveNetworkSettingsUseCase>(
      SaveNetworkSettingsUseCase(networkSettingsRepository: sl())
  );

  sl.registerSingleton<RemoveNetworkSettingsUseCase>(
      RemoveNetworkSettingsUseCase(networkSettingsRepository: sl())
  );

  //bloc
  sl.registerFactory<NetworkBloc>(() =>
   NetworkBloc(sl(), sl(), sl())
  );

  sl.registerFactory<NetworkSettingsBloc>(() =>
      NetworkSettingsBloc(sl(), sl(), sl())
  );

  sl.registerFactory<OSCSenderBloc>(() =>
      OSCSenderBloc()
  );

}
