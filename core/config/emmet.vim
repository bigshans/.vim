imap   <C-y>   <plug>(emmet-expand-abbr)
let g:user_emmet_settings = {
            \ 'wxss': {
            \   'extends': 'css',
            \ },
            \ 'wxml': {
            \   'extends': 'html',
            \   'aliases': {
            \     'div': 'view',
            \     'span': 'text',
            \   },
            \  'default_attributes': {
            \     'block': [{'wx:for-items': '{{list}}','wx:for-item': '{{item}}'}],
            \     'navigator': [{'url': '', 'redirect': 'false'}],
            \     'scroll-view': [{'bindscroll': ''}],
            \     'swiper': [{'autoplay': 'false', 'current': '0'}],
            \     'icon': [{'type': 'success', 'size': '23'}],
            \     'progress': [{'precent': '0'}],
            \     'button': [{'size': 'default'}],
            \     'checkbox-group': [{'bindchange': ''}],
            \     'checkbox': [{'value': '', 'checked': ''}],
            \     'form': [{'bindsubmit': ''}],
            \     'input': [{'type': 'text'}],
            \     'label': [{'for': ''}],
            \     'picker': [{'bindchange': ''}],
            \     'radio-group': [{'bindchange': ''}],
            \     'radio': [{'checked': ''}],
            \     'switch': [{'checked': ''}],
            \     'slider': [{'value': ''}],
            \     'action-sheet': [{'bindchange': ''}],
            \     'modal': [{'title': ''}],
            \     'loading': [{'bindchange': ''}],
            \     'toast': [{'duration': '1500'}],
            \     'audio': [{'src': ''}],
            \     'video': [{'src': ''}],
            \     'image': [{'src': '', 'mode': 'scaleToFill'}],
            \   }
            \ },
            \}
