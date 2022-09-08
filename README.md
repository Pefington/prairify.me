# [prairify.me](https://prairify.me)

# Vocal01 tech stack extraordinaire :beetle: :evergreen_tree: :bee:

## Clone the repo first

```sh
git clone git@github.com:Pefington/prairify.me.git
```

## To use this stack, there is a _small_ installfest

```sh
# 1. First install Ruby 3.0.4
rvm install 3.0.4

# 2. Then install NVM: Node Version Manager. It's like RVM for Node.JS
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# 3. Then install Node.JS v16.17.0. LTS means "Long Term Support"
nvm install --lts

# 4. If it goes "nVm: cOmMaNd NoT fOuNd" then reload your shell config:
source ~/.zshrc
# or
source ~/.bashrc

  # 4.1 Check you're good:
  node -v

# 5. Install pnpm, it's a package manager for Node.JS, like bundle for gems.
sudo npm install -g pnpm

  # 5.1 Check you're good:
  pnpm -v

# 6. Use this nice script to install all the dependencies:
pnpm setmeup

# 7. The server (port 3000) can be started with:
pnpm dev
# or
bin/dev

# 8. Before a commit, please run:
pnpm format # <= I failed to automate this
```

## Thank you for reading!
