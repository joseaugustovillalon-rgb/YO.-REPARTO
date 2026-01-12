# Secuencia recomendada
git add .github/
git commit -m "Add GitHub Actions workflows"
git push

git add .gitignore README.md LICENSE
git commit -m "Add project documentation"
git push

git add gradle/ gradlew gradlew.bat
git commit -m "Add Gradle wrapper"
git push

git add build.gradle settings.gradle gradle.properties
git commit -m "Add Gradle configuration"
git push

git add app/build.gradle app/proguard-rules.pro
git commit -m "Add app module configuration"
git push

git add app/src/main/AndroidManifest.xml
git commit -m "Add Android manifest"
git push

git add app/src/main/res/
git commit -m "Add app resources"
git push

git add app/src/main/java/
git commit -m "Add Kotlin source code"
git push

# Finalmente subir todo lo restante
git add .
git commit -m "Complete project structure"
git push
