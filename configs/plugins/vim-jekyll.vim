let g:jekyll_post_dirs = [$BLOG_DIR . '/_posts']
let g:jekyll_post_extension = '.md'
let g:jekyll_post_filetype = 'liquid'
let g:jekyll_site_dir = $BLOG_DIR . '/_site'
let g:jekyll_build_command = 'cd ' . $BLOG_DIR . ' && ' . 'bundler exec jekyll build'
let g:jekyll_serve_command = 'cd ' . $BLOG_DIR . ' && ' . 'bundler exec jekyll serve'
let g:jekyll_post_template =  [
      \ '---',
      \ 'layout: post',
      \ 'title: "JEKYLL_TITLE"',
      \ 'date: "JEKYLL_DATE"',
      \ 'categories: Mics',
      \ 'tags: Mics',
      \ '---',
      \ '' ]
