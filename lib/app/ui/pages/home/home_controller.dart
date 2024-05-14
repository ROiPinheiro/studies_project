import 'package:signals/signals_flutter.dart';
import 'package:studies_project/app/user.dart';
import 'package:studies_project/app/value_objects/age_vo.dart';
import 'package:studies_project/app/value_objects/name_vo.dart';

final userSignal = signal<User?>(null);

final nameSignal = signal<NameVO?>(null);
final nameSignalError = computed<String?>(() => nameSignal()?.validate());

final ageSignal = signal<AgeVO?>(null);
final ageSignalError = computed<String?>(() => ageSignal()?.validate());

class HomeController {
  void validateName(String name) {
    nameSignal.value = NameVO(name);
  }

  void validateAge(String age) {
    ageSignal.value = AgeVO(age);
  }

  void submit(String name, String age) {
    userSignal.set(User(
      name: NameVO(name),
      age: AgeVO(age),
    ));

    // userSignalErrors.value = userSignal.value?.validate();
  }
}
