# studies_project

A project to test some things and libs.


## How to Run

- clone this project
- run `flutter pub get`
- run `derry init`
- create an android emulator or connect a physical phone on debug mode
- run `flutter devices`
- run `flutter run -d {device name}`

> Example:
>
> `flutter devices`
> The following devices were found:
sdk gphone64 x86 64 (mobile) • emulator-5554 • android-x64    • Android 13 (API 33) (emulator)
> `flutter run -d "emulator-5554"`

## Husky + Lint Staged

Husky git-hooks with lint_staged are configure to execute dart clean-up commands on `pre-commit`

## Derry commands

> Derry is a script manager for Dart.

Like `npm` scripts, `derry` can run scripts on dart project. On this project, all `derry` script are on [derry.yaml](./derry.yaml)

All can be executed with `dart run derry {command}` or `derry {command}` if installed globally (see `derry` [docs](https://pub.dev/packages/derry) to more info).

List of commands:

- lint: execute `dart fix` and `dart lint` on all project. 