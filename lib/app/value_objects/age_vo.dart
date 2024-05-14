import 'package:studies_project/app/value_objects/value_object.dart';

enum AgeVOErrors {
  required('Idade obrigatória'),
  lessThanEighteenYears('Deve ter ao maior 18 anos'),
  moreThanOneHundredYears('Não pode ter mais que 100 anos');

  final String message;
  const AgeVOErrors(this.message);
}

class AgeVO extends ValueObject<String> {
  const AgeVO(super.value);

  @override
  String? validate() {
    final parsedValue = int.tryParse(value) ?? 0;

    if (parsedValue == 0) {
      return AgeVOErrors.required.message;
    }
    if (parsedValue < 18) {
      return AgeVOErrors.lessThanEighteenYears.message;
    }
    if (parsedValue > 100) {
      return AgeVOErrors.moreThanOneHundredYears.message;
    }

    return null;
  }

  @override
  List<Object?> get props => [super.value];
}
