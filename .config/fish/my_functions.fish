function g -w git; git $argv; end
function ga -w 'git add'; git add $argv; end
function gb -w 'git branch'; git branch $argv; end
function gmv -w 'git mv'; git mv $argv; end
function gp -w 'git push'; git push $argv; end
function gpl -w 'git pull'; git pull $argv; end
function gr -w 'git reset'; git reset $argv; end
function grm -w 'git rm'; git rm $argv; end
function gsh -w 'git show'; git show $argv; end
function gst -w 'git stash'; git stash $argv; end
function gt -w 'git tag'; git tag $argv; end
function gw -w 'git whatchanged'; git whatchanged $argv; end

function gc -w 'git commit'; git commit $argv; end
function gca -w 'git commit'; git commit --amend $argv; end

function gcl -w 'git clone'; git clone $argv; end
function gco -w 'git checkout'; git checkout $argv; end

function gd -w 'git diff'; git diff $argv; end
function gdc -w 'git diff'; git diff --cached $argv; end

function gf -w 'git fetch'; git fetch $argv; end
function gi -w 'git init'; git init $argv; end

function gl -w 'git log'; git log $argv; end
function glp -w 'git log'; git log --oneline $argv; end
function glv -w 'git log'; git log --oneline --graph $argv; end

function gm -w 'git merge'; git merge $argv; end
function gma -w 'git merge'; git merge --abort $argv; end
function gmc -w 'git merge'; git merge --continue $argv; end
function gms -w 'git merge'; git merge --skip $argv; end


function grb -w 'git rebase'; git rebase $argv; end
function grba -w 'git rebase'; git rebase --abort $argv; end
function grbc -w 'git rebase'; git rebase --continue $argv; end
function grbs -w 'git rebase'; git rebase --skip $argv; end


function gs -w 'git status'; git status $argv; end
function gws -w 'git status'; git status -s $argv; end

function grep -w 'grep'; command grep --color=auto $argv; end
function weather; curl wttr.in/Stockholm; end

function backup -d "Back up file for directory to source.bak"
	cp -r $argv[1] $argv[1].bak
end

function restore -d "Restore a backed up file for directory"
	cp -r $argv[1].bak $argv[1]
end

function y -w yadm; yadm $argv; end

function chpwd --on-variable PWD --description 'handler of changing $PWD'
  if not status --is-command-substitution ; and status --is-interactive
    set cur_cwd (echo $PWD | sed -e "s|^$HOME|~|" -e 's|^/private||')
    printf "%s⇢ %sEntering %s%s%s\n" (set_color $fish_color_cwd) (set_color normal) (set_color $fish_color_cwd) $cur_cwd (set_color normal)
    ls
  end
end
