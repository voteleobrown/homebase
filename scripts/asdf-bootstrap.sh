#!/bin/bash

# Install ASDF Bash version (via SSH)
git clone git@github.com:asdf-vm/asdf.git ~/.asdf --branch v0.15.0
echo '. "$HOME/.asdf/asdf.sh"' >> ~/.zsh/local.zsh
source ~/.asdf/asdf.sh

# Install Go via ASDF
asdf plugin add golang git@github.com:asdf-community/asdf-golang.git
asdf install golang latest
asdf global golang latest
asdf reshim golang

# Build ASDF Go version
cd /tmp && git clone git@github.com:asdf-vm/asdf.git asdf-src
cd asdf-src && git checkout v0.18.0
echo "golang $(asdf current golang | awk '{print $2}')" > .tool-versions
go build -o asdf cmd/asdf/main.go
mkdir -p ~/bin && mv asdf ~/bin/

# Switch to Go version
sed -i '/asdf.sh/d' ~/.zsh/local.zsh
cat >> ~/.zsh/local.zsh << 'EOF'
export PATH="$HOME/bin:$PATH"
export ASDF_DATA_DIR="$HOME/.asdf"
export PATH="$ASDF_DATA_DIR/shims:$PATH"
EOF

# Clean up and reshim
export PATH="$HOME/bin:$PATH" ASDF_DATA_D

# Install all language plugins
echo "Installing language plugins..."

# Programming Languages
asdf plugin add nodejs git@github.com:asdf-vm/asdf-nodejs.git
asdf plugin add python git@github.com:asdf-community/asdf-python.git
asdf plugin add ruby git@github.com:asdf-vm/asdf-ruby.git
asdf plugin add rust git@github.com:code-lever/asdf-rust.git
asdf plugin add java git@github.com:halcyon/asdf-java.git
asdf plugin add kotlin git@github.com:asdf-community/asdf-kotlin.git
asdf plugin add scala git@github.com:asdf-community/asdf-scala.git
asdf plugin add clojure git@github.com:asdf-community/asdf-clojure.git
asdf plugin add erlang git@github.com:asdf-vm/asdf-erlang.git
asdf plugin add elixir git@github.com:asdf-vm/asdf-elixir.git
asdf plugin add php git@github.com:asdf-community/asdf-php.git
asdf plugin add perl git@github.com:ouest/asdf-perl.git
asdf plugin add lua git@github.com:Stratus3D/asdf-lua.git
asdf plugin add r git@github.com:asdf-community/asdf-r.git
asdf plugin add julia git@github.com:rkyleg/asdf-julia.git
asdf plugin add swift git@github.com:fcrespo82/asdf-swift.git
asdf plugin add crystal git@github.com:asdf-community/asdf-crystal.git
asdf plugin add nim git@github.com:asdf-community/asdf-nim.git
asdf plugin add haskell git@github.com:vic/asdf-haskell.git
asdf plugin add ocaml git@github.com:asdf-community/asdf-ocaml.git
asdf plugin add dart git@github.com:patoconnor43/asdf-dart.git
asdf plugin add flutter git@github.com:oae/asdf-flutter.git
asdf plugin add zig git@github.com:asdf-community/asdf-zig.git
asdf plugin add groovy git@github.com:weibemoura/asdf-groovy.git
asdf plugin add racket git@github.com:asdf-community/asdf-racket.git

# JavaScript/TypeScript Tools
asdf plugin add deno git@github.com:asdf-community/asdf-deno.git
asdf plugin add bun git@github.com:cometkim/asdf-bun.git
asdf plugin add yarn git@github.com:twuni/asdf-yarn.git
asdf plugin add pnpm git@github.com:jonathanmorley/asdf-pnpm.git

