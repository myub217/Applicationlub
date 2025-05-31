,#!/data/data/com.termux/files/usr/bin/bash
# setup-termux.sh

echo "🛠️ เริ่มตั้งค่า Termux Dev Toolkit..."

# Update & install packages
pkg update -y && pkg upgrade -y
pkg install -y git curl zsh wget nodejs yarn python nano neofetch

# Setup Oh-My-Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "⚙️ ติดตั้ง Oh-My-Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "✔️ Oh-My-Zsh ติดตั้งแล้ว"
fi

# Setup Powerlevel10k
echo "⚙️ ติดตั้ง Powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  $HOME/.oh-my-zsh/custom/themes/powerlevel10k

# แก้ไข .zshrc
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' $HOME/.zshrc

# ตั้ง Alias
echo "
alias cls='clear'
alias update='pkg update && pkg upgrade'
alias ..='cd ..'
alias ll='ls -alh'
alias runjs='node'
alias g='git'
alias yt='termux-open-url https://youtube.com'
alias fastfetch='neofetch'
" >> $HOME/.zshrc

# เพิ่ม fastfetch ASCII logo
pkg install -y fastfetch || echo "ติดตั้ง fastfetch ไม่สำเร็จ"

echo "✅ ติดตั้งเสร็จแล้ว! พิมพ์ 'exit' แล้วเปิด Termux ใหม่เพื่อเริ่ม ZSH"
