#!/bin/bash

#program:
# 用於Linux mint 18.1安裝完成後的更新
#History:
# 2017/05/25 Lian0123 version:0.0.1
# 2017/07/08 Lian0123 version:0.0.2
# 2017/07/10 Lian0123 version:0.0.3
# 2017/07/29 Lian0123 version:0.0.4
# 2017/07/29 Lian0123 version:0.0.41
# 2017/08/04 Lian0123 version:0.0.42
# 2017/08/04 Lian0123 version:0.0.42-1
# 2018/04/29 Lian0123 version:0.0.43
# 2018/04/30 Lian0123 version:0.0.43-1
# 2018/06/30 Lian0123 version:0.1.0
# 2018/07/03 Lian0123 version:0.1.0-1
# 2018/07/09 Lian0123 version:0.1.1-1

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
echo -e "  #  The Program from : Lian0123                                 #  "
echo -e "  #  The Version : 0.1.1                                         #  "
echo -e "  ################################################################  "
echo -e "                                                                    "
echo -e "\033[0m"

printf "你同意要使用此腳本安裝程式嗎？現在^C中斷還來得及(任意鍵繼續)"
read select

##UPDATE
echo -e "\033[1;32m"
echo "正在執行APT UPDATE..."
echo -e "\033[0m"
apt update

##UPDATE LIST
echo -e "\033[1;32m"
echo "正在執行APT SOURCE-LIST UPGRADE..."
echo -e "\033[0m"
apt list -y --upgradable

##UPGRADE
echo -e "\033[1;32m"
echo "正在進行 APT DIST-UPGRADE..."
echo -e "\033[0m"
apt dist-upgrade -y

##安裝expect
echo -e "\033[1;32m"
echo "正在安裝SCIM中文注音..."
echo -e "\033[0m"
apt install -y expect

##安裝SCIM
echo -e "\033[1;32m"
echo "正在安裝SCIM中文注音..."
echo -e "\033[0m"
apt install -y scim-chewing


##安裝Fcitx
echo -e "\033[1;32m"
echo "正在安裝Fcitx中文注音..."
echo -e "\033[0m"
apt install -y fcitx-chewing

##移除難看的字體
echo -e "\033[1;32m"
echo "正在移除看似有點醜的字體系列..."
echo -e "\033[0m"
apt remove -y fonts-arphic-*

##安裝git
echo -e "\033[1;32m"
echo "正在安裝git..."
echo -e "\033[0m"
apt install -y git

##安裝make
echo -e "\033[1;32m"
echo "正在安裝make..."
echo -e "\033[0m"
apt install -y make 

##自訂選項設定（選擇）

while :
  do
    echo -e "\033[1;32m"
    echo "你需要安裝其他的美觀圖標嗎？(請輸入選項數字)"
    echo "1) Google-paper-icon"
    echo "2) Numix-icon-circle"
    echo "3) Breeze-icon"
    echo "4) 結束"
    printf "請輸入你的選項："
    read select
    echo -e "\033[0m"
    if [ "$select" == "1" ] 
      then
      ##來源：paper icon 的 github(修改)
      echo -e "\033[1;32m"
      echo "正在安裝Google-paper-icon..."
      echo -e "\033[0m"
      apt install -y ninja
      mkdir .PAPER-ICON
      cd .PAPER-ICON
      git clone https://github.com/snwh/paper-icon-theme.git
      meson "build" --prefix=/usr
      sudo ninja -C "build" install
      cd ..
      rm -rf .PAPER-ICON
    elif [ "$select" == "2" ] 
      then
      echo -e "\033[1;32m"
      echo "正在安裝Numix-icon-circle..."
      echo -e "\033[0m"
      sudo add-apt-repository -y ppa:numix/ppa
      apt update
      apt install -y numix-icon-theme
      apt install -y numix-icon-theme-circle
      apt install -y numix-gtk-theme
    elif [ "$select" == "3" ]
      then
      echo -e "\033[1;32m"
      echo "正在安裝Breeze-icon..."
      echo -e "\033[0m"
      apt install -y breeze-icon-theme
      apt install -y breeze-cursor-theme
    elif [ "$select" == "4" ]
      then 
        echo "好的，本次不安裝圖標"
        break
    fi

  done

