pipeline {
  agent { label "linux" }
  stages {
    stage ("Build") {
      steps {
        sh """
          docker build -t hello_there .
          """
      }
    }
    stage("run") {
      steps {
        sh """
          docker run --rm hello_there
          """
      }
    }
  }
}
