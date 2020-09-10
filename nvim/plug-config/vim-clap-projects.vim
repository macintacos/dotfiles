" Trying to see if this works

let directories=glob(fnameescape('~/GitLocal/**/.git').'/{,.}*/', 1, 1)
echo map(directories, 'fnamemodify(v:val, ":h:t")')
