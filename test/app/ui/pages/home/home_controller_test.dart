import 'package:flutter_test/flutter_test.dart';
import 'package:signals/signals_flutter.dart';
import 'package:studies_project/app/ui/pages/home/home_controller.dart';
import 'package:studies_project/app/value_objects/age_vo.dart';
import 'package:studies_project/app/value_objects/name_vo.dart';

void main() {
  late HomeController homeController;

  setUp(() {
    homeController = HomeController();
  });

  group('HomeController validate tests', () {
    test('Should update ageSignal when call homeController.validateAge', () {
      final ageStream = ageSignal.toStream();

      homeController.validateAge('15');
      homeController.validateAge('25');

      final expected = [
        null,
        const AgeVO('15'),
        const AgeVO('25'),
      ];

      expect(ageStream, emitsInOrder(expected));
    });

    test('Should update nameSignal when call homeController.validateName', () {
      final nameStream = nameSignal.toStream();

      homeController.validateName('Joe');
      homeController.validateName('Doe');

      final expected = [
        null,
        const NameVO('Joe'),
        const NameVO('Doe'),
      ];

      expect(nameStream, emitsInOrder(expected));
    });

    test('Should update ageSignalError when call homeController.validateAge',
        () {
      final stream = ageSignalError.toStream();

      homeController.validateAge('101');
      homeController.validateAge('15');
      homeController.validateAge('');
      homeController.validateAge('25');

      expect(
          stream,
          emitsInOrder([
            null,
            AgeVOErrors.moreThanOneHundredYears.message,
            AgeVOErrors.lessThanEighteenYears.message,
            AgeVOErrors.required.message,
            null,
          ]));
    });
  });
}
