# 				Setup Guide for Generic Telematics Platform Test

##				Table of Contents

1)	[Documentation](#documentation)

2) 	[Azure DevOps](#azure-devops)

3)	[Testing Environments and Tools](#testing-environments-and-tools)

	* Java JDK
	* Maven
	* intelliJ
	* jUnit
	* Cucumber
	* Test & Feedback
	* Jenkins
	* SonarQube
	* jMeter

4)	[GitLab](#gitlab)

	* SSH
	* Repository
	* Webhook 
	* Terminal







###				Documentation	



###				Azure DevOps	





###				Testing Environments and Tools


####			Java JDK


####			jUnit







####			Cucumber

> :warning: **You must install JDK, IntelliJ & Maven prior to this**: If you skipped ahead to this stage make sure you have them installed since Cucumber will require them! 

#####			Cucumber plugins in IntelliJ

1) Open a new Maven project in IntelliJ
2) Go to Settings / Preferences in your project. Ctrl + Alt + S
3) Make sure that you have yet to install the Gherkin, Cucumber for Java and Cucumber for Grovy plugins. 
4) If you have them installed you can skip the rest of this section.
5) Switch to marketplace inside the Plugins tab.
6) Install Gherkin, Cucumber for Java and Cucumber for Grovy in that order.


#####			Cucumber Structure

1) Make sure you created a Maven project by checking if there is a pom.xml file in your project. It should be located as far out as your project folder.

2) If Maven has not done it already create the following structure. 
TA BILD AV PROJEKT STRUKTUREN OCH KLISTRA IN HÄR :)
	* To mark your folder right-clicking on desired folder -> Mark folder as -> xxx
	* Follow the same structure as the picture shows.

3) Your Cucumber files, also referred to as featurefiles, will go into the Test Resources Root directory/features folder. You create these by right-clicking the features folder -> New File then entre a name.feature. Important that you finish the name with .feature to help the program identify that this will be a cucumber file. If you were successful this file should turn green shortly after you create it. 

4) To make your feature files acutally run you need a backend file. In our case they will be java files. They are placed inside your src/test/java/stepDefinitions directory. Create these by right-clicking the folder -> Java Class then entre a desired name.

5) You will need to create a runnerClassTest inside the stepDefinition package folder. This class will hold your cucumberOptions to help the program navigate which java files are conected to which features/scenarios. 

6) To keep things clean and independent I highly recommend to create a java class to hold your setUp methods and your tearDowns. However this is not a must but a good practice. 




#####			Cucumber Dependencies and Plugins


Here we will go thorugh what dependencies and plugins you will need to run Cucumber with Maven. 

**Cucumber-Java		jUnit		Cucumber-jUnit		Selenium**

**Maven-Compiler-Plugin			Maven-Sunfire-Plugin		Maven-Cucumber-Reporting**	

1) Open your web browser and navigate to: [MavenRepo](https://mvnrepository.com/)
2) Search for all the dependencies and insert them into your pom.xml file inside your project.

> :warning: **Make sure you choose the same version for both Cucumber dependencies**

3) <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.8.1</version>
                <configuration>
                    <source>1.8</source>
                    <target>1.8</target>
                </configuration>
            </plugin>




	









####			Test & Feedback








####			Jenkins









####			SonarQube









####			jMeter

















###				GitLab								
