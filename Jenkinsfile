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
    stage("run pythonscripts") {
      steps {
        sh """
        docker run --rm hello_there
        docker run --rm date_converter
        
        """
      }
    }

  }
}
