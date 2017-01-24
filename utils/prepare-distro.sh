#!/bin/bash

# ***************************************************
#
# Préparation des exécutables du générateur
#
# ***************************************************
#
# Organisation des projets dans l'arborescence
# Les projets C# et Java sont tous rassemblés dans
# un même répertoire (par exemple : SedaGenerator)
# 
# Le répertoire du projet C# est nommé C#-Seda-Generator
# Le répertoire du projet Java CGI est nommé CGI-Java-Seda-Generator
# Le répertoire du projet Java CD56 est nommé CD56-Java-Seda-Generator
# Le répertoire des exécutables (ce projet) est nommé Distribution-Executables
#
# ***************************************************

# On se place dans le répertoire parent
cd ..

# Copie des exécutables C#
echo Suppression des exécutables C#
rm *.exe
rm *.exe.config
rm *.dll

echo Copie des exécutables C#
cp ../C#-Seda-Generator/BusinessDataController/bin/Release/* .
cp ../C#-Seda-Generator/RngProfileControllerTester/bin/Release/* .
cp ../C#-Seda-Generator/SedaSummaryGeneratorTester/bin/Release/* .
cp ../C#-Seda-Generator/RngProfileControllerTester/bin/Release/* .

echo Purge des fichiers indésirables
rm *.pdb
rm *.vshost.exe.config
rm *.vshost.*

# Copie des exécutables Java CD56
echo Suppression des exécutables java CD56
[ ! -e lib-cd56 ] && mkdir lib-cd56
rm lib-cd56/*

echo Copie des exécutables Java
cp ../CD56-Java-Seda-Generator/target/lib/* lib-cd56
cp ../CD56-Java-Seda-Generator/target/JavaSedaProfileGenerator-*.jar lib-cd56

# Copie des exécutables Java CGI
echo Suppression des exécutables java CGI
[ ! -e lib-cgi ] && mkdir lib-cgi
rm lib-cgi/*

echo Copie du ZIP CGI
cp ../CGI-Java-Seda-Generator/target/*.zip lib-cgi
cp ../CGI-Java-Seda-Generator/target/*.jar lib-cgi

echo Copie de la documentation
rm -rf Documentation
cp -r ../C#-Seda-Generator/Documentation .

# On revient dans utils
cd -

echo Copie achevée
