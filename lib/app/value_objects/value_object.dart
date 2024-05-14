import 'package:equatable/equatable.dart';

abstract class ValueObject<T> extends Equatable {
  final T value;

  const ValueObject(this.value);

  String? validate();

  @override
  String toString() => '$value';
}
