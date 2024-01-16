
import 'package:laser_slides_flutter/feature/sendOsc/data/models/NetworkEntity.dart';

abstract class NetworkConfigRepository{
  Future<List<NetworkEntity>> getAllNetworkConfig();
  Future<void> saveNetworkConfig(NetworkEntity networkEntity);
  Future<void> deleteNetworkConfig(NetworkEntity networkEntity);
}