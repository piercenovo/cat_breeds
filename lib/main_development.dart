import 'package:cat_breeds/app/app.dart';
import 'package:cat_breeds/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
