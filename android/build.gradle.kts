
buildscript {
    ext.kotlin_version = '1.8.0' // Update as per your project needs

    repositories {
        google()
        mavenCentral()
    }

    dependencies {
        classpath 'com.android.tools.build:gradle:7.3.1' // Update Gradle version as needed
        classpath 'com.google.gms:google-services:4.3.15' // Corrected Firebase dependency
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

tasks.register("clean", Delete) {
    delete rootProject.buildDir
}
