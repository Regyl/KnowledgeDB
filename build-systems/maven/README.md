#Introduction

# Content
1. [Build phases](#build-phases) - defined in accordance to execution order
   1. [Clean](#clean)
   2. Default
      1. [Validate](#validate)
      2. [Compile](#compile)
      3. [Test](#test)
      4. [Package](#package)
      5. [Verify](#verify)
      6. [Install](#install)
      7. [Deploy](#deploy)
   3. [Site](#site)
2. [Dependency discoverer](#dependency-discoverer)
3. [Links](#links)

## Build phases
1. clean - project cleaning
2. default:
   1. validate - validate the project is correct and all necessary information is available
   2. compile - compile the source code of the project
   3. test - test the compiled source code using a suitable unit testing framework. These tests should not require the code be packaged or deployed
   4. package - take the compiled code and package it in its distributable format, such as a JAR.
   5. verify - run any checks on results of integration tests to ensure quality criteria are met
   6. install - install the package into the local repository, for use as a dependency in other projects locally
   7. deploy - done in the build environment, copies the final package to the remote repository for sharing with other developers and projects.
3. site - creation of your project's website

### Clean
Also include:
- pre-clean
- clean
- post-clean
### Validate
Also include:
- initialize — Подготавливается окружение сборки, вычисляются значения переменных, создаются необходимые директории и так далее
- generate-sources — Генерируется исходный код для компиляции с кодом проекта
- process-sources — Исходный код проекта (включая сгенерированный ранее) обрабатывается перед компиляцией
- generate-resources — Генерируются ресурсы проекта
- process-resources — Ресурсы проекта (включая сгенерированные) обрабатываются перед компиляцией
### Compile
Also include:
- process-classes — Скомпилированные классы дополнительно обрабатываются.
- generate-test-sources — Генерируется исходный код для компиляции совместно с тестами
- process-test-sources — Исходный код тестов (включая сгенерированный ранее) обрабатывается перед компиляцией тестов
- generate-test-resources — Генерируются тестовые ресурсы проекта
- process-test-resources- Тестовые ресурсы проекта (включая сгенерированные) обрабатываются перед компиляцией тестов
- test-compile — Компилируется исходный код тестов
- process-test-classes — Скомпилированные классы тестов дополнительно обрабатываются.
### Test
Also include:
- prepare-package — Выполняются процедуры по подготовке к упаковке в пакет. Обычно в этой фазе полностью формируется содержимое будущего пакета
### Package
Also include:
- pre-integration-test — Подготовка окружения к запуску интеграционных тестов
- integration-test — Выполнение интеграционных тестов
- post-integration-test — Очистка окружения после интеграционных тестов
### Verify
### Install
### Deploy
### Site
Include:
- pre-site
- site
- post-site
- site-deploy

## Dependency discoverer
There are 2 basic repository types: *local* and *remote*. During 
project building, dependencies firstly searches in local repos, and only
after this in remote repos.

## Links
- [(RU) Repository types](https://proselyte.net/tutorials/maven/repositories/)