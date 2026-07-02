#!/bin/bash

# --- Configurações / Configuration ---
REPO_URL="https://aur.archlinux.org/antigravity-ide.git"
BUILD_DIR="$HOME/antigravity-build"

# Cores / Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # Sem cor / No color

# Interrompe o script se tiver erros / Stops the script if any errors occur
set -e

echo -e "${BLUE}=== Iniciando Atualização do Antigravity IDE ===${NC}\n"

# 1. Verificação de Dependências / Dependency Check
echo -e "Verificando ferramentas necessárias..."
if ! command -v git &> /dev/null; then
    echo -e "${RED}Erro: O 'git' não está instalado. Por favor, instale-o antes de continuar.${NC}"
    exit 1
fi

if ! command -v makepkg &> /dev/null; then
    echo -e "${RED}Erro: O 'makepkg' não foi encontrado. Você está em um sistema baseado em Arch Linux?${NC}"
    exit 1
fi

# 2. Garante se o diretório existe (se não cria) / Ensures the directory exists (creates it if not)
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

# 3. Sincronização com o Repositório do AUR / Synchronization with the AUR Repository
if [ ! -d ".git" ]; then
    echo -e "Diretório limpo detectado. Clonando o repositório do Antigravity IDE..."
    git clone "$REPO_URL" .
else
    echo -e "Atualizando o repositório local existente..."
    # Se houver alterações locais acidentais, faz um reset para evitar conflitos no pull
    # If there are accidental local changes, do a hard reset to avoid pull conflicts
    git reset --hard HEAD
    git pull
fi

# 4. Compilação e Instalação / Compilation and Installation
echo -e "\n${BLUE}Compilando e instalando o pacote via makepkg...${NC}"
# -s: Instala dependências em falta via pacman / Installs missing dependencies via pacman
# -i: Instala o pacote após compilar / Installs the package after successful compilation
# -c: Limpa os arquivos temporários de build após / Cleans up temporary build files after success
# --noconfirm: Responde 'sim' para todos os prompts do pacman / Answers 'yes' to all pacman prompts
makepkg -sic --noconfirm

# 5. Finalização / Completion
echo -e "\n${GREEN}Antigravity IDE updated/instalado ${NC}"