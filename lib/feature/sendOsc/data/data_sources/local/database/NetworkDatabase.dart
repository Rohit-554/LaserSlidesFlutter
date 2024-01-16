import 'dart:async';
import 'package:floor/floor.dart';
import 'package:laser_slides_flutter/feature/sendOsc/data/data_sources/local/dao/NetworkDao.dart';
import 'package:laser_slides_flutter/feature/sendOsc/data/data_sources/local/dao/NetworkSettings.dart';
import 'package:laser_slides_flutter/feature/sendOsc/data/models/NetworkEntity.dart';
import 'package:laser_slides_flutter/feature/sendOsc/data/models/NetworkSettings.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'NetworkDatabase.g.dart';

//this is databse
@Database(version: 2, entities: [NetworkEntity, NetworkSettings])
abstract class NetworkDatabase extends FloorDatabase {
  NetworkDao get networkConfigDao;
  NetworkSettingsDao get networkSettingsConfigDao;
}