import 'package:floor/floor.dart';

import '../../../models/NetworkEntity.dart';

@dao
abstract class NetworkDao {
  @Query('SELECT * FROM NetworkConfigs')
  Future<List<NetworkEntity>> findAllNetworks();

  @Query('SELECT * FROM NetworkConfigs WHERE id = :id')
  Stream<NetworkEntity?> findNetworkById(int id);

  @Insert()
  Future<void> insertNetwork(NetworkEntity network);

  @Update()
  Future<void> updateNetwork(NetworkEntity network);

  @delete
  Future<void> deleteNetwork(NetworkEntity network);
}