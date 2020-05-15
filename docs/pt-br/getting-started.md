# Iniciando

## Instalação

A primeira coisa que precisamos fazer é adicionar o package form como uma dependência no `pubspec.yaml`.

```yaml
dependencies:
  form: ^0.0.3+2
```

Agora precisamos instalar o form.

```bash
flutter pub get
```

!> Execute o comando no mesmo diretório em que se encontra o arquivo `pubspec.yaml`.

?> Como alternativa, seu editor pode suportar `flutter pub get`. Verifique os documentos do seu editor para saber mais.

## Importação

Agora, no seu código Dart, você pode usar:

```dart
import 'package:form/form.dart';
```
