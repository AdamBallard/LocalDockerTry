pipeline {
  agent any
  stages {
    stage ("Build requirements") {
      steps {
        sh """
          docker build -t hello_there .
          """
      }
    }
    stage("run pythonscripts") {
      steps {
        sh """
        docker run --rm date_converter
        docker run --rm hello_there
        """
      }
    }

  }
}