##安裝其他必要程式
##  安裝Vim
##  安裝screenfetch
##  安裝0.91版以上的inkscape版本

echo -e "\033[1;32m"
echo "正在安裝其他必要程式..."
echo -e "\033[0m"
apt install -y vim
apt install -y w3m
sudo add-apt-repository -y ppa:djcj/screenfetch
sudo add-apt-repository -y ppa:inkscape.dev/stable
apt update
apt install -y screenfetch
apt install -y inkscape

##Chrome?
while :
  do
    echo -e "\033[1;32m"
    printf "你想要安裝Chrome嗎？(Y/N)"
    read IsChrome
    echo -e "\033[0m"
    if [ "$IsChrome" == "Y" ] || [ "$IsChrome" == "y" ]
      then 
      sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
      sudo sh -c 'echo "deb [arch="$(dpkg --print-architecture)"] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
      apt update
      apt install -y google-chrome-stable
      apt install -y libnss3
      break
    elif [ "$IsChrome" == "N" ] || [ "$IsChrome" == "n" ]
      then break
    fi
  done

##編輯器安裝詢問:
while :
  do
    echo -e "\033[1;32m"
    printf "你需要基於GUI的純文字編輯嗎？(Y/N)"
    read IsGUI
    echo -e "\033[0m"
      if [ "$IsGUI" == "Y" ] || [ "$IsGUI" == "y" ]
        then
          while :
            do
              echo -e "\033[1;32m"
              echo "請選則編輯器："
              echo "1) Atom"
              echo "2) Sublime3"
              echo "3) Gvim"
              echo "4) Visual Studio Code"
              echo "5) 結束"
              printf "選擇選項：（請輸入代號）"
              read EditSelect
              echo -e "\033[0m"
              if [ "$EditSelect" == "1" ]
                then 
                  sudo add-apt-repository -y ppa:webupd8team/atoma
                  apt update
                  apt install -y atom
              elif [ "$EditSelect" == "2" ]
                then
                 apt install -y sublime-text
              elif [ "$EditSelect" == "3" ]
                then 
                  apt install -y vim-gnome
              elif [ "$EditSelect" == "4" ]
                then
                  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
                  sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
                  sudo sh -c 'echo "deb [arch="$(dpkg --print-architecture)"] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
                  apt update
                  apt install -y code
              elif [ "$EditSelect" == "5" ]
                then
                  break
              fi
            done
          break
      elif [ "$IsGUI" == "N" ] || [ "$IsGUI" == "n" ]
        then
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
      if [ "$IsWine" == "Y" ] || [ "$IsWine" == "y" ]
        then 
        apt install -y wine
        while :
          do 
            echo -e "\033[1;32m"  
            printf "需要順便安裝PlayOnLinux嗎? (Y/N)"
            read IsPlayOn
            echo -e "\033[0m"
            if [ "$IsPlayOn" == "Y" ] || [ "$IsPlayOn" == "y" ]
              then
              wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add -
              wget http://deb.playonlinux.com/playonlinux_trusty.list -O /etc/apt/sources.list.d/playonlinux.list
              apt update
              apt install -y xterm
              apt install -y playonlinux
              break
            elif [ "$IsPlayOn" == "N" ] || [ "$IsPlayOn" == "n" ]
              then break
            fi
          done
        break
      elif [ "$IsWine" == "N" ] || [ "$IsWine" == "n" ] 
        then break
      fi
  done

##Telegram?
while :
  do
    echo -e "\033[1;32m"
    printf "你想要安裝Telegram嗎？(Y/N)"
    read IsTelegream
    echo -e "\033[0m"
    if [ "$IsTelegream" == "Y" ] || [ "$IsTelegream" == "y" ]
      then
      sudo add-apt-repository -y ppa:atareao/telegram
      apt update
      apt install -y telegram
      break
    elif [ "$IsChrome" == "N" ] || [ "$IsChrome" == "n" ]
      then break
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
    if [ "$DoReboot" == "Y" ] || [ "$DoReboot" == "y" ]
      then
        screenfetch
        reboot now
        break
    elif [ "$DoReboot" == "N" ] || [ "$DoReboot" == "n" ]
      then
        screenfetch
        break
    fi
  done
