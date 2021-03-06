# Header
This vim plugin is use to add header in development files.

For now, the supported language are :
* Awk
* Bash
* C
* C++ (cpp)
* DockerFile ([Docker](https://www.docker.com/))
* Lex (works with Flex)
* Makefile
* [Pentadactyl](http://5digits.org/pentadactyl/) (firefox extension)
* Python
* Vimscript
* Yacc (works with Bison)

## Installation
For the installation, you can use [Pathogen](https://github.com/tpope/vim-pathogen) by [tpope](http://tpo.pe/) or [Vundle](https://github.com/gmarik/Vundle.vim) by [gmarik](http://gmarik.info/)

### Pathogen
```Shell
# with Pathogen (describe with classic utilization of Pathogen)
# if 'bundle' repo desn't exist
$ mkdir ~/.vim/bundle
# global installation
$ cd ~/.vim/bundle
$ git clone https://github.com/thmsaurel/header
```

### Vundle
```VimL
" Add to your vimrc
Plugin 'thmsaurel/header'
```

## Configuration
### Basic
For the script functionment, you have to had your name in your vimrc
```VimL
let g:header_author = "Thomas Aurel"
```
If you use docker and you want create dockerfile you have to put your name and the default docker container
```VimL
let g:header_docker_maintainer = "beargeek <thms.aurel@gmail.com>"
let g:header_docker_base = "centos:centos7"
```
> #### Note:
> By default for the default docker container, ```centos:centos7``` is used.

### Advanced
You can add many other options (but add can't guarantee the running script)
```VimL
" you can your own language in the script lists
let g:header_types = ['vim', 'c', 'sh', 'make']

" you can add your own header in for the language 
" (be careful you have to create the header selection)
let g:header_file = my_file
```

If you want to add your own file with this current template, this is a example, for Vimscript :
```VimL
" description
" " TITLE "
"
" File Name         :
" Created By        :
" Creation Date     :
" Version           : 0.1
" Last Change       :
" Last Changed By   :
"
```
This is the main main header for the script:
* **File Name** : the current file name
* **Created By** : the file author
* **Creation Date** : the file creation date
* **Last Change** : the file last modification date
* **Last Change By** : the file last modification author

For each file you have to had this line on the top
```
:insert
```

you have to put your file into the headers repo in this purpose and modify the ```g:header_types``` in your Vimrc

## Links
A syntax for headers file is available in another plugin.

## License
<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">Header</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/thmsaurel" property="cc:attributionName" rel="cc:attributionURL">Thomas Aurel</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.

