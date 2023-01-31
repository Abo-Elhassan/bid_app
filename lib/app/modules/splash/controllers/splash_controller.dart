import 'package:bid_app/app/routes/app_pages.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    initApplication();

    super.onReady();
  }

  void initApplication() {
    Future.delayed(Duration(seconds: 4), () async {
      // await cachImages();
      // AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      // if (Platform.isAndroid) {
      //   FlutterJailbreakDetection.developerMode.then((value) {
      //     if (value || !(androidInfo.isPhysicalDevice)) {
      //       Get.offAllNamed(Routes.ERROR);
      //     }else{
      //          else{
      Get.offAllNamed(Routes.LANDING);
      // }
      //   });
      // } else if (Platform.isIOS) {
      //   IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

      //   FlutterJailbreakDetection.jailbroken.then((value) {
      //     if (value == true || !iosInfo.isPhysicalDevice) {
      //       Get.offNamed(Routes.ERROR);
      //     }
      //   });
      // }

      // RootCheck.isRooted.then((value) {
      //   if (value != null && value) {
      //     exit(0);
      //   }
      // });

      // RootCheck.isRootedWithBusyBoxCheck.then((value) {
      //   if (value != null && value) {
      //     exit(0);
      //   }
      // });

      // RootCheck.checkForRootNative.then((value) {
      //   if (value != null && value) {
      //     exit(0);
      //   }
      // });

      // RootCheck.detectPotentiallyDangerousApps.then((value) {
      //   if (value != null && value) {
      //     exit(0);
      //   }
      // });

      // RootCheck.detectTestKeys.then((value) {
      //   if (value != null && value) {
      //     exit(0);
      //   }
      // });

      // RootCheck.checkForDangerousProps.then((value) {
      //   if (value != null && value) {
      //     exit(0);
      //   }
      // });
    });
  }
}