// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';

// class MapScreen extends StatefulWidget {
//   const MapScreen({Key? key}) : super(key: key);

//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   late GoogleMapController mapController;
//   LatLng _center = LatLng(21.0285, 105.8542); // Tọa độ trung tâm Việt Nam

//   TextEditingController _locationTextController =
//       TextEditingController(); // Controller cho ô text

//   @override
//   void dispose() {
//     _locationTextController
//         .dispose(); // Hủy bỏ controller khi không cần thiết nữa
//     super.dispose();
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//     _getCurrentLocation();
//   }

//   Future<void> _getCurrentLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     // Kiểm tra xem dịch vụ vị trí đã được bật chưa
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Dịch vụ vị trí chưa được bật, xử lý tùy ý ở đây (ví dụ: hiển thị thông báo)
//       return;
//     }

//     // Kiểm tra và yêu cầu quyền truy cập vị trí nếu cần thiết
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Quyền truy cập vị trí bị từ chối, xử lý tùy ý ở đây (ví dụ: hiển thị thông báo)
//         return;
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       // Quyền truy cập vị trí bị từ chối vĩnh viễn, xử lý tùy ý ở đây (ví dụ: hiển thị thông báo)
//       return;
//     }

//     // Lấy vị trí hiện tại
//     Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );

//     setState(() {
//       _center = LatLng(position.latitude, position.longitude);
//     });

//     CameraPosition newPosition = CameraPosition(
//       target: _center,
//       zoom: 11.0,
//     );

//     mapController.animateCamera(CameraUpdate.newCameraPosition(newPosition));

//     List<Placemark> placemarks = await placemarkFromCoordinates(
//       position.latitude,
//       position.longitude,
//     );

//     if (placemarks.isNotEmpty) {
//       Placemark currentPlace = placemarks[0];

//       String currentAddress = currentPlace.name ?? '';
//       setState(() {
//         _locationTextController.text = currentAddress;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Current Location"),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: GoogleMap(
//               onMapCreated: _onMapCreated,
//               initialCameraPosition: CameraPosition(
//                 target: _center,
//                 zoom: 11.0,
//               ),
//               markers: <Marker>{
//                 Marker(
//                   markerId: MarkerId('currentLocation'),
//                   position: _center,
//                   infoWindow: const InfoWindow(title: 'Your Location'),
//                 ),
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  LatLng _center = LatLng(21.0285, 105.8542); // Tọa độ trung tâm Việt Nam

  TextEditingController _locationTextController =
      TextEditingController(); // Controller cho ô text
  String _currentAddress = ''; // Biến để lưu trữ địa chỉ hiện tại

  @override
  void dispose() {
    _locationTextController
        .dispose(); // Hủy bỏ controller khi không cần thiết nữa
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Kiểm tra xem dịch vụ vị trí đã được bật chưa
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Dịch vụ vị trí chưa được bật, xử lý tùy ý ở đây (ví dụ: hiển thị thông báo)
      return;
    }

    // Kiểm tra và yêu cầu quyền truy cập vị trí nếu cần thiết
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Quyền truy cập vị trí bị từ chối, xử lý tùy ý ở đây (ví dụ: hiển thị thông báo)
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Quyền truy cập vị trí bị từ chối vĩnh viễn, xử lý tùy ý ở đây (ví dụ: hiển thị thông báo)
      return;
    }

    // Lấy vị trí hiện tại
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _center = LatLng(position.latitude, position.longitude);
    });

    CameraPosition newPosition = CameraPosition(
      target: _center,
      zoom: 11.0,
    );

    mapController.animateCamera(CameraUpdate.newCameraPosition(newPosition));

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      Placemark currentPlace = placemarks.first;

      String currentAddress = currentPlace.street.toString() +
          ', ' +
          (currentPlace.subLocality ??
              currentPlace.locality ??
              currentPlace.subAdministrativeArea ??
              currentPlace.administrativeArea ??
              '');

      setState(() {
        _currentAddress = currentAddress;
        _locationTextController.text = _currentAddress;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Current Location"),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              markers: <Marker>{
                Marker(
                  markerId: MarkerId('currentLocation'),
                  position: _center,
                  infoWindow: const InfoWindow(title: 'Your Location'),
                ),
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _locationTextController,
              decoration: const InputDecoration(
                labelText: 'Address',
              ),
            ),
          ),
          Text(
            'Current Address: $_currentAddress',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
