if exists('b:did_ftplugin_tex_flag')
  finish
endif
let b:did_ftplugin_tex_flag = 1
scriptencoding utf-8

" キーマップの設定を手動で実行するコマンド
:command -buffer Math :call s:SetKeyMap()
:command -buffer UnMath :call s:UnSetKeyMap()

" 数式入力用キーマップを用いて挿入モードに入る
:nnoremap <buffer> <Leader>mi :Math<CR>i
:nnoremap <buffer> <Leader>ma :Math<CR>a
:nnoremap <buffer> <Leader>mI :Math<CR>i$$<Left>
:nnoremap <buffer> <Leader>mA :Math<CR>a$$<Left>
:nnoremap <buffer> <Leader>mo :Math<CR>o\[<CR>\]<Up><End><CR>
:nnoremap <buffer> <Leader>mO :Math<CR>o\begin{equation}<CR>\end{equation}<Up><End><CR>


" 挿入モードから抜けるときに自動で普通のキーマップに戻す
:autocmd InsertLeave <buffer> UnMath
" <C-C>で戻った時も普通のキーマップに戻るようにする
" :inoremap <buffer> <silent> <unique> <C-C> <C-C>:UnMath<CR>

" 数式用のキーマップに変更する函数
:function! s:SetKeyMap()
:inoremap <buffer> ^^ ^{}<Left>
:inoremap <buffer> __ _{}<Left>
:inoremap <buffer> B@ B
:inoremap <buffer> B<Space> B<Space>
:inoremap <buffer> B \bm{}<Left>
:inoremap <buffer> F@ F
:inoremap <buffer> F<Space> F<Space>
:inoremap <buffer> F \frac{}{}<Left><Left><Left>
:inoremap <buffer> R@ R
:inoremap <buffer> R \mathrm{}<Left>
:inoremap <buffer> Qk \ket{}<Left>
:inoremap <buffer> QK \Ket{}<Left>
:inoremap <buffer> Qb \bra{}<Left>
:inoremap <buffer> QB \Bra{}<Left>
:inoremap <buffer> Q2 \braket{<Bar>}<Left><Left>
:inoremap <buffer> Q" \Braket{<Bar>}<Left><Left>
:inoremap <buffer> Q3 \braket{<Bar><Bar>}<Left><Left><Left>
:inoremap <buffer> Q# \Braket{<Bar><Bar>}<Left><Left><Left>
:inoremap <buffer> Qh \hbar
:inoremap <buffer> A<Up> \uparrow
:inoremap <buffer> A<Down> \downarrow
:inoremap <buffer> A<Left> \leftarrow
:inoremap <buffer> A<Right> \rightarrow
:inoremap <buffer> Si \int
:inoremap <buffer> SI \int_{}^{}<Left><Left><Left><Left>
:inoremap <buffer> Ss \sum
:inoremap <buffer> SS \sum_{}^{}<Left><Left><Left><Left>
:inoremap <buffer> Sp \prod
:inoremap <buffer> SP \prod_{}^{}<Left><Left><Left><Left>
:inoremap <buffer> Ga \alpha
:inoremap <buffer> Gb \beta
:inoremap <buffer> GG \Gamma
:inoremap <buffer> Gg \gamma
:inoremap <buffer> GD \Delta
:inoremap <buffer> Gd \delta
:inoremap <buffer> Ge \epsilon
:inoremap <buffer> Gve \varepsilon
:inoremap <buffer> Gz \zeta
:inoremap <buffer> Gee \eta
:inoremap <buffer> GTh \Theta
:inoremap <buffer> GTH \Theta
:inoremap <buffer> Gth \theta
:inoremap <buffer> Gvt \vartheta
:inoremap <buffer> Gi \iota
:inoremap <buffer> Gk \kappa
:inoremap <buffer> GL \Lambda
:inoremap <buffer> Gl \lambda
:inoremap <buffer> Gm \mu
:inoremap <buffer> Gn \nu
:inoremap <buffer> GX \Xi
:inoremap <buffer> Gx \xi
:inoremap <buffer> GP \Pi
:inoremap <buffer> Gp \pi
:inoremap <buffer> Gvp \varpi
:inoremap <buffer> GS \Sigma
:inoremap <buffer> Gs \sigma
:inoremap <buffer> Gvs \varsigma
:inoremap <buffer> Gt \tau
:inoremap <buffer> GU \Upsilon
:inoremap <buffer> Gu \upsilon
:inoremap <buffer> GPh \Phi
:inoremap <buffer> GPH \phi
:inoremap <buffer> Gph \phi
:inoremap <buffer> Gvph \varphi
:inoremap <buffer> GF \Phi
:inoremap <buffer> Gf \phi
:inoremap <buffer> Gvf \varphi
:inoremap <buffer> Gc \chi
:inoremap <buffer> GPs \Psi
:inoremap <buffer> GPS \Psi
:inoremap <buffer> Gps \psi
:inoremap <buffer> GO \Omega
:inoremap <buffer> Go \omega
:endfunction

