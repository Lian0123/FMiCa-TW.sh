#!/bin/bash

#program:
# 用於Linux mint cinnamon 19版本 安裝完成後的更新與安裝必要程式

#History:
# 2017/05/25 Lian0123 version:0.0.1

FMiCaVersion="2.0.0"
FMiCaAuthor="Lian0123"
TextShow="-y"

if [ "$1" == "-n" ] || [ "$1" == "--NotText" ]; then
  TextShow="-qqy"
fi


if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  echo "名稱："
  echo "  FMicaTW.sh - For Mint Cinnamon To Taiwan User Of Bash Shell"
  echo "  Usage: sudo ./FMica-TW.sh  [options] "
  echo -e "\033[1;32m"
  echo -e "選項："
  echo -e "  -h, --help"
  echo -e "      顯示操作說明"
  echo -e ""
  echo -e "  -a, --author"
  echo -e "      顯示作者資料"
  echo -e ""
  echo -e "  -v, --version"
  echo -e "      顯示FMica-TW.sh版本"
  echo -e ""
  echo -e "  -n, --NotText"
  echo -e "      減少文字敘述之安裝模式"
  echo -e "\033[0m"
elif [ "$1" == "-a" ] || [ "$1" == "--author" ]; then
  echo -e "\033[1;32m"
  echo -e "FMica-TW.sh Author: $FMiCaAuthor"
  echo -e "\033[0m"
elif [ "$1" == "-v" ] || [ "$1" == "--version" ]; then
  echo -e "\033[1;32m"
  echo -e "FMica-TW.sh version : $FMiCaVersion"
  echo -e "\033[0m"
