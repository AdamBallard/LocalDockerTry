pipeline {
  agent any
  stages {
    stage('Install dependencies') {
       steps {
          sh 'pip install pytz'
         }
       }
    stage ("Build Modules") {
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