" 通常のキーマップに変更する函数
:function! s:UnSetKeyMap()
:silent! iunmap <buffer> ^^
:silent! iunmap <buffer> __
:silent! iunmap <buffer> B@
:silent! iunmap <buffer> B<Space>
:silent! iunmap <buffer> B
:silent! iunmap <buffer> F@
:silent! iunmap <buffer> F<Space>
:silent! iunmap <buffer> F
:silent! iunmap <buffer> R@
:silent! iunmap <buffer> R
:silent! iunmap <buffer> Qk
:silent! iunmap <buffer> QK
:silent! iunmap <buffer> Qb
:silent! iunmap <buffer> QB
:silent! iunmap <buffer> Q2
:silent! iunmap <buffer> Q"
:silent! iunmap <buffer> Q3
:silent! iunmap <buffer> Q#
:silent! iunmap <buffer> Qh
:silent! iunmap <buffer> A<Up>
:silent! iunmap <buffer> A<Down>
:silent! iunmap <buffer> A<Left>
:silent! iunmap <buffer> A<Right>
:silent! iunmap <buffer> Si
:silent! iunmap <buffer> SI
:silent! iunmap <buffer> Ss
:silent! iunmap <buffer> SS
:silent! iunmap <buffer> Sp
:silent! iunmap <buffer> SP
:silent! iunmap <buffer> Ga
:silent! iunmap <buffer> Gb
:silent! iunmap <buffer> GG
:silent! iunmap <buffer> Gg
:silent! iunmap <buffer> GD
:silent! iunmap <buffer> Gd
:silent! iunmap <buffer> Ge
:silent! iunmap <buffer> Gve
:silent! iunmap <buffer> Gz
:silent! iunmap <buffer> Gee
:silent! iunmap <buffer> GTh
:silent! iunmap <buffer> GTH
:silent! iunmap <buffer> Gth
:silent! iunmap <buffer> Gvt
:silent! iunmap <buffer> Gi
:silent! iunmap <buffer> Gk
:silent! iunmap <buffer> GL
:silent! iunmap <buffer> Gl
:silent! iunmap <buffer> Gm
:silent! iunmap <buffer> Gn
:silent! iunmap <buffer> GX
:silent! iunmap <buffer> Gx
:silent! iunmap <buffer> GP
:silent! iunmap <buffer> Gp
:silent! iunmap <buffer> Gvp
:silent! iunmap <buffer> GS
:silent! iunmap <buffer> Gs
:silent! iunmap <buffer> Gvs
:silent! iunmap <buffer> Gt
:silent! iunmap <buffer> GU
:silent! iunmap <buffer> Gu
:silent! iunmap <buffer> GPh
:silent! iunmap <buffer> GPH
:silent! iunmap <buffer> Gph
:silent! iunmap <buffer> Gvph
:silent! iunmap <buffer> GF
:silent! iunmap <buffer> Gf
:silent! iunmap <buffer> Gvf
:silent! iunmap <buffer> Gc
:silent! iunmap <buffer> GPs
:silent! iunmap <buffer> GPS
:silent! iunmap <buffer> Gps
:silent! iunmap <buffer> GO
:silent! iunmap <buffer> Go
:endfunction
