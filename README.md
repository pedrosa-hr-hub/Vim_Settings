⚙️ Configurações Pessoais do Vim

Este repositório contém o arquivo de configuração (vim) pessoal do Vim/Neovim, otimizado para um fluxo de trabalho moderno de desenvolvimento, com foco em Java e integração com ferramentas como Tmux e CoC (Conquer of Completion).

🚀 Funcionalidades Principais

•
Gerenciamento de Plugins: Utiliza o vim-plug para um gerenciamento de plugins eficiente.

•
LSP/Autocompletar: Integração robusta com CoC para IntelliSense, diagnósticos e refatoração, incluindo suporte específico para Java.

•
Navegação e Produtividade: Atalhos para navegação entre splits (compatível com Tmux), exploração de arquivos com NERDTree e busca rápida com FZF.

•
Temas: Suporte a múltiplos temas (Tokyo Night, Dracula, Gruvbox, Nord) com alternância rápida.

•
Desenvolvimento Java: Mapeamentos dedicados para compilação, execução e testes de projetos Java/Maven.

📋 Pré-requisitos

Para utilizar esta configuração, você deve ter:

1.
Vim (versão 8.0+) ou Neovim.

2.
Git (para clonar o repositório e para plugins como vim-fugitive).

3.
Vim-Plug instalado (ou outro gerenciador de plugins, ajustando o arquivo de configuração).

4.
FZF instalado (para o plugin fzf.vim).

5.
Node.js (para o CoC).

6.
JDK (para o coc-java).

🛠️ Instalação

1.
Clone o repositório para o local desejado (ex: ~/.vim_settings):

Bash


git clone https://github.com/pedrosa-hr-hub/Vim_Settings.git ~/.vim_settings




2.
Crie um link simbólico para o arquivo de configuração principal (assumindo que você está usando o Vim ):

Bash


# Faça um backup da sua configuração existente (opcional)
mv ~/.vimrc ~/.vimrc_backup

# Crie o link simbólico
ln -s ~/.vim_settings/vim ~/.vimrc


Se estiver usando o Neovim, o arquivo deve ser copiado ou linkado para ~/.config/nvim/init.vim.



3.
Instale os plugins abrindo o Vim e executando:

Plain Text


:PlugInstall




🔌 Plugins Incluídos

Categoria
Plugin
Descrição
Gerenciamento
vim-plug
Gerenciador de plugins.
LSP/Completion
neoclide/coc.nvim
Conquer of Completion (LSP Client).


neoclide/coc-java
Extensão do CoC para suporte a Java.
Interface
vim-airline/vim-airline
Barra de status e abas elegante.


vim-airline/vim-airline-themes
Temas para o Airline.


preservim/nerdtree
Explorador de arquivos em árvore.
Sintaxe
sheerun/vim-polyglot
Pacote de sintaxe para diversas linguagens.
Git
tpope/vim-fugitive
Integração Git completa.


airblade/vim-gitgutter
Mostra diferenças do Git na coluna de sinais.
Utilidades
tpope/vim-commentary
Comentar/descomentar linhas facilmente.


jiangmiao/auto-pairs
Inserção automática de pares de caracteres.


tpope/vim-surround
Manipulação de "surroundings" (parênteses, aspas, etc.).


junegunn/fzf & fzf.vim
Fuzzy finder para arquivos, buffers, etc.
Tmux
christoomey/vim-tmux-navigator
Navegação entre Vim splits e painéis Tmux.


tmux-plugins/vim-tmux
Integração básica com Tmux.


roxma/vim-tmux-clipboard
Sincronização do clipboard com Tmux.
Temas
tokyonight-vim, dracula/vim, gruvbox, nord-vim
Esquemas de cores.


⌨️ Atalhos e Mapeamentos

O mapeamento do <leader> é o caractere \ (barra invertida) por padrão.

Navegação e Arquivos

Atalho
Descrição
<C-n> ou <leader>n
Alterna o NERDTree (Explorador de Arquivos).
<leader>f ou <leader>nf
Encontra o arquivo atual no NERDTree.
<C-p>
Abre o FZF para buscar arquivos (:Files).
<leader>b
Abre o FZF para buscar buffers (:Buffers).
<leader>g
Abre o FZF para busca global com Rg (requer ripgrep).
<C-h>, <C-j>, <C-k>, <C-l>
Navegação entre splits (compatível com Tmux).
<C-s> (Normal/Insert)
Salva o arquivo (:w).


CoC (LSP e Autocompletar)

Atalho
Descrição
<Tab> (Insert)
Navega no menu de autocompletar do CoC.
<S-Tab> (Insert)
Navega para o item anterior no menu de autocompletar.
<CR> (Insert)
Confirma a seleção no menu de autocompletar.
<C-Space> (Insert)
Força o trigger da autocompleção.
gd
Go to Definition (Ir para a definição).
gy
Go to Type Definition (Ir para a definição de tipo).
gi
Go to Implementation (Ir para a implementação).
gr
Go to References (Ir para as referências).
K
Mostra a documentação em preview (hover).
<leader>rn
Rename (Renomear símbolo).
<leader>cf
Format Selected Code (Formatar código selecionado).
<leader>fm
Format Entire File (Formatar arquivo inteiro).
<leader>io
Organize Imports (Organizar importações).
<leader>ac
Code Action no cursor.
<leader>as
Source Code Action no cursor.
<leader>ca
Code Action na seleção.
<leader>qf
Quick Fix (Aplicar correção rápida).
<leader>re, <leader>rr, <leader>rs
Refactor (Ações de refatoração).


Diagnósticos e Navegação de Erros (CoC)

Atalho
Descrição
<space>a
Lista todos os diagnósticos (erros/warnings).
<space>j
Próximo diagnóstico.
<space>k
Diagnóstico anterior.
<space>o
Lista o outline do arquivo.
<space>s
Lista os símbolos do arquivo.


Temas

Atalho
Tema
<F2> ou <leader>t1
Tokyo Night
<F3> ou <leader>t2
Dracula
<F4> ou <leader>t3
Gruvbox
<F9> ou <leader>t4
Nord


Desenvolvimento Java (Maven)

Estes atalhos são ativados automaticamente para arquivos do tipo java.

Atalho
Comando
Descrição
<F5>
:!javac % && java %:r
Compila e executa o arquivo Java atual.
<F6>
:!./mvnw clean compile
Executa mvnw clean compile.
<F7>
:!./mvnw test
Executa mvnw test.
<F8>
:!./mvnw spring-boot:run
Executa mvnw spring-boot:run.
<leader>mc
:!./mvnw clean
Executa mvnw clean.
<leader>mi
:!./mvnw clean install
Executa mvnw clean install.
<leader>mt
:!./mvnw test
Executa mvnw test.
<leader>mr
:!./mvnw spring-boot:run
Executa mvnw spring-boot:run.


⚙️ Configurações Básicas

As configurações básicas do Vim incluem:

•
Numeração de Linhas: set number e set relativenumber.

•
Mouse: Habilitado (set mouse=a).

•
Codificação: UTF-8 (set encoding=utf-8).

•
Indentações: Utiliza espaços (set expandtab) com 4 espaços por tabulação (set tabstop=4, set shiftwidth=4).

•
Busca: Destaque de busca (set hlsearch), busca incremental (set incsearch), busca insensível a maiúsculas/minúsculas (set ignorecase) e busca inteligente (set smartcase).

•
Interface: Coluna de sinais sempre visível (set signcolumn=yes).




Documentação gerada por Manus, seu assistente de IA.




