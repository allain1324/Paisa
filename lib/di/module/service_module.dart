// Package imports:
import 'package:device_info_plus/device_info_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

@module
abstract class ServiceBoxModule {
  @lazySingleton
  DeviceInfoPlugin providesDeviceInfoPlugin() {
    return DeviceInfoPlugin();
  }

  @lazySingleton
  @preResolve
  Future<PackageInfo> providesPackageInfoPlugin() {
    return PackageInfo.fromPlatform();
  }

  @lazySingleton
  ImagePicker providesImagePicker() {
    return ImagePicker();
  }
}