else 
  echo -e "\033[1;32m"
  echo -e "                                                                    "
  echo -e "  ################################################################  "
  echo -e "  #       這是個給 Linux Mint Cinnamon Taiwan 使用者的程式       #  "
  echo -e "  #                           一一一一                           #  "
  echo -e "  #          天 下 程 式      |- ㄩ -|    都 會 有 BUG           #  "
  echo -e "  #                  wv__   ㄒ|  免  |ㄒ   __vw                  #  "
  echo -e "  #                       | | |  責  | | |                       #  "
  echo -e "  #                        |  |  聲  |  |                        #  "
  echo -e "  #                           |  明  |                           #  "
  echo -e "  #                           一一一一                           #  "
  echo -e "  ################################################################  "
  echo -e "  #  檔名：FMiCa-TW.sh                                           #  "
  echo -e "  #  全名：For Mint Cinnamon To Taiwan User Of Bash Shell        #  "
  echo -e "  #  用途：幫忙快速安裝程式                                      #  "
  echo -e "  #  The Program from : $FMiCaAuthor                                 #  "
  echo -e "  #  The Version : $FMiCaVersion                                         #  "
  echo -e "  ################################################################  "
  echo -e "                                                                    "
  
  echo -e "          -----本程式可能使您的電腦上安裝非開源軟體-----            "
  echo -e "\033[0m"
  
  printf "你同意要使用此腳本安裝程式嗎？現在^C中斷還來得及(任意鍵繼續)"
  read select
  
  ##UPDATE
  echo -e "\033[1;32m"
  echo "正在執行APT UPDATE..."
  echo -e "\033[0m"
  sudo apt update
  
  ##UPDATE LIST
  echo -e "\033[1;32m"
  echo "正在執行APT SOURCE-LIST UPGRADE..."
  echo -e "\033[0m"
  sudo apt list --upgradable
  
  ##UPGRADE
  echo -e "\033[1;32m"
  echo "正在進行 APT UPGRADE..."
  echo -e "\033[0m"
  sudo apt upgrade $TextShow
  
  ##安裝expect
  echo -e "\033[1;32m"
  echo "正在安裝expect..."
  echo -e "\033[0m"
  sudo apt install $TextShow expect
  
  ##安裝Fcitx
  echo -e "\033[1;32m"
  echo "正在安裝Fcitx中文注音..."
  echo -e "\033[0m"
  sudo apt install $TextShow fcitx-chewing 
  
  ##安裝git
  echo -e "\033[1;32m"
  echo "正在安裝git..."
  echo -e "\033[0m"
  sudo apt install $TextShow git
  
  ##安裝make
  echo -e "\033[1;32m"
  echo "正在安裝make..."
  echo -e "\033[0m"
  sudo apt install $TextShow make 
  
  ##自訂選項設定（選擇）
  
  ##圖標主題安裝詢問：
  while :
    do
      echo -e "\033[1;32m"
      echo "你需要安裝其他的圖標主題嗎？(請輸入選項數字)"
      echo "1) Paper-icon"
      echo "2) Numix-icon-circle"
      echo "3) Breeze-icon"
      echo "4) Mato-icon"
      echo "5) papirus-icon-theme"
      echo "6) emerald-icon-theme"
      echo "7) 結束"
      printf "請輸入你的選項："
      read select
      echo -e "\033[0m"
      if [ "$select" == "1" ]; then
        ##來源：paper icon 的 github(修改)
        echo -e "\033[1;32m"
        echo "正在安裝Paper-icon..."
        echo -e "\033[0m"
        sudo apt install $TextShow ninja-build meson
        mkdir .PAPER-ICON
        cd .PAPER-ICON
        git clone https://github.com/snwh/paper-icon-theme.git
        cd ./paper-icon-theme
        sudo meson "build" --prefix=/usr
        sudo ninja -C "build" install
        cd ../../
        rm -rf .PAPER-ICON
      elif [ "$select" == "2" ]; then
        echo -e "\033[1;32m"
        echo "正在安裝Numix-icon-circle..."
        echo -e "\033[0m"
        sudo add-apt-repository -y ppa:numix/ppa
        sudo apt update
        sudo apt install $TextShow numix-icon-theme numix-icon-theme-circle numix-gtk-theme
      elif [ "$select" == "3" ]; then
        echo -e "\033[1;32m"
        echo "正在安裝Breeze-icon..."
        echo -e "\033[0m"
        sudo apt install $TextShow breeze-icon-theme breeze-cursor-theme
      elif [ "$select" == "4" ]; then 
        mkdir .MATO
        cd .MATO
        wget https://github.com/flipflop97/Mato/archive/v1.4.tar.gz
        tar zxvf v1.4.tar.gz
        cd Mato-1.4/
        sudo ./.install
        cd ../../
        rm -rf .MATO
      elif [ "$select" == "5" ]; then
        sudo apt install $TextShow papirus-icon-theme
      elif [ "$select" == "6" ]; then
        mkdir .EMERALD
        cd .EMERALD
        wget https://github.com/vinceliuice/emerald-icon-theme/archive/2018.02.02.tar.gz
        tar zxvf 2018.02.02.tar.gz
        cd emerald-icon-theme-2018.02.02
        sudo ./Emerald-installer.sh
        cd ../../
        rm -rf .EMERALD
      elif [ "$select" == "7" ]; then
        break
      fi
  
    done
  
  ##安裝其他必要程式
  ##  安裝Vim
  ##  安裝screenfetch
  ##  安裝0.91版以上的inkscape版本(直接避免遇到中文語系連選的BUG的版本)
  
  echo -e "\033[1;32m"
  echo "正在安裝其他必要程式..."
  echo -e "\033[0m"
  sudo add-apt-repository -y ppa:inkscape.dev/stable
  sudo apt update
  sudo apt install $TextShow screenfetch
  sudo apt install $TextShow neofetch
  sudo apt install $TextShow lolcat
  sudo apt install $TextShow inkscape
  sudo apt install $TextShow vim
  sudo apt install $TextShow w3m
  sudo apt install $TextShow conky-all
  
  ##Chrome或Chromium安裝詢問
  while :
    do
      echo -e "\033[1;32m"
      printf "你想要安裝Chrome或chromium嗎？(Y/N)"
      read IsChr
      echo -e "\033[0m"
      if [ "$IsChr" == "Y" ] || [ "$IsChr" == "y" ]; then 
        while :
          do
            echo -e "\033[1;32m"
            echo "請選則編輯器："
            echo "1) Chromium"
            echo "2) Chrome"
            echo "3) 結束"
            printf "選擇選項：（請輸入代號）"
            read ChrSelect
            echo -e "\033[0m"
            if [ "$ChrSelect" == "1" ]; then
              sudo apt install $TextShow chromium-browser libnss3
            elif [ "$ChrSelect" == "2" ]; then
              ##來源：ubuntuupdates(修改)
              sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
              sudo sh -c 'echo "deb [arch="$(dpkg --print-architecture)"] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
              sudo apt update
              sudo apt install $TextShow google-chrome-stable libnss3
            elif [ "$ChrSelect" == "3" ]; then
              break
            fi
          done
        break
      elif [ "$IsChr" == "N" ] || [ "$IsChr" == "n" ]; then
        break
      fi
    done
  
  ##編輯器安裝詢問:
  while :
    do
      echo -e "\033[1;32m"
      printf "你需要基於GUI的純文字編輯嗎？(Y/N)"
      read IsGUI
      echo -e "\033[0m"
        if [ "$IsGUI" == "Y" ] || [ "$IsGUI" == "y" ]; then
          while :
            do
              echo -e "\033[1;32m"
              echo "請選則編輯器："
              echo "1) Atom"
              echo "2) Sublime"
              echo "3) Gvim"
              echo "4) Visual Studio Code"
              echo "5) Notepadqq"
              echo "6) Adobe Brackets"
              echo "7) 結束"
              printf "選擇選項：（請輸入代號）"
              read EditSelect
              echo -e "\033[0m"
              if [ "$EditSelect" == "1" ]; then 
                sudo add-apt-repository -y ppa:webupd8team/atom
                sudo apt update
                sudo apt install $TextShow atom
              elif [ "$EditSelect" == "2" ]; then
                sudo apt install $TextShow sublime-text
              elif [ "$EditSelect" == "3" ]; then 
                sudo apt install $TextShow vim-gnome
              elif [ "$EditSelect" == "4" ]; then
                ##來源：VS Code官網(修改)
                curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
                sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
                sudo sh -c 'echo "deb [arch="$(dpkg --print-architecture)"] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
                sudo apt update
                sudo apt install $TextShow code
              elif [ "$EditSelect" == "5" ]; then
                sudo add-apt-repository -y ppa:notepadqq-team/notepadqq
                sudo apt update
                sudo apt install $TextShow notepadqq
              elif [ "$EditSelect" == "6" ]; then
                sudo add-apt-repository -y ppa:webupd8team/brackets
                sudo apt update
                sudo apt install $TextShow brackets
              elif [ "$EditSelect" == "7" ]; then
                break
              fi
            done
          break
        elif [ "$IsGUI" == "N" ] || [ "$IsGUI" == "n" ]; then
          break
        fi
    done
  
  ##安裝Wine
  while :
    do
      echo -e "\033[1;32m"
      printf "需要立即安裝Wine嗎? (Y/N)"
      read IsWine
      echo -e "\033[0m"
        if [ "$IsWine" == "Y" ] || [ "$IsWine" == "y" ]; then
          #Linux Mint Vresion 19↑ (來源： WineHQ官網)
          wget -nc https://dl.winehq.org/wine-builds/Release.key
          sudo apt-key add Release.key
          sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'
          sudo apt update
          sudo apt install $TextShow --install-recommends winehq-stable
          sudo apt install $TextShow wine32 
          while :
            do 
              echo -e "\033[1;32m"  
              printf "需要順便安裝PlayOnLinux嗎? (Y/N)"
              read IsPlayOn
              echo -e "\033[0m"
              if [ "$IsPlayOn" == "Y" ] || [ "$IsPlayOn" == "y" ]; then
                wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add -
                wget http://deb.playonlinux.com/playonlinux_trusty.list -O /etc/apt/sources.list.d/playonlinux.list
                sudo apt update
                sudo apt install $TextShow xterm playonlinux
                break
              elif [ "$IsPlayOn" == "N" ] || [ "$IsPlayOn" == "n" ]; then
                break
              fi
            done
          break
        elif [ "$IsWine" == "N" ] || [ "$IsWine" == "n" ]; then
          break
        fi
    done
  
  ##Telegram安裝詢問
  while :
    do
      echo -e "\033[1;32m"
      printf "你想要安裝通訊軟體Telegram嗎？(Y/N)"
      read IsTelegram
      echo -e "\033[0m"
      if [ "$IsTelegram" == "Y" ] || [ "$IsTelegram" == "y" ]; then
        sudo add-apt-repository -y ppa:atareao/telegram
        sudo apt update
        sudo apt install $TextShow telegram-desktop
        break
      elif [ "$IsTelegram" == "N" ] || [ "$IsTelegram" == "n" ]; then
        break
      fi
    done
  
  ##teamviewer
  while :
    do
      echo -e "\033[1;32m"
      printf "你想要安裝遠端軟體TeamViewer嗎？(Y/N)"
      read IsTeamViewer
      echo -e "\033[0m"
      if [ "$IsTeamViewer" == "Y" ] || [ "$IsTeamViewer" == "y" ]; then
        mkdir .TEAMVIEW
        cd .TEAMVIEW
        wget https://download.teamviewer.com/download/linux/teamviewer_$(dpkg     --print-architecture).deb
        sudo apt install $TextShow ./teamviewer_$(dpkg --print-architecture).deb
        cd ..
        sudo rm -rf .TEAMVIEW
        break
      elif [ "$IsTeamViewer" == "N" ] || [ "$IsTeamViewer" == "n" ]; then 
        break
      fi
    done
  
  ##bleachbit安裝詢問
  while :
    do
      echo -e "\033[1;32m"
      printf "你想要安裝清除快取用軟體bleachbit嗎？(Y/N)"
      read IsBleachBit
      echo -e "\033[0m"
      if [ "$IsBleachBit" == "Y" ] || [ "$IsBleachBit" == "y" ]; then
        sudo apt install $TextShow bleachbit
        break
      elif [ "$IsBleachBit" == "N" ] || [ "$IsBleachBit" == "n" ]; then
        break
      fi
    done
  
  ##krita 安裝詢問
  while :
    do
      echo -e "\033[1;32m"
      printf "預設庫中的Krita版本較舊，你想要安裝最新版繪圖軟體Krita嗎？(Y/N)"
      read IsKrita
      echo -e "\033[0m"
      if [ "$IsKrita" == "Y" ] || [ "$IsKrita" == "y" ]; then
        ##修改來自Krita Lime PPA
        sudo add-apt-repository -y ppa:kritalime/ppa
        sudo apt update
        sudo apt install $TextShow krita krita-l10n
        break
      elif [ "$IsKrita" == "N" ] || [ "$IsKrita" == "n" ]; then
        break
      fi
    done

  ##steam 安裝詢問
  while :
    do
      echo -e "\033[1;32m"
      printf "你是否想安裝Steam平台嗎？(Y/N)"
      read IsSteam
      echo -e "\033[0m"
      if [ "$IsSteam" == "Y" ] || [ "$IsSteam" == "y" ]; then
        sudo apt install $TextShow steam
        break
      elif [ "$IsSteam" == "N" ] || [ "$IsSteam" == "n" ]; then
        break
      fi
    done
 
  ##OpenShot 安裝詢問
  while :
    do
      echo -e "\033[1;32m"
      printf "你想要安裝影片剪輯軟體OpenShot嗎？(Y/N)"
      read IsOpenShot
      echo -e "\033[0m"
      if [ "$IsOpenShot" == "Y" ] || [ "$IsOpenShot" == "y" ]; then
        sudo apt install $TextShow openshot
        break
      elif [ "$IsOpenShot" == "N" ] || [ "$IsOpenShot" == "n" ]; then 
        break
      fi
    done
  
  ##輸出結束
  echo -e "\033[1;32m"
  echo "安裝結束"
  echo -e "\033[0m"
  
  ##詢問重新啟動
  while :
    do
      echo -e "\033[1;32m"
      printf "需要立即重新啟動嗎？(Y/N)"
      read DoReboot
      echo -e "\033[0m"
      if [ "$DoReboot" == "Y" ] || [ "$DoReboot" == "y" ]; then
        screenfetch
        sudo reboot now
        break
      elif [ "$DoReboot" == "N" ] || [ "$DoReboot" == "n" ]; then
        screenfetch
        break
      fi
    done
fi
