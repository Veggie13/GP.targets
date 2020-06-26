# GP.targets
 MSBuild targets for GPLEX and GPPG integration.
 
 This repository contains the **GP.targets** file and a test project for testing the targets in a real project.
 
 For these targets to work, you will need to install **GPLEX** and **GPPG**. They can be found here:
 - [GPLEX Codeplex Archive](https://archive.codeplex.com/?p=gplex)
 - [GPPG Codeplex Archive](https://archive.codeplex.com/?p=gppg)
 or else you can use one of the repositories forked and extended on GitHub.
 
 The **GP.targets** file can be used in a project without modification. You will either have to define ***$(GplexExe)*** and ***$(GppgExe)*** in your project, or else ensure **gplex.exe** and **gppg.exe** are in your environment *PATH*.
 
 You must import **GP.targets** into your project as follows:
 ```
 <Import Project="GP.targets" />
 ```
 You will have to otherwise set up your project as you normally would to use code generated by GPLEX and GPPG, including referencing *QUT.ShiftReduceParser*.
 
 **GPTest.csproj** implements the lex/yacc example as presented in https://github.com/jengelsma/lex-tutorial and https://github.com/jengelsma/yacc-tutorial but in C# instead.
