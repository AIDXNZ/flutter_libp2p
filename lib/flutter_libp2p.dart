export 'flutter_libp2p.dart';
import 'dart:async';
import 'dart:math';

import 'ffi.dart' if (dart.library.html) 'ffi_web.dart';
import 'package:cbor/cbor.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'dart:convert';
import 'package:network_info_plus/network_info_plus.dart';

final wsUrl = Uri.parse('ws://localhost:9002');
var channel = WebSocketChannel.connect(wsUrl);

Future<void> start() async {
  api.start();
}

Future<String> get_ip() async {
  final info = NetworkInfo();
  var wifiIP = await info.getWifiIP();
  print(wifiIP);
  return wifiIP.toString();
}

// Local
Future<String> localPeerId() async {
  var enc = cbor.encode(CborMap({
    CborString("local_peer_id"):
        CborMap({CborString("local_peer_id"): CborString("")})
  }));
  channel.sink.add(enc);
  String pid = "Bruh";
  return channel.stream
      .asBroadcastStream()
      .firstWhere((element) => element != null)
      .then((value) => {
            print(value),
            pid = value.toString(),
          })
      .then((value) => pid);
}

Future<void> dial(List<String> toDial) async {
  final wsUrl = Uri.parse('ws://localhost:9002');
  var channel = WebSocketChannel.connect(wsUrl);
  CborList addrs = CborList([]);
  for (var e in toDial) {
    addrs.add(CborString(e));
  }

  var enc = cbor.encode(CborMap({
    CborString("local_peer_id"): CborMap({CborString("dial_addrs"): addrs})
  }));
  channel.sink.add(enc);
}

Future<Stream> events() async {
  return api.eventStream();
}
