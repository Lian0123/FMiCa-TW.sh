# FMiCa-TW.sh
全名：For Mint Cinnamon To Taiwan User Intall Progream Of Bash Shell  

這是個給 Linux Mint Cinnamon Taiwan 使用者的安裝程式用腳本

用途為加速安裝步驟，雖然比較像是個人使用的...（笑）

#### 安裝方式：
```

#18.x的版本
sudo ./FMiCa-TW18x.sh

#19.x的版本
sudo ./FMiCa-TW.sh

```


#### 直接安裝套件：
* expect ： 自動化控制的腳本（本程式安裝時不會用到）
    * license ： [Public domain](https://zh.wikipedia.org/wiki/公有领域)

* scim-chewing ： scim的注音輸入法，適用於Mint Cinnamon 18.0與18.1版本，個人建議
    * license ： [GPL2.0](https://zh.wikipedia.org/wiki/GNU通用公共许可证#GPLv2)

* fcitx-chewing  ： fcitx的注音輸入法，適用於Mint Cinnamon 18.2後的版本
    * license ： [GPL2.0](https://zh.wikipedia.org/wiki/GNU通用公共许可证#GPLv2)

* git ： 後續部份軟體需由git clone下載
    * license ： [GPL2.0 與 GPL2.1](https://zh.wikipedia.org/wiki/GNU通用公共许可证#GPLv2)

* make ：後續部份軟體需由make指令安裝
    * license ： [GPL3](https://zh.wikipedia.org/wiki/GNU通用公共许可证#GPLv3)
    
* screenfetch ： 終端機顯示系統狀態+系統ASCII圖示，安裝結束時顯示用
    * license ： [GPL3](https://zh.wikipedia.org/wiki/GNU通用公共许可证#GPLv3)

* neofetch ： 終端機顯示系統狀態+系統ASCII圖示
    * license ： [MIT許可協定](https://zh.wikipedia.org/wiki/MIT許可證)
    
* vim :  終端機上的純文字編輯器，因大多系統預設vi，所以安裝vim
    * license ： [Vim許可協定](https://zh.wikipedia.org/wiki/Vim#协议)

* w3m ： 終端機上的紋文字瀏覽器，若圖形界面出問題時，能用終端上網差問題來源
    * license ： [MIT許可協定](https://zh.wikipedia.org/wiki/MIT許可證)

* inkscape ：開源的向量圖形設計軟體，主要是因為據0.91版會遇到中文語系的Bug，所以直接安裝0.92含以上的版本
    * license ： [GPL](https://zh.wikipedia.org/wiki/GNU通用公共许可证#GPLv1)


#### 詢問安裝套件：
##### [圖標主題] Paper-Icon：
  * ninja-build ： Paper-Icon安裝用
    * license ： [Apache License 2.0](https://zh.wikipedia.org/wiki/Apache许可证)
    
  * meson ：  Paper-Icon安裝用
    * license ： [Apache License 2.0](https://zh.wikipedia.org/wiki/Apache许可证)
  
  * paper-icon ： Paper圖標
      * license ： [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/deed.zh_TW)

  * paper-theme ： Paper主題
      * license ： [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/deed.zh_TW)


##### [圖標主題] Numix-icon-circle：
  * numix-icon-theme：Numix主題
    * license ： [GPL3](https://zh.wikipedia.org/wiki/GNU通用公共许可证#GPLv3)

  * numix-icon-theme-circle：Numix圖標
    * license ： [GPL3](https://zh.wikipedia.org/wiki/GNU通用公共许可证#GPLv3)

  * numix-gtk-theme：Numix Gtk主題
    * license ： [GPL3](https://zh.wikipedia.org/wiki/GNU通用公共许可证#GPLv3)
  
##### [圖標主題] Breeze-icon：
  * breeze-icon-theme ： breeze圖標主題
    * license ：[LGPL2.1+](https://zh.wikipedia.org/wiki/GNU宽通用公共许可证)
  
  * breeze-cursor-theme ： breeze圖標主題（含：鼠標相關...）
    * license ：[包含多種授權](http://changelogs.ubuntu.com/changelogs/pool/universe/b/breeze/breeze_5.5.5-0ubuntu1/copyright)

#####  [圖標主題] mato-icon：
  * mato-icon：mato-icon圖標主題
      * license ： [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/deed.zh_TW)
    
##### [圖標主題] papirus-icon-theme：
  * papirus-icon-theme  ： papirus-icon-theme圖標主題
    * license ：[GPL3](https://zh.wikipedia.org/wiki/GNU通用公共许可证#GPLv3)
    
##### [圖標主題] emerald-icon-theme：
  * emerald-icon-theme ： emerald-icon-theme 圖標主題
    * license ：[CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/deed.zh_TW)
       
##### [圖標主題] Mint-Y-Colora-themes：
  * Mint-Y-Colora-themes ： Mint-Y-Colora圖標主題
    * license ：[不明](https://github.com/erikdubois/Mint-Y-Colora-Theme-Collection)

##### [瀏覽器] Chromium：
  * chromium-browser ： Google-Chromium瀏覽器
    * license ：[BSD授權](https://zh.wikipedia.org/wiki/BSD%E8%AE%B8%E5%8F%AF%E8%AF%81)
  
  * libnss3 ： Google-Chrome、Google-Chromium 會用到的函式庫
    * license ：[MPL](https://zh.wikipedia.org/wiki/Mozilla公共许可证) / [GPL](https://zh.wikipedia.org/wiki/GNU通用公共许可证#GPLv1)
    
##### [瀏覽器] Chrome：
  * google-chrome-stable ： Google-Chrome瀏覽器（穩定版）
    * license ：[專有軟體](https://www.google.com/intl/zh-TW/chrome/privacy/eula_text.html)
    
  * libnss3 ： Google-Chrome、Google-Chromium 會用到的函式庫
    * license ：[MPL](https://zh.wikipedia.org/wiki/Mozilla公共许可证) / [GPL](https://zh.wikipedia.org/wiki/GNU通用公共许可证#GPLv1)
  
##### [編輯器] Atom：
  * atom ： 文字編輯器
    * license ： [MIT許可協定](https://zh.wikipedia.org/wiki/MIT許可證)

##### [編輯器] Sublime：
  * sublime-text ：文字編輯器
    * license ： [專有軟體](https://www.sublimetext.com/eula)

##### [編輯器] Gvim：
  * vim-gnome ： 文字編輯器，支援圖形界面的vim
    * license ： [Vim許可協定](https://zh.wikipedia.org/wiki/Vim#协议)
  
##### [編輯器] Visual Studio Code：
  * code ：文字編輯器
    * license ：[專有軟體](https://code.visualstudio.com/license?lang=zh-tw)
      
##### [編輯器] Notepadqq：
  * notepadqq ：文字編輯器
    * license ：[GPL3](https://zh.wikipedia.org/wiki/GNU通用公共许可证#GPLv3)
      
##### [編輯器] Adobe Brackets：
  * brackets ：專用於網頁開發的編輯器
    * license ：[MIT許可協定](https://zh.wikipedia.org/wiki/MIT許可證)
  
##### [Wine] Wine：
  * wine ： 可讓Linux執行部份windows軟體，Linux mint 18.0～18.3版本可直接辨識"apt install wine"所需之套件
    * license ：[LGPL](https://zh.wikipedia.org/wiki/GNU宽通用公共许可证)
  
  * winehq-stable ： Linux mint 19版本上述指令會出現分歧意，改用直接由官方庫下載安裝
    * license ：[LGPL](https://zh.wikipedia.org/wiki/GNU宽通用公共许可证)
  
  * wine32 ： Linux mint 19版本以上的官方庫下載方法，安裝未包含wine32，所以進行安裝
    * license ：[LGPL](https://zh.wikipedia.org/wiki/GNU宽通用公共许可证)
  
##### [Wine] PlayOnLinux：
  * playonlinux ： 一個基於wine並模擬windows環境的軟體
    * license ： [GPL3](https://zh.wikipedia.org/wiki/GNU通用公共许可证#GPLv3)/[LGPL](https://zh.wikipedia.org/wiki/GNU宽通用公共许可证)
  
  * xterm ： playonlinux會提出需要xterm
    * license ：[MIT/X Consortium License](https://zh.wikipedia.org/wiki/MIT許可證)
  
##### [通訊軟體] Telegram：
  * telegram ： 一個基於隱私的通訊軟體
    * license ：用戶端[GPL3](https://zh.wikipedia.org/wiki/GNU通用公共许可证#GPLv3),伺服器端[專有軟體](https://www.sublimetext.com/eula)
  
  * orville-write ： （說明省略）
    * license ：[可免費使用、分發、修改](http://metadata.ftp-master.debian.org/changelogs/main/o/orville-write/orville-write_2.55-3_copyright)

##### [清理軟體] Bleachbit：
  * bleachbit ： 一個開源的繪圖軟體
    * license ： [GPL3](https://zh.wikipedia.org/wiki/GNU通用公共许可证#GPLv3)
    
##### [繪圖軟體] Krita：
  * krita ： 一個開源的繪圖軟體
    * license ： [GPL3](https://zh.wikipedia.org/wiki/GNU通用公共许可证#GPLv3)
        
  * krita-l10n ： krita多國語言包
    * license ： [LGPL](https://zh.wikipedia.org/wiki/GNU宽通用公共许可证)
    
##### [備份軟體] Timeshift：
  * timeshift ： 一個開源的繪圖軟體
    * license ： [GPL3](https://zh.wikipedia.org/wiki/GNU通用公共许可证#GPLv3)
    
#### 移除安裝套件：
  * fonts-arphic-* ： Mint Cinnamon 18.0～18.3預設的中文字體，因為改字體後選單上還存在所以移除


#### 檔案相關：

##### 檔名：FMiCa-TW.sh

全名：For Mint Cinnamon To Taiwan User Of Bash Shell (version 19.x)

用途：幫忙linux mint cinnamon 19.x版本快速安裝一些必要的程式

##### 檔名：FMiCa-TW18x.sh

全名：For Mint Cinnamon To Taiwan User Of Bash Shell (version 18.x)

用途：幫忙linux mint cinnamon 18.x版本快速安裝一些必要的程式

##### 檔名：NextVersion.log

全名：NextVersion.log

用途：紀錄下個版本要新增的功能

##### 檔名：README.md

全名：README.md 

用途：簡介文件
