import '../../../../../core/usecase/usecase.dart';
import '../../repository/NetworkRepositories.dart';
import '../../../data/models/NetworkEntity.dart';

class RemoveNetworkConfigUseCase implements UseCase<void, NetworkEntity> {
  final NetworkConfigRepository networkConfigRepository;

  RemoveNetworkConfigUseCase({required this.networkConfigRepository});

  @override
  Future<void> call({NetworkEntity? params}) async {
    return await networkConfigRepository.deleteNetworkConfig(params!);
  }
}