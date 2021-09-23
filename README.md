# 				Setup Guide for Generic Telematics Platform Test

##				Table of Contents

1)	[Documentation](#documentation)

2) 	[Azure DevOps](#azure-devops)

3)	[Testing Environments and Tools](#testing-environments-and-tools)

	1) Java JDK
	2) Maven
	3) intelliJ
	4) jUnit
	5) [Cucumber](#cucumber)
	6) Test & Feedback
	7) Jenkins
	8) SonarQube
	9) jMeter

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
4) If you have them installed you can skip to [Structure](#cucumber-structure).
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

**Cucumber-Java		jUnit		Cucumber-jUnit		Selenium		Maven-Compiler-Plugin**

**Maven-Compiler-Plugin			Maven-Sunfire-Plugin		Maven-Cucumber-Reporting**	

1) Open your web browser and navigate to: [MavenRepo](https://mvnrepository.com/)
2) Search for all the dependencies and insert them into your pom.xml file inside your project. Make sure to create a section for dependencies inside your pom.xml-file.

> :warning: **Make sure you choose the same version for both Cucumber dependencies**

3) Inside the [MavenRepo](https://mvnrepository.com/) search for Maven-Compiler-Plugin or copy the dependency already in your pom.xml file. It is important that these are of the same version.
4) When you paste it inside your pom-xml file do it as a plugin **not** as a dependency. You might have to create sections yourself for plugins.
5) When you have the plugin you have to configure the source and target. We used java 8 in our project, if you use something difference you might need to use something difference in the configuration. If you are unsure, when you eventually run a maven test it will give you and error if you chose the wrong source/target.
6) In the same way as previously stated insert the remaining two plugins. These plugins do have some more detailed configuration. Use the image of our pom-file to help you navigate these. EXPAND ON THIS ->>
	


#####			Cucumber Feature Files

1) Create a feature file inside your Features folder. You do this by right-clicking the folder -> Add file and name the ending of the filename with .feature.
2) Inside the new file use the keywords in the following order: Feature:, Scenario:, Given,When,Then.

Feature: Description of the feature you are testing in this file

Scenario: Name of the testcase which we will run

Given these preconditions
When I do this
Then the result will be this

A good practice in these files is to try to keep unambiguous language. You want to keep it simple and explain what will happen not how.  

3) When you have created a scenario using Ghekrin syntax right-click on your feature file and run it.

4) After the test is complete, in your console you should find so called sniplets of Given,When,Then. You should be prompted to create methods for these. Copy them.


#####			Cucumber stepDefinition files 

1) Create a new java class in your stepDefinitions folder/package. 
2) Name it what ever suits the project most. We named it after what functionallity we were testing. 
3) Inside the java file paste your recently copied sniplets.
4) Remove the exception under the methods.
5) You may rename the methods however the tag + string that follows it must remain unchanged. This is how the feature files know what method to run.

6) Now you should concider creating a runnerClass and a class for startUps and tearDowns. It is highly recomended however not necessary.
7) If you decided not to creat these classes you can skip to ...
8) Create a runner class inside the stepDefinitions folder. You have end the class with Test due to Maven. When you run mvn test it will look for classes that end with test/Test or TEST.
9) Inside the runnerClass you need the following: 

package StepDefinitions;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        strict = true,
        features = "src/test/resources/features/",
        glue = "StepDefinitions",
        plugin = {
                "pretty", "html:target/cucumber.html",
                "json:target/cucumber.json",
                "junit:target/cucumber.xml"
        }
)
public class runnerClassTest {

}

MAKE THIS A PICTURE

@RunWith(Cucumber.class) will execute all files inside the same package as well as the files in the "glue". 
The CucumberOptions is where you can add configurations. 
features: the pathway from your project to your feature files
plugin: generates cucumber report to our target directory. You can add more options in here. 

This concludes everything you need in your runnerClass. 
Remember that you need to end the classname with Test in order to execute this via Maven.


10) Create another java file in stepDefinitions. In here you will add the setUp() and tearDown() methods. 
11) Inside our setUp() we started a desired webDriver object, here we also controlled if we wanted it to run headless or not. Here [settingsFile](https://gitlab.infotivlab.se/internal-development/telematics-platform/generic-telematics-platform-java-frontend-test/-/blob/devel/GTPTest/Automatic/WebTest/src/test/java/StepDefinitions/Start.java) you can see how we did that.



####			Cucumber Reports 

If you followed these steps, in particular the @CucumberOptions and the pom.xml plugins the target folder should contain another folder which is named **cucumber-html-reports**.
> :warning: **We noticed that sometimes we had to specify the html target in @CucumberOptions to be "html:target/cucumber-htlm-reports/cucumber.html"**

Once the folder was created once we could change it back and even if we deleted the entire target folder it was not needed again. Not sure why this solved our issue. 

Inside the cucumber-htlm-reports folder you should have a report-feature-xx.html file. 
Right-click - > Open in -> Browser -> then pick what ever browser you prefer. 

This should open the report for a specific feature.

In Jenkins the Cucumber Reports plugin merge these files together. More about that in [Jenkins](#jenkins). 



####			Test & Feedback








####			Jenkins









####			SonarQube









####			jMeter

















###				GitLab					
