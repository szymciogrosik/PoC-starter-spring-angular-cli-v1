call cd ..
call gradlew cleanModules
call gradlew buildAngular
call gradlew buildFrontend
call gradlew copyFrontendJar
call gradlew buildBackend
call cd scriptWindows