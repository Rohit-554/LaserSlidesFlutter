

import '../../../../../core/usecase/usecase.dart';
import '../../repository/NetworkRepositories.dart';
import '../../../data/models/NetworkEntity.dart';

class GetNetworkConfigUseCase implements UseCase<List<NetworkEntity>, void> {
  final NetworkConfigRepository networkConfigRepository;

  GetNetworkConfigUseCase({required this.networkConfigRepository});

  @override
  Future<List<NetworkEntity>> call({void params})  {
    return  networkConfigRepository.getAllNetworkConfig();
  }
}