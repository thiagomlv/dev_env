# Repositório de Estudos - Docker, ROS2 e Gazebo

    Bem-vindo ao repositório de estudos da **Equipe Harpia**. Este repositório centraliza o conhecimento sobre Docker, ROS2 e Gazebo.

## Como usar este repositório

### 1. Clonar o repositório


    git clone git@github.com:harpia-drones/Estudos.git
    cd Estudos


### 2. Construir e iniciar o container

Use o Docker Compose para construir e iniciar o ambiente:

    docker compose up -d

### 3. Acessar o container

Para acessar o terminal do container, utilize:

    docker exec -it ros2-humble-gazebo /bin/bash

## Estrutura do diretório

```
    Estudos/
    ├── estudos_ws/
    │   └── src/
    ├── compose.yaml
    └── Dockerfile
```

## Descrição dos arquivos

- **compose.yaml**: Configuração do Docker Compose para o container.
- **Dockerfile**: Especificações para construir a imagem do ROS2 e Gazebo.

