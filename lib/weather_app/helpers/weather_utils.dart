import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

Future<Position> getCurrentPosition() async {
  var status = await Permission.location.request();
  if (status.isGranted) {
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  } else {
    return getCurrentPosition();
  }
}
