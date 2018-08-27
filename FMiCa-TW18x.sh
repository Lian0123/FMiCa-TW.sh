#!/bin/bash

#program:
# 用於Linux mint cinnamon 18.x 安裝完成後的更新與安裝必要程式

#History:
# 2017/05/25 Lian0123 version:0.0.1

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
echo -e "  #  檔名：FMiCa-TW18x.sh                                           #  "
echo -e "  #  全名：For Mint Cinnamon To Taiwan User Of Bash Shell        #  "
echo -e "  #  用途：幫忙快速安裝程式                                      #  "
echo -e "  #  The Program from : Lian0123                                 #  "
echo -e "  #  The Version : 1.1.1                                         #  "
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
sudo apt upgrade -y

##安裝expect
echo -e "\033[1;32m"
echo "正在安裝expect..."
echo -e "\033[0m"
sudo apt install -y expect

#Linux Mint 18、18.1 （18.2不確定）
if [ $(lsb_release -rs) == 18 ]||[ $(lsb_release -rs) == 18.1 ]
  then
  ##安裝SCIM
  echo -e "\033[1;32m"
  echo "正在安裝SCIM中文注音..."
  echo -e "\033[0m"
  sudo apt install -y scim-chewing
else
  ##安裝Fcitx
  echo -e "\033[1;32m"
  echo "正在安裝Fcitx中文注音..."
  echo -e "\033[0m"
  sudo apt install -y fcitx-chewing 
fi

#Linux Mint 18~18.3的類似標體的字體移除
##移除難看的字體
echo -e "\033[1;32m"
echo "正在移除看似有點醜的字體系列..."
echo -e "\033[0m"
sudo apt remove -y fonts-arphic-*

##安裝git
echo -e "\033[1;32m"
echo "正在安裝git..."
echo -e "\033[0m"
sudo apt install -y git

##安裝make
echo -e "\033[1;32m"
echo "正在安裝make..."
echo -e "\033[0m"
sudo apt install -y make 

##自訂選項設定（選擇）

##圖標主題安裝詢問：
while :
  do
    echo -e "\033[1;32m"
    echo "你需要安裝其他的圖標主題嗎？(請輸入選項數字)"
    echo "1) Paper-icon"
    echo "2) Numix-icon-circle"
    echo "3) Breeze-icon"
    echo "4) Mint-Y-Colora-Theme-Collection"
    echo "5) 結束"
    printf "請輸入你的選項："
    re ad select
    echo -e "\033[0m"
    if [ "$select" == "1" ] 
      then
      ##來源：paper icon 的 github(修改)
      echo -e "\033[1;32m"
      echo "正在安裝Paper-icon..."
      echo -e "\033[0m"
      sudo apt install -y ninja-build meson
      mkdir .PAPER-ICON
      cd .PAPER-ICON
      git clone https://github.com/snwh/paper-icon-theme.git
      cd ./paper-icon-theme
      sudo meson "build" --prefix=/usr
      sudo ninja -C "build" install
      cd ../../
      rm -rf .PAPER-ICON
    elif [ "$select" == "2" ] 
      then
      echo -e "\033[1;32m"
      echo "正在安裝Numix-icon-circle..."
      echo -e "\033[0m"
      sudo add-apt-repository -y ppa:numix/ppa
      sudo apt update
      sudo apt install -y numix-icon-theme numix-icon-theme-circle numix-gtk-theme
    elif [ "$select" == "3" ]
      then
      echo -e "\033[1;32m"
      echo "正在安裝Breeze-icon..."
      echo -e "\033[0m"
      sudo apt install -y breeze-icon-theme breeze-cursor-theme
    elif [ "$select" == "4" ]
      then
      if [[ "$(cinnamon --version)" > "Cinnamon 3.8.0" ]]
        then
        echo -e "\033[1;32m"
        echo "[略過]不建議Cinnamon 3.8.0+安裝Mint-Y-Colora-Theme-Collection"
        echo -e "\033[0m"
      elif [[ "$(cinnamon --version)" > "Cinnamon 3.3.9" ]]
        then
        echo -e "\033[1;32m"
        echo "正在安裝Mint-Y-Colora-Theme-Collection..."
        echo -e "\033[0m"
        mkdir .MYCTC
        cd .MYCTC
        git clone https://github.com/erikdubois/Mint-Y-Colora-Theme-Collection.git
        cd ./Mint-Y-Colora-Theme-Collection
        ./theme-mint-y-colora-collection-3.4-v1.sh
        cd ../../
        rm -rf .MYCTC
      elif [[ "$(cinnamon --version)" > "Cinnamon 3.1.9" ]]
        then
        echo -e "\033[1;32m"
        echo "正在安裝Mint-Y-Colora-Theme-Collection..."
        echo -e "\033[0m"
        mkdir .MYCTC
        cd .MYCTC
        git clone https://github.com/erikdubois/Mint-Y-Colora-Theme-Collection.git
        cd ./Mint-Y-Colora-Theme-Collection
        ./theme-mint-y-colora-collection-3.2-v1.sh
        cd ../../
        rm -rf .MYCTC
      elif [[ "$(cinnamon --version)" > "Cinnamon 2.9.9" ]]
        then
        echo -e "\033[1;32m"
        echo "正在安裝Mint-Y-Colora-Theme-Collection..."
        echo -e "\033[0m"
        mkdir .MYCTC
        cd .MYCTC
        git clone https://github.com/erikdubois/Mint-Y-Colora-Theme-Collection.git
        cd ./Mint-Y-Colora-Theme-Collection
        ./theme-mint-y-colora-collection-3.0-v1.sh
        cd ../../
        rm -rf .MYCTC
      else
        echo "[略過]抱歉你的Cinnamon版本小於(3.0.0)，請進行升級"
      fi
    elif [ "$select" == "5" ]
      then 
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
sudo add-apt-repository -y ppa:djcj/screenfetch
sudo add-apt-repository -y ppa:inkscape.dev/stable
sudo apt update
sudo apt install -y screenfetch inkscape vim  w3m

