import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shellScaffoldKeyProvider = Provider((ref) => GlobalKey<ScaffoldState>());
