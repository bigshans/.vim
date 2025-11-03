vim9script

g:lspOpts = {
    autoHighlightDiags: true
}

autocmd User LspSetup call LspOptionsSet(g:lspOpts)
