pipeline {
  agent any
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
    stage ("Build") {
      steps {
        sh """
          docker build -t dateConverter .
          """
      }
    }
    stage("run") {
      steps {
        sh """
          docker run --rm dateConverter
          """
      }
    }
  }
}
