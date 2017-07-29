#!/bin/bash

#program:
#	用於Linux mint 18.1安裝完成後的更新
#History:
#	2017/05/25 Lian0123 version:0.0.1
#	2017/07/08 Lian0123 version:0.0.2
#	2017/07/10 Lian0123 version:0.0.3
#       2017/07/29 Lian0123 version:0.0.4
##提升權限

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
echo -e "  #  全名：Fixed Mint Cinnamon To Taiwan User Of Bash Shell      #  "
echo -e "  #  用途：幫忙快速安裝                                          #  "
echo -e "  #  The Program from : Lian0123                                 #  "
echo -e "  #  The Version : 0.0.3  （很不穩定，這還沒完成）               #  "
echo -e "  ################################################################  "
echo -e "                                                                    "
echo -e "\033[0m"

while [ 1 ]
  do
    printf "你同意要使用此腳本安裝程式嗎？現在^C還來得及(任意鍵繼續)"
    read select
  done


##UPDATE
echo "正在執行APT SOURCE-LIST UPDATE..."
apt update

##UPGRADE
echo "正在進行 APT DIST-UPGRADE..."
#apt -y dist-upgrade

##安裝SCIM
echo "正在安裝SCIM中文注音..."
apt install -y scim-chewing
##預設SCIM

##移除難看的字體
echo "正在移除看似有點醜的字體系列..."
apt remove -y fonts-arphic-*

##安裝git
echo "正在安裝git..."
apt install -y git

##安裝make
echo "正在安裝make..."
apt install -y make 

##自訂選項設定（選擇）

##字體安裝

##while [ 1 ]
  ##do
    ##wget https://noto-website.storage.googleapis.com/pkgs/Noto-hinted.zip
    ##icon下載與安裝
  ##done

while [ 1 ]
  do
    echo "你需要安裝其他的美觀圖標嗎？(請輸入選項數字)"
    echo "1.google-paper-icon"
    echo "2.Numix-icon-circle"
    echo "3.Breeze-icon"
    echo "4.No,thank..."
    printf "請輸入你的選項："
    read select
    if [ "$select" -le "4" ] || [ "$select" -ge "1"]
      then break
    fi
  done

if [ "$select" == "1" ] 
  then
  ##來源：paper icon 的 github(修改)
  mkdir .PAPER-ICON
  cd .PAPER-ICON
  git clone https://github.com/snwh/paper-icon-theme.git
  ./autogen.sh
  make
  make install
  cd ..
  rm -rf .PAPER-ICON
elif [ "$echo" == "2" ] 
  then
  ##來源：numix-icon 的 github（修改）
  add-apt-repository ppa：numix / ppa
  apt update
  apt install numix-icon-theme-circle
  apt install 
elif [ "$echo" == "3" ]
  then
  mkdir .BREEZE-ICON
  cd .BREEZE-ICON
  git clone https://github.com/NitruxSA/breeze-icon-theme.git
  cp Breeze /usr/share/icons
  cp Breeze\ Dark /usr/share/icons
  cd ..
  rm -rf .BREEZE-ICON
elif [ "$echo" == "4" ]
  then echo "好的，本次不安裝圖標"
fi

##工作列透明化選擇
while [ 1 ]
  do
    printf "你想要安裝透明工作列嗎？(Y/N)"
    read IsTable
    if [ "$IsTable" == "Y" ] || [ "$IsTable" == "y" ]
      then 
      ##DoInstall
      break
    elif [ "$IsTable" == "N" ] || [ "$IsTable" == "n" ]
      then break
    fi
  done

##安裝其他必要程式
apt install -y vim
apt install -y virtualbox

##Chrome?
while [ 1 ]
  do
    printf "你需要安裝chrome嗎？(Y/N)"
    read IsChrome
    if [ "$IsChrome" == "Y" ] || [ "$IsChrome" == "y" ]
      then
      wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
      sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
      apt update
      apt install google-chrome-stable
      break
    elif [ "$IsChrome" == "N" ] || [ "$IsChrome" == "n" ]
      then break
    fi
  done

