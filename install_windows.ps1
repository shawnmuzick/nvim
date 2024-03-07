function installNeovim(){
      try{
            $nvim_version = nvim --version
      } catch{
            $nvim_version = $null
      }
      write-host $nvim_version

            if($null -ne $nvim_version){
                  write-host "neovim is installed"
            }else{
                  write-host "neovim not installed"
                        winget install neovim
            }
}

function installGit(){
      try{
            $git_version = git --version
      } catch{
            $git_version = $null
      }
      write-host $git_version

            if($null -ne $git_version){
                  write-host "git is installed"
            }else{
                  write-host "git not installed"
                        winget install git
            }
}

function installNode(){
      try{
            $node_version = node --version
      } catch{
            $node_version = $null
      }
      write-host $node_version

            if($null -ne $node_version){
                  write-host "node is installed"
            }else{
                  write-host "node not installed"
                        winget install OpenJS.NodeJS.LTS
            }
}

function installDotnet(){
      try{
            $node_version = node --version
      } catch{
            $node_version = $null
      }
      write-host $node_version

            if($null -ne $node_version){
                  write-host "node is installed"
            }else{
                  write-host "node not installed"
                        winget install OpenJS.NodeJS.LTS
            }
}

function cloneNeovimConfig(){
      try{
            git clone "https://github.com/shawnmuzick/nvim.git" "$env:USERPROFILE\AppData\Local\nvim\"
      } catch{
            write-host $_
      }
}

function main(){
      installGit
            installNode
            installNeovim
            cloneNeovimConfig
}

main
