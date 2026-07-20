import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position?> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // 1. Verificar si el GPS está activado
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Si el GPS está apagado, no podemos obtener ubicación
      return null;
    }

    // 2. Verificar permisos
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        // El usuario negó los permisos
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // El usuario bloqueó los permisos permanentemente
      return null;
    }

    // 3. Obtener ubicación con alta precisión
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
