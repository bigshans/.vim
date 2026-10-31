" Arch 的 license 字段同时接受旧式短 ID（GPL2、LGPL2.1、AGPL3 …），
" 但 vim-pkgbuild 只认 SPDX 全名（GPL-2.0-only），会把合法值标成
" pbIllegalLicense -> Error（红底）。这里补上旧式 ID，让它们按普通文本显示。
" 想严格按 SPDX 校验：let g:pkgbuild_strict_spdx_license = 1
if !get(g:, 'pkgbuild_strict_spdx_license', 0)
    syntax match pbLicenseLegacy
                \ /\%(\%(A\|L\)\=GPL\%([0-9.]\+\)\=\|FDL\%([0-9.]\+\)\=\|Apache\|Artistic\%([0-9.]\+\)\=\|PerlArtistic\|WTFPL\)/
                \ contained
    " 后定义的 region 生效，把新组加进 license 区域的 contains
    syntax region pbLicenseGroup start=/^license=(/ end=/)/ contains=pb_k_license,pbLicenseCustom,pbLicenseSpecial,pbLicense,pbIllegalLicense,pbLicenseCombination,pbLicenseLegacy,pbLicenseCombination
endif
