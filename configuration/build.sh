#!/usr/bin/env bash

set -e

# Configuración de credenciales Git
git config --global credential.helper 'cache --timeout=3600'
git_credential_fill() {
    echo url="$GIT_REPOSITORY"
    echo username="$GIT_USERNAME"
    echo password="$GIT_PASSWORD"
}
git_credential_fill | git credential approve

# Clonación del Repositorio de Código
git clone --depth 1 --branch "$GIT_BRANCH" "$GIT_REPOSITORY" "$CODE_DIR"

# Navegación al Directorio del Proyecto Karavan
if [ ! -d "$CODE_DIR/$PROJECT_ID" ]; then
    echo "Error: El directorio del proyecto '$CODE_DIR/$PROJECT_ID' no existe."
    exit 1
fi
cd "$CODE_DIR/$PROJECT_ID"

# Gestión de Archivos de Configuración Específicos por Entorno
if [ -n "$ENVIRONMENTS" ] && [ -n "$ENVIRONMENT" ]; then
    IFS=',' read -r -a envs <<< "$ENVIRONMENTS"
    for env in "${envs[@]}"; do
        if [ "$env" != "$ENVIRONMENT" ]; then
            rm -f "${env}."* || true
        fi
    done

    for prefixed_file in "${ENVIRONMENT}."*; do
        corresponding_file=${prefixed_file#"$ENVIRONMENT."}
        if [[ -f "$corresponding_file" ]]; then
            rm -f "$corresponding_file" || true
        fi
        mv "$prefixed_file" "$corresponding_file"
    done
fi

# Exportación del Proyecto Karavan con JBang
if ! command -v jbang &> /dev/null; then
    echo "Error: JBang no está instalado. Instálalo para continuar."
    exit 1
fi
jbang -Dcamel.jbang.version="$CAMEL_VERSION" camel@apache/camel export --local-kamelet-dir="$KAMELETS_DIR"

# Compilación y Construcción de la Imagen Docker con Jib
mvn clean package jib:build \
  -Djib.containerizingMode=exploded \
  -Djib.allowInsecureRegistries=true \
  -Djib.from.image=registry.access.redhat.com/ubi9/openjdk-21-runtime \
  -Djib.container.creationTime=USE_CURRENT_TIMESTAMP \
  -Djib.container.labels=org.apache.camel.karavan/type=packaged,org.apache.camel.karavan/projectId="$PROJECT_ID" \
  -Djib.to.image="$IMAGE_REGISTRY/$IMAGE_GROUP/$PROJECT_ID:$TAG" \
  -Djib.to.auth.username="$IMAGE_REGISTRY_USERNAME" \
  -Djib.to.auth.password="$IMAGE_REGISTRY_PASSWORD"