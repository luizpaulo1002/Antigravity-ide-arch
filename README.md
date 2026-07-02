# Antigravity-ide-arch
A simple script to update Google Antigravity IDE on Arch Linux using the AUR.

---

# Português (PT-BR)

Script para atualizar o **Antigravity IDE** no **Arch Linux** utilizando o **AUR**.

## Como Usar

```bash
chmod +x update-antigravity.sh
./update-antigravity.sh
```

## Solução de Problemas

### Baixando uma versão antiga
Execute o comando abaixo uma única vez antes de rodar o script novamente:

```bash
rm -rf "$HOME/antigravity-build"
```

### Erro: `makepkg` não encontrado
O script requer **Arch Linux** com as ferramentas de desenvolvimento instaladas.

```bash
sudo pacman -Syu base-devel git
```

### Erro de permissão
O script solicitará sua senha do **sudo** para instalar o pacote gerado.

### Conflitos no Git
O script limpa automaticamente alterações locais utilizando:

```bash
git reset --hard HEAD
```

---

# English

Script to update **Antigravity IDE** on **Arch Linux** using the **AUR**.

## Usage

```bash
chmod +x update-antigravity.sh
./update-antigravity.sh
```

## Troubleshooting

### Downloading an old version
Run the following command once before executing the script again:

```bash
rm -rf "$HOME/antigravity-build"
```

### Error: `makepkg` not found
This script requires **Arch Linux** with the development tools installed.

```bash
sudo pacman -Syu base-devel git
```

### Permission error
The script will prompt for your **sudo** password to install the generated package.

### Git conflicts
The script automatically discards local changes using:

```bash
git reset --hard HEAD
```
