# Matrix Rotation App

Este proyecto de Flutter implementa una aplicación que permite a los usuarios interactuar con matrices numéricas y rotarlas en sentido antihorario. Utiliza el paquete `flutter_riverpod` junto con `riverpod_generator` para la gestión eficiente del estado y la inyección de dependencias. Además, emplea `fvm` para manejar la versión de Flutter utilizada, garantizando consistencia en el entorno de desarrollo.

## Características

- Visualización de matrices numéricas en forma de cuadrícula.
- Rotación de matrices en sentido antihorario mediante una interfaz de usuario intuitiva.
- Uso de toasts nativos para mostrar el estado anterior de la matriz antes de su rotación.

## Tecnologías Utilizadas

- [Flutter](https://flutter.dev/) manejado por [FVM (Flutter Version Management)](https://fvm.app/)
- [Riverpod](https://riverpod.dev/)
- Toasts nativos mediante canales de plataforma específicos para Android y iOS.

# Estructura del Proyecto

Este documento describe la estructura de directorios del proyecto `Matrix Rotation App`, organizada para facilitar la escalabilidad y el mantenimiento. Es crucial que todas las nuevas características sigan esta estructura para asegurar la consistencia y facilitar la integración y el mantenimiento.

## Directorio Raíz

- **src/**: Contiene el código fuente principal de la aplicación.
  - **main.dart**: Punto de entrada de la aplicación Flutter.
  - **app_startup.dart**: Manejan la configuración inicial.
  - **router/app_router.dart**: Gestiona la navegación y el ruteo dentro de la aplicación.
  - **app.dart**: Contiene el widget principal de la aplicación.
  - **localization/**: Maneja la localización y la internacionalización.
  - **constants/**: Define las constantes utilizadas a través de la aplicación.

## Features

Cada característica de la aplicación se encuentra en su propio subdirectorio dentro de `features`, diseñado para una fácil escalabilidad y mantenimiento. Cada nueva característica debe incluir al menos las siguientes subcarpetas:

- **domain/**: Contiene la lógica de negocio y las entidades de dominio.
- **repository/**: Capa de abstracción que maneja la comunicación con fuentes de datos externas.
- **providers/**: Proveedores de Riverpod específicos para la gestión del estado de la característica.
- **presentation/**: Contiene los widgets y UI relacionados con la funcionalidad.

### Ejemplo de estructura para una nueva característica

- **features/**
  - **new_feature/**: Nombre de la nueva característica.
    - **domain/**: Define la lógica y las entidades relacionadas con `new_feature`.
    - **repository/**: Gestiona el almacenamiento y la recuperación de datos de `new_feature`.
    - **providers/**: Proveedores de estado para `new_feature`.
    - **presentation/**: UI y widgets específicos para `new

## Requisitos Previos

Para ejecutar este proyecto, necesitarás tener instalado Flutter a través de FVM en tu entorno de desarrollo. Sigue las instrucciones en [FVM Documentation](https://fvm.app/docs/getting_started/overview) para instalar FVM y configurar la versión de Flutter recomendada para este proyecto.

## Configuración del Proyecto

1. Clona este repositorio en tu máquina local:

```sh
git clone https://github.com/EdHuamani/flutter_matrix_app.git
cd flutter_matrix_app
```

2. Asegúrate de estar usando la versión correcta de Flutter a través de FVM:

```sh
fvm use stable
```

3. Instala las dependencias del proyecto:

```sh
fvm flutter pub get
```

4. Ejecuta el generador de código para Riverpod:

```sh
fvm flutter pub run build_runner build --delete-conflicting-outputs
```

## Ejecución de la Aplicación

Para ejecutar la aplicación en un emulador o dispositivo conectado, utiliza FVM para asegurar el uso de la versión correcta de Flutter:

```sh
fvm flutter run
```
