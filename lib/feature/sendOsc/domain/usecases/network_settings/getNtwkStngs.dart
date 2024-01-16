import 'package:laser_slides_flutter/core/usecase/usecase.dart';
import 'package:laser_slides_flutter/feature/sendOsc/data/models/NetworkSettings.dart';

import '../../repository/NtwrkRepository.dart';

class GetNetworkSettingsUseCase implements UseCase<List<NetworkSettings>,void> {
  final NetworkSettingsRepository networkSettingsRepository;

  GetNetworkSettingsUseCase({required this.networkSettingsRepository});

  @override
  Future<List<NetworkSettings>> call({void params}) {
    return networkSettingsRepository.getAllNetworkConfig();
  }

}