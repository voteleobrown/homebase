
# Table of Contents

1.  [Description](#orgc0b7d81)
    1.  [Goals](#org75f7a78)
    2.  [Dependencies](#orgf89e2a9)
2.  [Contents](#org8636921)
    1.  [README.org - *this file*](#orgd94bba4)
        1.  [Description](#org2d82742)
    2.  [.tmux.conf - *Tmux configuration file*](#org9ac94d6)
        1.  [Description](#org5f071b2)
    3.  [.vimrc - *Vim configuration file*](#org4de84bd)
        1.  [Description](#orgc98e302)
    4.  [.zshrc - *Zsh configuration file*](#org5e0b714)
        1.  [Description](#org9f65d3f)
    5.  [.vim - *Directory for addition Vim configuration files*](#orgc5e0ede)
        1.  [.vim/colors - *Color schemes for Vim*](#orgfefd598)
    6.  [.zsh - *Directory for additional Zsh configuration files*](#orgc7e4e88)
        1.  [.zsh/local.zsh - *Local zsh settings*](#orgbf874fb)
        2.  [.zsh/os-specific.zsh - *Operationg system conditional settings*](#org800a57a)
        3.  [.zsh/alias.zsh - *Aliases in one seperate file for easy editing and browsing*](#orgb20cf12)
        4.  [.zsh/prompt.zsh - *Setting related to the terminal prompt*](#org4a45ced)


<a id="orgc0b7d81"></a>

# Description

*Homebase is intended to be a lightweight dotfiles collection.*


<a id="org75f7a78"></a>

## Goals

-   Stay simple enough to be edited by the uninitiated
-   Keep dependencies to a minimum
-   Be useful
-   Stay cross-platform compatible


<a id="orgf89e2a9"></a>

## Dependencies

-   Git
-   Zsh
-   Vim
-   Tmux


<a id="org8636921"></a>

# Contents


<a id="orgd94bba4"></a>

## README.org - *this file*


<a id="org2d82742"></a>

### Description

Made using Emacs Org-Mode. Should be simple enough to remain readble in other text editors.


<a id="org9ac94d6"></a>

## .tmux.conf - *Tmux configuration file*


<a id="org5f071b2"></a>

### Description

-   Use C-e as prefix instead of C-b because it's more convenient, but avoids the Emacs conflicts of C-a or C-s.
-   Use C-e + | to open a vertical window
-   Use C-e + - to open a horizontal window
-   Use Alt-arrow without prefix to switch panes
-   Shift-arrow to switch windows


<a id="org4de84bd"></a>

## .vimrc - *Vim configuration file*


<a id="orgc98e302"></a>

### Description

-   Show line numbers
-   256 color
-   Uses colorscheme 'openbd' which is located in '.vim/colors'
-   Highlight search results
-   Search a characters are typed
-   Syntax coloring enabled


<a id="org5e0b714"></a>

## .zshrc - *Zsh configuration file*


<a id="org9f65d3f"></a>

### Description

-   Loads local zsh configuration from '$HOME/.zsh/local.zsh'
-   Loads os-specific conditionals from '$HOME/.zsh/os-specific.zsh'
-   Loads settings for handling git repositories from '$HOME/.zsh/git.zsh'
-   Loads prompt settings from '$HOME/.zsh/prompt.zsh'

Local settings are aliases or functions that really only pertain to the local system. Presently .gitignore for this repository is instructed to ignore local.zsh so that settings which may be confidential are not loaded to this repository.

The aliases script has a lot of very useful shortcuts, but the most relevant one when editing these settings might be:

alias rezsh='. $HOME/.zshrc'

Which reloads the zsh configuration file after changes. 


<a id="orgc5e0ede"></a>

## .vim - *Directory for addition Vim configuration files*


<a id="orgfefd598"></a>

### .vim/colors - *Color schemes for Vim*


<a id="orgc7e4e88"></a>

## .zsh - *Directory for additional Zsh configuration files*


<a id="orgbf874fb"></a>

### .zsh/local.zsh - *Local zsh settings*


<a id="org800a57a"></a>

### .zsh/os-specific.zsh - *Operationg system conditional settings*


<a id="orgb20cf12"></a>

### .zsh/alias.zsh - *Aliases in one seperate file for easy editing and browsing*


<a id="org4a45ced"></a>

### .zsh/prompt.zsh - *Setting related to the terminal prompt*

