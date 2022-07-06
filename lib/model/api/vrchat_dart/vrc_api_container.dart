import 'package:path_provider/path_provider.dart';
import 'package:vrc_finder/model/api/vrchat_dart/vrc_api_container_base.dart';
import 'package:vrchat_dart/vrchat_dart.dart';

const userAgent = 'vrc_finder';

class VrcApiContainer implements VrcApiContainerBase {
  @override
  Future<VrchatDart> create() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final appDocPath = appDocDir.path;

    return VrchatDart(userAgent: userAgent, cookiePath: appDocPath);
  }
}