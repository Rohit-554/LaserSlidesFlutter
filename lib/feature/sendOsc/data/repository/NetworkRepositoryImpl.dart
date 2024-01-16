

import 'package:laser_slides_flutter/feature/sendOsc/data/data_sources/local/database/NetworkDatabase.dart';
import 'package:laser_slides_flutter/feature/sendOsc/domain/repository/NetworkRepositories.dart';
import 'package:laser_slides_flutter/feature/sendOsc/data/models/NetworkEntity.dart';

class NetworkRepositoryImpl implements NetworkConfigRepository {
  final NetworkDatabase networkDatabase;

  NetworkRepositoryImpl({required this.networkDatabase});

  @override
  Future<void> deleteNetworkConfig(NetworkEntity networkEntity) {
    return networkDatabase.networkConfigDao.deleteNetwork(networkEntity);
  }

  @override
  Future<List<NetworkEntity>> getAllNetworkConfig() {
    return networkDatabase.networkConfigDao.findAllNetworks();
  }

  @override
  Future<void> saveNetworkConfig(NetworkEntity networkEntity) {
    return networkDatabase.networkConfigDao.insertNetwork(networkEntity);
  }

}