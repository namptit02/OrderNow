import 'package:flutter/material.dart';
import 'package:flutter_application_chuyenman/network/remote/models/cart_item.dart';
import 'package:flutter_application_chuyenman/view/bill/bill_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class MapScreen extends StatefulWidget {
  // const MapScreen({Key? key, required List<CartItem> cartItems}) : super(key: key);
  final List<CartItem> cartItems;
  final int totalPrice;
  final String phoneNumber;
  final String userName;
  const MapScreen({
    Key? key,
    required this.cartItems,
    required this.totalPrice,
    required this.phoneNumber,
    required this.userName,
  }) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  LatLng _center = const LatLng(21.0285, 105.8542); // Tọa độ trung tâm Việt Nam

  final TextEditingController _locationTextController =
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

      String currentAddress =
          '${currentPlace.street}, ${currentPlace.subLocality ?? currentPlace.locality ?? currentPlace.subAdministrativeArea ?? currentPlace.administrativeArea ?? ''}';

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
                  markerId: const MarkerId('currentLocation'),
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
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BillScreen(
                    cartItems:
                        widget.cartItems, // Truyền giá trị cartItems từ widget
                    currentAddress: _currentAddress,
                    totalPrice: widget.totalPrice,
                    phoneNumber: widget.phoneNumber, userName: widget.userName,
                    removeCartItems: () {},
                  ),
                ),
              );
            },
            child: const Text('OK'),
          )
        ],
      ),
    );
  }
}