# Cloud/DevOps Tools
asdf plugin add terraform git@github.com:asdf-community/asdf-hashicorp.git
asdf plugin add kubectl git@github.com:asdf-community/asdf-kubectl.git
asdf plugin add helm git@github.com:Antiarchitect/asdf-helm.git
asdf plugin add aws-cli git@github.com:MetricMike/asdf-awscli.git
asdf plugin add azure-cli git@github.com:EcoMind/asdf-azure-cli.git
asdf plugin add gcloud git@github.com:jthegedus/asdf-gcloud.git
asdf plugin add minikube git@github.com:alvarobp/asdf-minikube.git
asdf plugin add kustomize git@github.com:Banno/asdf-kustomize.git
asdf plugin add ansible git@github.com:amrox/asdf-pyapp.git
asdf plugin add packer git@github.com:asdf-community/asdf-hashicorp.git
asdf plugin add consul git@github.com:asdf-community/asdf-hashicorp.git
asdf plugin add vault git@github.com:asdf-community/asdf-hashicorp.git
asdf plugin add nomad git@github.com:asdf-community/asdf-hashicorp.git

# Build/Package Tools
asdf plugin add maven git@github.com:halcyon/asdf-maven.git
asdf plugin add gradle git@github.com:rfrancis/asdf-gradle.git
asdf plugin add sbt git@github.com:bram2000/asdf-sbt.git
asdf plugin add leiningen git@github.com:miorimmax/asdf-lein.git
asdf plugin add cmake git@github.com:asdf-community/asdf-cmake.git
asdf plugin add make git@github.com:yacchi/asdf-make.git

# Shell/CLI Tools
asdf plugin add zsh git@github.com:kiurchv/asdf-zsh.git
asdf plugin add fish git@github.com:rstacruz/asdf-fish.git
asdf plugin add tmux git@github.com:aphecetche/asdf-tmux.git
asdf plugin add neovim git@github.com:richin13/asdf-neovim.git
asdf plugin add vim git@github.com:tsuyoshicho/asdf-vim.git
asdf plugin add emacs git@github.com:neppramod/asdf-emacs.git
asdf plugin add bat git@github.com:wt0f/asdf-bat.git
asdf plugin add fzf git@github.com:kompiro/asdf-fzf.git
asdf plugin add ripgrep git@github.com:maltejur/asdf-ripgrep.git
asdf plugin add fd git@github.com:kphrx/asdf-fd.git
asdf plugin add exa git@github.com:nyrst/asdf-exa.git
asdf plugin add jq git@github.com:lsanwick/asdf-jq.git
asdf plugin add yq git@github.com:sudermanjr/asdf-yq.git
asdf plugin add direnv git@github.com:asdf-community/asdf-direnv.git
asdf plugin add gh git@github.com:bartlomiejdanek/asdf-gh.git
asdf plugin add hub git@github.com:vixus0/asdf-hub.git
asdf plugin add httpie git@github.com:johnhamelink/asdf-httpie.git
asdf plugin add curl git@github.com:joschi/asdf-curl.git
asdf plugin add wget git@github.com:dex4er/asdf-wget.git

# Data Science/ML Tools
asdf plugin add anaconda git@github.com:321k/asdf-anaconda.git
asdf plugin add miniconda git@github.com:kachick/asdf-miniconda.git
asdf plugin add poetry git@github.com:asdf-community/asdf-poetry.git
asdf plugin add pipenv git@github.com:jonathanmorley/asdf-pipenv.git
asdf plugin add pdm git@github.com:joe733/asdf-pdm.git
asdf plugin add pipx git@github.com:joe733/asdf-pipx.git
asdf plugin add jupyter git@github.com:tachyondecay/asdf-jupyter.git

# Security Tools
asdf plugin add trivy git@github.com:zufardhiyaulhaq/asdf-trivy.git
asdf plugin add cosign git@github.com:ables-cosmorg/asdf-cosign.git
asdf plugin add syft git@github.com:davidgp1701/asdf-syft.git
asdf plugin add grype git@github.com:davidgp1701/asdf-grype.git

# Documentation
asdf plugin add mdbook git@github.com:cipherstash/asdf-mdbook.git
asdf plugin add pandoc git@github.com:vic/asdf-pandoc.git
asdf plugin add asciidoctor git@github.com:jonathanmorley/asdf-asciidoctor.git

echo "All plugins installed! Use 'asdf plugin list' to see them."
