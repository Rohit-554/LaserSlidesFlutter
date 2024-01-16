

import 'package:laser_slides_flutter/feature/sendOsc/data/models/NetworkEntity.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../repository/NetworkRepositories.dart';

class SaveNetworkConfigUseCase implements UseCase<void, NetworkEntity> {
  final NetworkConfigRepository networkConfigRepository;

  SaveNetworkConfigUseCase({required this.networkConfigRepository});

  @override
  Future<void> call({ NetworkEntity ? params}) async {
    return await networkConfigRepository.saveNetworkConfig(params!);
  }
}