# Install NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

find . custom -maxdepth 1 -type f -name Npmfile -exec cat {} \; 2>/dev/null | while read -r pkg; do
    pkg_installed=$(echo ${list} | { grep -wo "${pkg}" || true; })
    if [[ ${pkg_installed} == ${pkg} ]]; then
        echo "Package \033[0;33m${pkg}\033[0m already installed"
    else
        echo "Installing package \033[0;33m${pkg}\033[0m"
        npm install -g ${pkg} 2>/dev/null
    fi
done
