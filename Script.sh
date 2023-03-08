File=pom.xml
File1=build.gradle
if test -f "$File"; then
     echo "Welcome to Maven"
     echo "Maven build started"
     mvn clean package
     echo "Maven build completed"
elif test -f "$File1"; then
     echo "Welcome to Gradle"
     echo "Gradle build started"
      ./gradlew clean build
     echo "Gradle build completed"
else
     echo "invalid"
fi
 
  
 

