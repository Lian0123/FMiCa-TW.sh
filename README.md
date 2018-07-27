# FMiCa-TW.sh
全名：For Mint Cinnamon To Taiwan User Intall Progream Of Bash Shell  

這是個給 Linux Mint Cinnamon Taiwan 使用者的安裝程式用腳本，但...距離完成還有一段的時間...

用途為加速安裝步驟，雖然比較像是個人使用的...（笑）


#### 直接安裝套件：
expect ： 自動化控制的腳本（本程式安裝時不會用到）

scim-chewing ： scim的注音輸入法，適用於Mint Cinnamon 18.0與18.1版本，個人建議

fcitx-chewing  ： fcitx的注音輸入法，適用於Mint Cinnamon 18.2後的版本

git ： 後續部份軟體需由git clone下載

make ：後續部份軟體需由make指令安裝

screenfetch ： 終端機顯示系統狀態+系統ASCII圖示，安裝結束時顯示用

vim :  終端機上的純文字編輯器，因大多系統預設vi，所以安裝vim

w3m ： 終端機上的紋文字瀏覽器，若圖形界面出問題時，能用終端上網差問題來源

inkscape ：開源的向量圖形設計軟體，主要是因為據0.91版會遇到中文語系的Bug，所以直接安裝0.92含以上的版本



#### 詢問安裝套件：
##### [圖標主題] Paper-Icon：
  * ninja-build ： Paper-Icon安裝用
  
  * meson ：  Paper-Icon安裝用
  
  * paper-icon ： Paper圖標

  * paper-theme ： Paper主題


##### [圖標主題] Numix-icon-circle：
  * numix-icon-theme：Numix主題

  * numix-icon-theme-circle：Numix圖標

  * numix-gtk-theme：Numix Gtk主題
  
##### [圖標主題] Breeze-icon：
  * breeze-icon-theme ： breeze圖標主題
  
  * breeze-cursor-theme ： breeze圖標主題（含：鼠標相關...）

##### [瀏覽器] Chrome：
  * google-chrome-stable ： Google-Chrome瀏覽器（穩定版）
  
  * libnss3 ： Google-Chrome會用到的函式庫
  
##### [編輯器] Atom：
  * atom ： 文字編輯器

##### [編輯器] Sublime：
  * sublime-text ：文字編輯器
  

##### [編輯器] Gvim：
  * vim-gnome ： 文字編輯器，支援圖形界面的vim
  
##### [編輯器] Visual Studio Code：
  * code ：文字編輯器
  
##### [Wine] Wine：
  * wine ： 可讓Linux執行部份windows軟體，Linux mint 18.0～18.3版本可直接辨識"apt install wine"所需之套件
  
  * winehq-stable ： Linux mint 19版本上述指令會出現分歧意，改用直接由官方庫下載安裝
  
  * wine32 ： Linux mint 19版本以上的官方庫下載方法，安裝未包含wine32，所以進行安裝
  
##### [Wine] PlayOnLinux：
  * playonlinux ： 一個基於wine並模擬windows環境的軟體
  
  * xterm ： playonlinux會提出需要xterm
  
##### [通訊軟體] Telegram：
  * telegram ： 一個基於隱私的通訊軟體
  
  * orville-write ： （說明省略）

#### 移除安裝套件：
fonts-arphic-* ： Mint Cinnamon 18.0～18.3預設的中文字體，因為改字體後選單上還存在所以移除


#### 檔名：FMiCa-TW.sh

全名：For Mint Cinnamon To Taiwan User Of Bash Shell 

用途：幫忙快速安裝一些必要的程式

#### 檔名：README.md

全名：README.md 

用途：簡介文件
