pipeline {
  agent any
  stages {
    stage ("Build hello there") {
      steps {
        sh """
          docker build -t hello_there .
          """
      }
    }
    stage("run hello there") {
      steps {
        sh """
          docker run --rm hello_there
          """
      }
    }
    
    stage("run dateconverter") {
      steps {
        sh """
          docker run --rm date_converter
          """
      }
    }
  }
}