##Chrome或Chromium安裝詢問
while :
  do
    echo -e "\033[1;32m"
    printf "你想要安裝Chrome或chromium嗎？(Y/N)"
    read IsChr
    echo -e "\033[0m"
    if [ "$IsChr" == "Y" ] || [ "$IsChr" == "y" ]
      then 
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
          if [ "$ChrSelect" == "1" ]
            then
              sudo apt install -y chromium-browser libnss3
          elif [ "$ChrSelect" == "2" ]
            then
              ##來源：ubuntuupdates(修改)
              sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
              sudo sh -c 'echo "deb [arch="$(dpkg --print-architecture)"] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
              sudo apt update
              sudo apt install -y google-chrome-stable libnss3
          elif [ "$ChrSelect" == "3" ]
            then
              break
          fi
        done
      break
    elif [ "$IsChr" == "N" ] || [ "$IsChr" == "n" ]
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
              echo "2) Sublime"
              echo "3) Gvim"
              echo "4) Visual Studio Code"
              echo "5) 結束"
              printf "選擇選項：（請輸入代號）"
              read EditSelect
              echo -e "\033[0m"
              if [ "$EditSelect" == "1" ]
                then 
                  sudo add-apt-repository -y ppa:webupd8team/atom
                  sudo apt update
                  sudo apt install -y atom
              elif [ "$EditSelect" == "2" ]
                then
                  sudo apt install -y sublime-text
              elif [ "$EditSelect" == "3" ]
                then 
                  sudo apt install -y vim-gnome
              elif [ "$EditSelect" == "4" ]
                then
                  ##來源：VS Code官網(修改)
                  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
                  sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
                  sudo sh -c 'echo "deb [arch="$(dpkg --print-architecture)"] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
                  sudo apt update
                  sudo apt install -y code
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
          #Linux Mint Vresion 19↓
          sudo apt install -y wine
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
              sudo apt update
              sudo apt install -y xterm playonlinux
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

##Telegram安裝詢問
while :
  do
    echo -e "\033[1;32m"
    printf "你想要安裝通訊軟體Telegram嗎？(Y/N)"
    read IsTelegram
    echo -e "\033[0m"
    if [ "$IsTelegram" == "Y" ] || [ "$IsTelegram" == "y" ]
      then
      sudo add-apt-repository -y ppa:atareao/telegram
      sudo apt update
      sudo apt install -y telegram orville-write
      break
    elif [ "$IsTelegram" == "N" ] || [ "$IsTelegram" == "n" ]
      then break
    fi
  done

##Bleachbit安裝詢問
while :
  do
    echo -e "\033[1;32m"
    printf "你想要安裝清除快取用軟體bleachbit嗎？(Y/N)"
    read IsBleachBit
    echo -e "\033[0m"
    if [ "$IsBleachBit" == "Y" ] || [ "$IsBleachBit" == "y" ]
      then
      sudo apt install -y bleachbit
      break
    elif [ "$IsBleachBit" == "N" ] || [ "$IsBleachBit" == "n" ]
      then break
    fi
  done

##Krita安裝詢問
while :
  do
    echo -e "\033[1;32m"
    printf "預設的Krita版本較舊，你想要安裝較新版繪圖軟體Krita嗎？(Y/N)"
    read IsKrita
    echo -e "\033[0m"
    if [ "$IsKrita" == "Y" ] || [ "$IsKrita" == "y" ]
      then
      ##修改來自Kubuntu Updates(曾經遇過無法裝最新版的問題)
      ##主目的還是讓原本可能無法切換中文解決，需從此PPA安裝krita-l10n語言套件
      sudo add-apt-repository -y ppa:kubuntu-ppa/ppa
      sudo apt-get update
      sudo apt-get install -y krita krita-l10n
      break
    elif [ "$IsKrita" == "N" ] || [ "$IsKrita" == "n" ]
      then break
    fi
  done

##Timeshift安裝詢問
while :
  do
    echo -e "\033[1;32m"
    printf "你想要安裝備份軟體Timeshift嗎？(Y/N)"
    read IsTimeshift
    echo -e "\033[0m"
    if [ "$IsTimeshift" == "Y" ] || [ "$IsTimeshift" == "y" ]
      then
      sudo apt-get install -y timeshift
      break
    elif [ "$IsTimeshift" == "N" ] || [ "$IsTimeshift" == "n" ]
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
        sudo reboot now
        break
    elif [ "$DoReboot" == "N" ] || [ "$DoReboot" == "n" ]
      then
        screenfetch
        break
    fi
  done
