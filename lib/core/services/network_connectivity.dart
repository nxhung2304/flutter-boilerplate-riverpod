import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkConnectivity {
  final Connectivity _connectivity;

  NetworkConnectivity([Connectivity? connectivity])
    : _connectivity = connectivity ?? Connectivity();

  Future<bool> isConnected() async {
    final List<ConnectivityResult> connectivityResult =
        await _connectivity.checkConnectivity();

    // Return false only if no connection is available
    return !connectivityResult.contains(ConnectivityResult.none);
  }
}