##工程師專用選項
while [ 1 ]
  do
    printf "你是個程式工程師嗎？(Y/N)"
    read IsProgramer
    if [ "$IsProgramer" == "Y" ] || [ "$IsProgramer" == "y" ]
      then 
      while [ 1 ]
        do
          printf "你需要在此電腦上安裝伺服器程式嗎？(Y/N)"
          read DoServer
          if [ "$DoServer" == "Y" ] || [ "$DoServer" == "y" ]
            then 
            while [ 1 ]
              do
                echo "請選擇服務器："
                echo "1) Apach"
                echo "2) negix"
                printf "選擇選項：（請輸入代號）"
                read DoServerType
              done
            while [ 1 ]
              do
                echo "請選擇資料庫："
                echo "1) MySQL"
                echo "2) NoSQL"
                echo "3) MariDB"
                echo "4) MongoDB"
                echo "\"已預裝PHP與phpmyadmin\""
                printf "選擇選項：（請輸入代號）"
                read DoDBType
              done
            break
          elif [ "$DoServer" == "N" ] || [ "$DoServer" == "n" ]
            then break
          fi
        done
        		
      while [ 1 ]
        do
          printf "你需要基於GUI的純文字編輯嗎？(Y/N)"
          read IsGUI
          if [ "$IsGUI" == "Y" ] || [ "$IsGUI" == "y" ]
            then 
            echo "請選則編輯器："
            echo "1)Atom"
            echo "2)Sublime3"
            echo "3)Gvim"
            echo "4)Visual Studio Code"
            break
          elif [ "$IsGUI" == "N" ] || [ "$IsGUI" == "n" ]
            then break
          fi
        done
      while [ 1 ]
        do
          printf "你需要Android Studio嗎？(Y/N)"
          read IsAndroid
          if [ "$ISAndroid" == "Y" ] || [ "$IsAndroid" == "y" ]
            then 
            ##Install
            break
          elif [ "$ISAndroid" == "N" ] || [ "$IsAndroid" == "n" ]
            then break
          fi
        done			
      while [ 1 ]
        do
          printf "你需要Unity5.5.0-beta遊戲引擎嗎？(Y/N)"
          read IsUnity
          if [ "$IsUnity" == "Y" ] || [ "$IsUnity" == "y" ]
            then
              mkdir Unity5.5.0-bata
              cd Unity5.5.0-bata
              wget http://download.unity3d.com/download_unity/linux/unity-editor-5.5.0b1+20160830_amd64.deb
              dpkg -i ./unity-editor-5.5.0b1+20160830_amd64.deb
              cd ..
              rm -rf Unity5.5.0-bata
              break
          elif [ "$IsUnity" == "N" ] || [ "$IsUnity" == "n" ]
            then break
          fi
        done
        break
    elif [ "$IsProgramer" == "N" ] || [ "$IsProgramer" == "n" ]
      then break
    fi
  done

##Wine
while [ 1 ]
  do
    printf "需要立即安裝Wine嗎? (Y/N)"
      read IsWine
      if [ "$IsWine" == "Y" ] || [ "$IsWine" == "y" ]
        then 
        apt install -y wine
        while [ 1 ] 
          do 
            printf "需要順便安裝PlayOnLinux嗎? (Y/N)"
            read IsPlayOn
            if [ "$IsPlayOn" == "Y" ] || [ "$IsPlayOn" == "y" ]
              then
              wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add -
              wget http://deb.playonlinux.com/playonlinux_trusty.list -O 
              /etc/apt/sources.list.d/playonlinux.list
              apt update
              apt install playonlinux
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


##詢問重新啟動
while [ 1 ]
  do
    printf "需要立即重新啟動嗎？(Y/N)"
    read DoReboot
    if [ "$DoReboot" == "Y" ] || [ "$DoReboot" == "y" ]
      then reboot now
      break
    elif [ "$DoReboot" == "N" ] || [ "$DoReboot" == "n" ]
      then break
    fi
  done
