// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.58.2.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member

import "bridge_definitions.dart";
import 'dart:convert';
import 'dart:async';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'bridge_generated.dart';
export 'bridge_generated.dart';
import 'package:meta/meta.dart';

class NativeRustPlatform extends FlutterRustBridgeBase<NativeRustWire>
    with FlutterRustBridgeSetupMixin {
  NativeRustPlatform(FutureOr<WasmModule> dylib)
      : super(NativeRustWire(dylib)) {
    setupMixinConstructor();
  }
  Future<void> setup() => inner.init;

// Section: api2wire

// Section: finalizer

}

// Section: WASM wire module

@JS('wasm_bindgen')
external NativeRustWasmModule get wasmModule;

@JS()
@anonymous
class NativeRustWasmModule implements WasmModule {
  external Object /* Promise */ call([String? moduleName]);
  external NativeRustWasmModule bind(dynamic thisArg, String moduleName);
  external dynamic /* void */ wire_platform(NativePortType port_);

  external dynamic /* void */ wire_rust_release_mode(NativePortType port_);

  external dynamic /* void */ wire_start(NativePortType port_);
}

// Section: WASM wire connector

class NativeRustWire
    extends FlutterRustBridgeWasmWireBase<NativeRustWasmModule> {
  NativeRustWire(FutureOr<WasmModule> module)
      : super(WasmModule.cast<NativeRustWasmModule>(module));

  void wire_platform(NativePortType port_) => wasmModule.wire_platform(port_);

  void wire_rust_release_mode(NativePortType port_) =>
      wasmModule.wire_rust_release_mode(port_);

  void wire_start(NativePortType port_) => wasmModule.wire_start(port_);
}
