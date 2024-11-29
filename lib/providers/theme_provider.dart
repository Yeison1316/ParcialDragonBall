import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parcial/config/theme.dart';

final colorListProvider = Provider((ref) => colorTheme);

final selectColorProvider = StateProvider((ref) => 2);
