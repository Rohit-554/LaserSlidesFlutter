import 'package:laser_slides_flutter/core/usecase/usecase.dart';
import 'package:laser_slides_flutter/feature/sendOsc/data/models/NetworkSettings.dart';

import '../../repository/NtwrkRepository.dart';

class SaveNetworkSettingsUseCase implements UseCase<void,NetworkSettings>{
  final NetworkSettingsRepository networkSettingsRepository;

  SaveNetworkSettingsUseCase({required this.networkSettingsRepository});

  @override
  Future<void> call({NetworkSettings? params}) {
    return networkSettingsRepository.saveNetworkConfig(params!);
  }

}