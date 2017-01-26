@echo off
REM ***************************************************
REM
REM Préparation des exécutables du générateur
REM
REM ***************************************************
REM
REM Organisation des projets dans l'arborescence
REM Les projets C# et Java sont tous rassemblés dans
REM un même répertoire (par exemple : SedaGenerator)
REM 
REM Le répertoire du projet C# est nommé C#-Seda-Generator
REM Le répertoire du projet Java CGI est nommé CGI-Java-Seda-Generator
REM Le répertoire du projet Java CD56 est nommé CD56-Java-Seda-Generator
REM Le répertoire des exécutables (ce projet) est nommé Distribution-Executables
REM
REM ***************************************************


REM On se place dans le répertoire parent
cd ..

REM Copie des exécutables C#
echo Suppression des exécutables C#

echo Copie des exécutables C#
copy ..\C#-Seda-Generator\BusinessDataController\bin\Release\* . 1>NUL
copy ..\C#-Seda-Generator\RngProfileControllerTester\bin\Release\* . 1>NUL
copy ..\C#-Seda-Generator\SedaSummaryGeneratorTester\bin\Release\* . 1>NUL
copy ..\C#-Seda-Generator\RngProfileControllerTester\bin\Release\* . 1>NUL
copy ..\C#-Seda-Generator\HOWTO-* . 1>NUL
copy ..\C#-Seda-Generator\versions.txt . 1>NUL


echo Purge des fichiers indésirables
del *.pdb
del *.vshost.exe.config
del *.vshost.*

REM Copie des exécutables Java CD56
echo Suppression des exécutables java CD56
if not exist lib-cd56 mkdir lib-cd56
del /Q lib-cd56\*

echo Copie des exécutables Java CD56
copy ..\CD56-Java-Seda-Generator\target\lib\* lib-cd56 1>NUL
copy ..\CD56-Java-Seda-Generator\target\JavaSedaProfileGenerator-*.jar lib-cd56 1>NUL

REM Copie des exécutables Java CGI
echo Suppression des exécutables java CGI
if not exist lib-cgi mkdir lib-cgi
del /Q lib-cgi\*

echo Copie du ZIP CGI
copy ..\CGI-Java-Seda-Generator\target\*.zip lib-cgi 1>NUL
copy ..\CGI-Java-Seda-Generator\target\*.jar lib-cgi 1>NUL

echo Copie de la documentation
rmdir /S /Q Documentation
mkdir Documentation
xcopy /S /Q /Y ..\C#-Seda-Generator\Documentation Documentation 1>NUL

REM On revient dans utils
cd utils

echo Copie achevée
