import 'package:studies_project/app/value_objects/value_object.dart';

class NameVO extends ValueObject<String> {
  const NameVO(super.value);

  @override
  String? validate() {
    if (value.isEmpty) {
      return 'Nome obrigatório';
    }

    return null;
  }

  @override
  List<Object?> get props => [super.value];
}
