// Package imports:
import 'package:device_info_plus/device_info_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

@module
abstract class ServiceBoxModule {
  @singleton
  DeviceInfoPlugin providesDeviceInfoPlugin() {
    return DeviceInfoPlugin();
  }

  @singleton
  @preResolve
  Future<PackageInfo> providesPackageInfoPlugin() {
    return PackageInfo.fromPlatform();
  }

  @singleton
  ImagePicker providesImagePicker() {
    return ImagePicker();
  }
}
