import '../../../../../core/usecase/usecase.dart';
import '../../repository/NtwrkRepository.dart';
import '../../../data/models/NetworkSettings.dart';

class RemoveNetworkSettingsUseCase implements UseCase<void, NetworkSettings> {
  final NetworkSettingsRepository networkSettingsRepository;

  RemoveNetworkSettingsUseCase({required this.networkSettingsRepository});

  @override
  Future<void> call({NetworkSettings? params}) async {
    return await networkSettingsRepository.deleteNetworkConfig(params!);
  }
}