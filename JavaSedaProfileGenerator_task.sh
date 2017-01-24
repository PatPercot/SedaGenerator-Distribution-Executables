#! /bin/sh
# Ce script permet de lancer le générateur de bordereaux Java
# PARAMETRES :
# - task : tâche à exécuter dans le fichier de configuration job.config
# CODES D'ERREUR :
# - 0 : Succès.
# - 1 : Erreur grave, non tracées dans OUT_SUMMARY
# - 2 : Erreurs, tracées dans OUT_SUMMARY

#ARGUMENTS
TASK=$1

#LIB
ANTLR_LIB=lib/antlr-2.7.7.jar
ANTLR_RUNTIME_LIB=lib/antlr-runtime-3.5.jar
CHEMISTRY_OPENCMIS_CLIENT_API_LIB=lib/chemistry-opencmis-client-api-0.13.0.jar
CHEMISTRY_OPENCMIS_CLIENT_BINDINGS_LIB=lib/chemistry-opencmis-client-bindings-0.13.0.jar
CHEMISTRY_OPENCMIS_CLIENT_IMPL_LIB=lib/chemistry-opencmis-client-impl-0.13.0.jar
CHEMISTRY_OPENCMIS_CLIENT_COMMONS_API_LIB=lib/chemistry-opencmis-commons-api-0.13.0.jar
CHEMISTRY_OPENCMIS_CLIENT_COMMONS_IMPL_LIB=lib/chemistry-opencmis-commons-impl-0.13.0.jar
CHEMISTRY_OPENCMIS_CLIENT_SERVER_SUPPORT_LIB=lib/chemistry-opencmis-server-support-0.13.0.jar
COMMONS_LANG_LIB=lib/commons-lang-2.3.jar
LOGBACK_LIB=lib/logback-classic-1.0.7.jar
LOGBACK_CORE_LIB=lib/logback-core-1.0.7.jar
POSTGRESQL_LIB=lib/postgresql-9.4-1201-jdbc41.jar
SERIALIZER_LIB=lib/serializer-2.7.1.jar
SLF4J_LIB=lib/slf4j-api-1.7.12.jar
STAX2_LIB=lib/stax2-api-3.1.4.jar
STRINGTEMPLATE_LIB=lib/stringtemplate-3.2.1.jar
WOODSTOX_LIB=lib/woodstox-core-asl-4.4.0.jar
XALAN_LIB=lib/xalan-2.7.1.jar
XMLAPIS_LIB=lib/xml-apis-1.3.04.jar
JAVASEDAPROFILEGENERATOR=lib/JavaSedaProfileGenerator-1.0.1.jar

JAVA_BIN=java

CLASSPATH=$ANTLR_LIB:$ANTLR_RUNTIME_LIB:$CHEMISTRY_OPENCMIS_CLIENT_API_LIB:$CHEMISTRY_OPENCMIS_CLIENT_BINDINGS_LIB:$CHEMISTRY_OPENCMIS_CLIENT_IMPL_LIB:$CHEMISTRY_OPENCMIS_CLIENT_COMMONS_API_LIB:$CHEMISTRY_OPENCMIS_CLIENT_COMMONS_IMPL_LIB:$CHEMISTRY_OPENCMIS_CLIENT_SERVER_SUPPORT_LIB:$COMMONS_LANG_LIB:$LOGBACK_LIB:$LOGBACK_CORE_LIB:$POSTGRESQL_LIB:$SERIALIZER_LIB:$SLF4J_LIB:$STAX2_LIB:$STRINGTEMPLATE_LIB:$WOODSTOX_LIB:$XALAN_LIB:$XMLAPIS_LIB:$JAVASEDAPROFILEGENERATOR:$LOGBACK_DIR
$JAVA_BIN -classpath $CLASSPATH unit.SedaGeneratorUnit ./sedaGeneratorUnit.properties ./job.config $TASK
