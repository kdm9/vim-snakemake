" Vim syntax file
" Language:	Snakemake (extended from python.vim)
" Maintainer:	Vivek Rai (mail@raivivek.in)
" Original Author:	Jay Hesselberth (jay.hesselberth@gmail.com)
" Last Change:	2019 Jun 16
"
" Usage
"
" copy to $HOME/.vim/syntax directory and add:
"
" au BufNewFile,BufRead Snakefile set syntax=snakemake
" au BufNewFile,BufRead *.smk set syntax=snakemake
"
" to your $HOME/.vimrc file
"
" force coloring in a vim session with:
"
" :set syntax=snakemake
"

if exists("b:current_syntax")
  finish
endif

" Extend python.vim's syntax for use with Snakemake
runtime! syntax/python.vim

syn keyword pythonStatement	include workdir onsuccess onerror
syn keyword pythonStatement	ruleorder localrules configfile
syn keyword pythonStatement	touch protected temp wrapper
syn keyword pythonStatement	dynamic ancient directory
syn keyword pythonStatement	input output params message shadow
syn keyword pythonStatement	threads resources priority
syn keyword pythonStatement	version run shell benchmark snakefile log script
syn keyword pythonStatement	rule subworkflow checkpoint nextgroup=pythonFunction skipwhite

" Similar to special def and class treatment from python.vim, except
" parenthetical part of def and class
syn match pythonFunction
      \ "\%(\%(rule\s\|subworkflow\s\|checkpoint\s\)\s*\)\@<=\h\w*" contained

syn sync match pythonSync grouphere NONE "^\s*\%(rule\|subworkflow\|checkpoint\)\s\+\h\w*\s*"

let b:current_syntax = "snakemake"

setlocal commentstring=#%s

" vim:set sw=4 sts=4 ts=4 et:
