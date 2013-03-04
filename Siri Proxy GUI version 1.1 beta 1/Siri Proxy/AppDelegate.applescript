--
--  AppDelegate.applescript
--  Siri Proxy
--
--  Created by Beno Gottschalk Sarfati on 2/23/13.
--  Copyright (c) 2013 Beno Gottschalk Sarfati. All rights reserved.
--

script AppDelegate
	property parent : class "NSObject"
    
    -- Variables --
    
    property serverPortText : missing value
    property serverIPText : missing value
    property passwordText : missing value
    property pathToSiriProxyText : missing value
    property pathToSiriProxy2Text : missing value
    property stateLabelText : missing value
    
    property bunldleButton : missing value
    property pathChooseButton : missing value
    property pathChoose2Button : missing value
    property restartButton : missing value
    property gencertButton : missing value
    property updateButton : missing value
    property startButton : missing value
    property stopButton : missing value
    property consoleButton : missing value
    property consoleBoxState : missing value
    
    -- Variables end
    -------------------------------------
    -- Timer --
    
    property NSTimer : class "NSTimer"
    property timerLabel : missing value
    property T1m : 0
    property T1s : 0
    property T1h : 0
    property timer : null
    
    on timerStart()
        set T1m to minutes of (current date)
        set T1s to seconds of (current date)
        set T1h to hours of (current date)
        set timer to NSTimer's scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(1, me, "timerAction:", "Timer", true)
    end timerStart
    
    on timerAction_(sender)
        set T2m to minutes of (current date)
        set T2s to seconds of (current date)
        set T2h to hours of (current date)
        if (T2h < T1h)
            set TTh to (T2h - T1h) + 60
        else
            set TTh to T2h - T1h
        end if
        if (T2m < T1m)
            set TTm to (T2m - T1m) + 60
            set TTh to TTh - 1
        else
            set TTm to T2m - T1m
        end if
            if (T2s < T1s)
                set TTs to (T2s - T1s) + 60
                set TTm to TTm - 1
            else
                set TTs to T2s - T1s
        end if
        if (TTh < 10) then set TTh to "0" & TTh as text
        if (TTm < 10) then set TTm to "0" & TTm as text
        if (TTs < 10) then set TTs to "0" & TTs as text
        timerLabel's setStringValue_("Uptime: " & TTh as text & ":" & TTm as text & ":" & TTs as text)
    end timerAction_

    -- Timer end --
    ------------------------
    -- User Data Methods --

    -- User data create files

    on fileExists(theFile)
        tell application "System Events"
            if exists file theFile then
                return true
                else
                return false
            end if
        end tell
    end fileExists
    
    on checkPlist()
        set userName to short user name of (system info)
        set plistFilePath to "Macintosh HD:Users:" & userName & ":Library:Application Support:"
        set plistFolderPath to plistFilePath & "Siri Proxy:"
        set plistFilePathName to plistFolderPath & "Siri Proxy"
        set plistPath to "Macintosh HD:Users:" & userName & ":Library:Application Support:Siri Proxy:Siri Proxy.plist:"
        
        if not fileExists(plistFolderPath) then
            tell application "Finder"
                try
                    make new folder at alias plistFilePath with properties {name:"Siri Proxy"}
                end try
            end tell
        end if
        
        if not fileExists(plistPath) then
            tell application "System Events"
                set the parent_dictionary to make new property list item with properties {kind:record}
                set pl to ¬
                make new property list file with properties {contents:parent_dictionary, name:plistFilePathName}
                tell property list file plistPath
                    tell contents
                        set value to {|serverPortText|:""}
                        set previousValue to value
                        set value to (previousValue & {|serverIPText|:""})
                        set previousValue to value
                        set value to (previousValue & {|passwordText|:""})
                        set previousValue to value
                        set value to (previousValue & {|serverIPText|:""})
                        set previousValue to value
                        set value to (previousValue & {|pathToSiriProxyText|:""})
                        set previousValue to value
                        set value to (previousValue & {|pathToSiriProxy2Text|:""})
                        set previousValue to value
                        set value to (previousValue & {|logLevelText|:""})
                        set previousValue to value
                        set value to (previousValue & {|consoleEnableText|:""})
                    end tell
                end tell
            end tell
        end if
    end checkPlist
    
    -- Data return key press
    
    on userServerPort_(sender)
        set userName to short user name of (system info)
        set plistPath to "Macintosh HD:Users:" & userName & ":Library:Application Support:Siri Proxy:Siri Proxy.plist:"
        set serverPortTextPlist to (stringValue() of serverPortText) as text
        tell application "System Events"
            tell property list file plistPath
                tell contents
                    set value of property list item "serverPortText" to serverPortTextPlist
                end tell
            end tell
        end tell
    end userServerPort_
    
    on userServerIP_(sender)
        set userName to short user name of (system info)
        set plistPath to "Macintosh HD:Users:" & userName & ":Library:Application Support:Siri Proxy:Siri Proxy.plist:"
        set serverIPTextPlist to (stringValue() of serverIPText) as text
        tell application "System Events"
            tell property list file plistPath
                tell contents
                    set value of property list item "serverIPText" to serverIPTextPlist
                end tell
            end tell
        end tell
    end userServerIP_
    
    on userPassword_(sender)
        set userName to short user name of (system info)
        set plistPath to "Macintosh HD:Users:" & userName & ":Library:Application Support:Siri Proxy:Siri Proxy.plist:"
        set passwordTextPlist to (stringValue() of passwordText) as text
        tell application "System Events"
            tell property list file plistPath
                tell contents
                    set value of property list item "passwordText" to passwordTextPlist
                end tell
            end tell
        end tell
    end userPassword_
    
    on userPathTOSiriProxy_(sender)
        set userName to short user name of (system info)
        set plistPath to "Macintosh HD:Users:" & userName & ":Library:Application Support:Siri Proxy:Siri Proxy.plist:"
        set pathToSiriProxyTextPlist to (stringValue() of pathToSiriProxyText) as text
        tell application "System Events"
            tell property list file plistPath
                tell contents
                    set value of property list item "pathToSiriProxyText" to pathToSiriProxyTextPlist
                end tell
            end tell
        end tell
    end userPathTOSiriProxy_
    
    on userPathTOSiriProxy2_(sender)
        set userName to short user name of (system info)
        set plistPath to "Macintosh HD:Users:" & userName & ":Library:Application Support:Siri Proxy:Siri Proxy.plist:"
        set pathToSiriProxy2TextPlist to (stringValue() of pathToSiriProxy2Text) as text
        tell application "System Events"
            tell property list file plistPath
                tell contents
                   set value of property list item "pathToSiriProxy2Text" to pathToSiriProxy2TextPlist
                end tell
            end tell
        end tell
    end userPathTOSiriProxy2_
    
    -- Start/stop data save
    
    on loadAppStart()
        checkPlist()
        set userName to short user name of (system info)
        set plistPath to "Macintosh HD:Users:" & userName & ":Library:Application Support:Siri Proxy:Siri Proxy.plist:"
        tell application "System Events"
            tell property list file plistPath
                tell contents
                    serverPortText's setStringValue_(value of property list item "serverPortText")
                    serverIPText's setStringValue_(value of property list item "serverIPText")
                    passwordText's setStringValue_(value of property list item "passwordText")
                    pathToSiriProxyText's setStringValue_(value of property list item "pathToSiriProxyText")
                    pathToSiriProxy2Text's setStringValue_(value of property list item "pathToSiriProxy2Text")
                end tell
            end tell
        end tell
    end loadAppStart
    
    on saveAppExit()
        checkPlist()
        set userName to short user name of (system info)
        set plistPath to "Macintosh HD:Users:" & userName & ":Library:Application Support:Siri Proxy:Siri Proxy.plist:"
        set serverPortTextPlist to (stringValue() of serverPortText) as text
        set serverIPTextPlist to (stringValue() of serverIPText) as text
        set passwordTextPlist to (stringValue() of passwordText) as text
        set pathToSiriProxyTextPlist to (stringValue() of pathToSiriProxyText) as text
        set pathToSiriProxy2TextPlist to (stringValue() of pathToSiriProxy2Text) as text
        tell application "System Events"
            tell property list file plistPath
                tell contents
                    set value of property list item "serverPortText" to serverPortTextPlist
                    set value of property list item "serverIPText" to serverIPTextPlist
                    set value of property list item "passwordText" to passwordTextPlist
                    set value of property list item "pathToSiriProxyText" to pathToSiriProxyTextPlist
                    set value of property list item "pathToSiriProxy2Text" to pathToSiriProxy2TextPlist
                end tell
            end tell
        end tell
    end saveAppExit
    
    -- User Data Methods End --
    ----------------------------
    -- Button Methods (start/stop/bundle/restart/update/hide/show/gencerts) and default methods and check methods--
    
    -- Check Methods --
    
    on checkPassword()
        tell application "System Events"
            set userName to short user name of (system info)
            set plistPath to "Macintosh HD:Users:" & userName & ":Library:Application Support:Siri Proxy:Siri Proxy.plist:"
            tell property list file plistPath
                tell contents
                    set passwordTextGet to value of property list item "passwordText"
                end tell
            end tell
            if passwordTextGet = ""
            set passwordTextReturn to text returned of (display dialog "Enter password for " & quoted form of userName with title "Siri Proxy" with icon 1 default answer "" with hidden answer)
            else
                set passwordTextReturn to passwordTextGet
            end if
        end tell
        tell application "Terminal" to activate
        delay 1
        return passwordTextReturn
    end checkPassword

    on checkPath()
        tell application "System Events"
            set userName to short user name of (system info)
            set plistPath to "Macintosh HD:Users:" & userName & ":Library:Application Support:Siri Proxy:Siri Proxy.plist:"
            tell property list file plistPath
                tell contents
                    set pathToSiriProxyTextGet to value of property list item "pathToSiriProxyText"
                end tell
            end tell
            if (pathToSiriProxyTextGet = "") then
                set pathToSiriProxyTextReturn to "/Users/Beno/SiriProxy/"
            else if (the last character of pathToSiriProxyTextGet is "/") then
                set pathToSiriProxyTextReturn to pathToSiriProxyTextGet
            else
                set pathToSiriProxyTextReturn to pathToSiriProxyTextGet & "/"
            end if
        end tell
        return pathToSiriProxyTextReturn
    end checkPath

    on checkPath2()
        tell application "System Events"
            set userName to short user name of (system info)
            set plistPath to "Macintosh HD:Users:" & userName & ":Library:Application Support:Siri Proxy:Siri Proxy.plist:"
            tell property list file plistPath
                tell contents
                    set pathToSiriProxy2TextGet to value of property list item "pathToSiriProxy2Text"
                end tell
            end tell
            if (pathToSiriProxy2TextGet = "") then
                set pathToSiriProxy2TextReturn to "/Users/Beno/.siriproxy/"
            else if (the last character of pathToSiriProxy2TextGet is "/") then
                set pathToSiriProxy2TextReturn to pathToSiriProxy2TextGet
            else
                set pathToSiriProxy2TextReturn to pathToSiriProxy2TextGet & "/"
            end if
        end tell
        return pathToSiriProxy2TextReturn
    end checkPath2

    on checkPort()
        tell application "System Events"
            set userName to short user name of (system info)
            set plistPath to "Macintosh HD:Users:" & userName & ":Library:Application Support:Siri Proxy:Siri Proxy.plist:"
            tell property list file plistPath
                tell contents
                    set serverPortGet to value of property list item "serverPortText"
                end tell
            end tell
            if (serverPortGet = "") then
                set serverPortReturn to "443"
                else
                set serverPortReturn to serverPortGet
            end if
        end tell
        return serverPortReturn
    end checkPort

    on checkIP()
        tell application "System Events"
            set userName to short user name of (system info)
            set plistPath to "Macintosh HD:Users:" & userName & ":Library:Application Support:Siri Proxy:Siri Proxy.plist:"
            tell property list file plistPath
                tell contents
                    set serverIPGet to value of property list item "serverIPText"
                end tell
            end tell
            if (serverIPGet = "") then
                set serverIPReturn to "0.0.0.0"
                else
                set serverIPReturn to serverIPGet
            end if
        end tell
        return serverIPReturn
    end checkIP

    on checkServerState()
        try
            do shell script "ps ax | grep ruby | grep -v grep"
            return 1
        on error
            return 0
        end try
    end checkServerState

    on checkServerUpdateState()
        try
            do shell script "ps ax | grep git | grep -v grep"
            return 1
            on error
            return 0
        end try

    end checkServerUpdateState

    -- End Check Methods --
    ----------------------
    -- Default methods --
    
    on dnsmasqStart()
        tell application "System Events"
            keystroke "sudo dnsmasq"
            keystroke return
        end tell
    end dnsmasqStart
    
    on siriProxyServer()
        set returnValuePort to checkPort()
        set returnValueIP to checkIP()
        set returnValuePath to checkPath()
        tell application "System Events"
            keystroke "rvmsudo " & returnValuePath & "bin/./siriproxy server -p " & returnValuePort & " -L " & returnValueIP
            keystroke return
        end tell
    end siriProxyServer

    on siriProxyBundle()
        set returnValuePath to checkPath()
        tell application "System Events"
            keystroke "rvmsudo " & returnValuePath & "bin/./siriproxy bundle"
            keystroke return
        end tell
    end siriProxyBundle
        
    on siriProxyUpdate()
        set returnValuePath to checkPath()
        tell application "System Events"
            keystroke "rvmsudo " & returnValuePath & "bin/./siriproxy update"
            keystroke return
        end tell
    end siriProxyUpdate
        
    on siriProxyGenCerts()
        set returnValuePath to checkPath()
        tell application "System Events"
            keystroke "rvmsudo " & returnValuePath & "bin/./siriproxy gencerts"
            keystroke return
        end tell
    end siriProxyGenCerts

    on siriProxyPassword()
        set returnValuePassword to checkPassword()
        tell application "System Events"
            keystroke returnValuePassword
            keystroke return
        end tell
    end siriProxyPassword

    on siriProxyKillallRuby()
         do shell script "killall ruby" password checkPassword() with administrator privileges
    end siriProxyKillallRuby

    on siriProxyKillallDnsmasq()
        do shell script "killall dnsmasq" password checkPassword() with administrator privileges
    end siriProxyKillallDnsmasq

    on setLabelState(labelText)
        stateLabelText's setStringValue_(labelText)
    end setLabelState

    on bundleVisible(buttonState)
        if (buttonState = 1)
            bunldleButton's setEnabled_(1)
        else if (buttonState = 0)
            bunldleButton's setEnabled_(0)
        end if
    end bundleVisible

    on pathChooseVisible(buttonState)
        if (buttonState = 1)
            pathChooseButton's setEnabled_(1)
        else if (buttonState = 0)
            pathChooseButton's setEnabled_(0)
        end if
    end bundleVisible

    on pathChoose2Visible(buttonState)
        if (buttonState = 1)
            pathChoose2Button's setEnabled_(1)
        else if (buttonState = 0)
            pathChoose2Button's setEnabled_(0)
        end if
    end bundleVisible

    on restartVisible(buttonState)
        if (buttonState = 1)
            restartButton's setEnabled_(1)
        else if (buttonState = 0)
            restartButton's setEnabled_(0)
        end if
    end restartVisible

    on updateVisible(buttonState)
        if (buttonState = 1)
            updateButton's setEnabled_(1)
        else if (buttonState = 0)
            updateButton's setEnabled_(0)
        end if
    end updateVisible

    on gencertVisible(buttonState)
        if (buttonState = 1)
            gencertButton's setEnabled_(1)
        else if (buttonState = 0)
            gencertButton's setEnabled_(0)
        end if
    end gencertVisible

    on startVisible(buttonState)
        if (buttonState = 1)
            startButton's setEnabled_(1)
        else if (buttonState = 0)
            startButton's setEnabled_(0)
        end if
    end startVisible

    on stopVisible(buttonState)
        if (buttonState = 1)
            stopButton's setEnabled_(1)
        else if (buttonState = 0)
            stopButton's setEnabled_(0)
        end if
    end stopVisible

    on consoleVisible(buttonState)
        if (buttonState = 1)
            consoleButton's setEnabled_(1)
        else if (buttonState = 0)
            consoleButton's setEnabled_(0)
        end if
    end consoleVisible

    on portLabelVisible(visibleState)
        if (visibleState = 1)
            serverPortText's setEditable_(1)
        else if (visibleState = 0)
            serverPortText's setEditable_(0)
        end if
    end portLabelVisible

    on ipLabelVisible(visibleState)
        if (visibleState = 1)
            serverIPText's setEditable_(1)
        else if (visibleState = 0)
            serverIPText's setEditable_(0)
        end if
    end ipLabelVisible

    on pathLabelVisible(visibleState)
        if (visibleState = 1)
            pathToSiriProxyText's setEditable_(1)
        else if (visibleState = 0)
            pathToSiriProxyText's setEditable_(0)
        end if
    end pathLabelVisible

    on path2LabelVisible(visibleState)
        if (visibleState = 1)
            pathToSiriProxy2Text's setEditable_(1)
        else if (visibleState = 0)
            pathToSiriProxy2Text's setEditable_(0)
        end if
    end path2LabelVisible

    on passwordLabelVisible(visibleState)
        if (visibleState = 1)
            passwordText's setEditable_(1)
        else if (visibleState = 0)
            passwordText's setEditable_(0)
        end if
    end passwordLabelVisible

    on serverRunningVisible()
        pathChooseVisible(0)
        pathChoose2Visible(0)
        stopVisible(1)
        startVisible(0)
        bundleVisible(0)
        restartVisible(1)
        updateVisible(0)
        gencertVisible(0)
        portLabelVisible(0)
        ipLabelVisible(0)
        pathLabelVisible(0)
        path2LabelVisible(0)
        passwordLabelVisible(0)
        consoleVisible(0)
    end buttonsVisible

    on serverActionVisible()
        pathChooseVisible(0)
        pathChoose2Visible(0)
        stopVisible(0)
        startVisible(0)
        bundleVisible(0)
        restartVisible(0)
        updateVisible(0)
        gencertVisible(0)
        portLabelVisible(0)
        ipLabelVisible(0)
        pathLabelVisible(0)
        path2LabelVisible(0)
        passwordLabelVisible(0)
        consoleVisible(0)
    end serverActionVisible

    on serverStoppedVisible()
        pathChooseVisible(1)
        pathChoose2Visible(1)
        stopVisible(0)
        startVisible(1)
        bundleVisible(1)
        restartVisible(0)
        updateVisible(1)
        gencertVisible(1)
        portLabelVisible(1)
        ipLabelVisible(1)
        pathLabelVisible(1)
        path2LabelVisible(1)
        passwordLabelVisible(1)
        set boxState to consoleBoxState's state as text
        if boxState = "1" then
            consoleVisible(1)
        end if
    end serverStoppedVisible

    -- Button methods

    on serverStarter_(sender)
        serverRunningVisible()
        saveAppExit()
        loadAppStart()
        setLabelState("Starting...")
        saveAppExit()
        tell application "Terminal" to activate
        delay 1.5
        tell application "Terminal" to activate
        delay 0.5
        tell application "System Events"
            keystroke "export rvmsudo_secure_path=1"
            keystroke return
            delay 0.5
        end tell
        dnsmasqStart()
        delay 0.5
        siriProxyPassword()
        delay 0.5
        siriProxyBundle()
        delay 1
        siriProxyServer()
        delay 1
        tell application "System Events"
            set visible of process "Terminal" to false
            set visible of process "Siri Proxy" to false
        end tell
        set labelState to checkServerState()
        if (labelState = 1) then
            serverRunningVisible()
            setLabelState("Server is Running")
            timerStart()
        else if (labelState = 0)
            serverStoppedVisible()
            setLabelState("Server is Stopped")
            try
                timer's invalidate()
            end try
            timerLabel's setStringValue_("Timer Stopped")
        else
            setLabelState("error")
        end if
    end serverStarter_

    on serverStopper_(sender)
        saveAppExit()
        loadAppStart()
        setLabelState("Stopping...")
        tell application "Terminal" to activate
        delay 0.5
        try
            siriProxyKillallRuby()
            siriProxyKillallDnsmasq()
        end try
        delay 0.2
        tell application "Terminal" to quit
        tell application "Siri Proxy" to activate
        serverStoppedVisible()
        try
            timer's invalidate()
        end try
        timerLabel's setStringValue_("Timer Stopped")
        setLabelState("Server is Stopped")
    end serverStopper_
       
    on serverRestart_(sender)
        serverActionVisible()
        saveAppExit()
        loadAppStart()
        setLabelState("Restarting...")
        try
            timer's invalidate()
        end try
        timerLabel's setStringValue_("Timer Stopped")
        tell application "Terminal" to activate
        delay 0.5
        try
            siriProxyKillallRuby()
            siriProxyKillallDnsmasq()
        end try
        delay 1
        tell application "Terminal" to quit
        delay 0.5
        tell application "Terminal" to activate
        tell application "System Events"
            keystroke "export rvmsudo_secure_path=1"
            keystroke return
            delay 0.5
        end tell
        dnsmasqStart()
        delay 0.5
        siriProxyPassword()
        delay 0.5
        siriProxyBundle()
        delay 1
        siriProxyServer()
        tell application "System Events"
            set visible of process "Terminal" to false
            set visible of process "Siri Proxy" to false
        end tell
        serverRunningVisible()
        timerStart()
        setLabelState("Server is Running")
    end serverRestart_

    on serverBundle_(sender)
        serverActionVisible()
        saveAppExit()
        loadAppStart()
        setLabelState("Bundling...")
        tell application "Terminal" to activate
        delay 1.5
        tell application "Terminal" to activate
        delay 0.5
        try
            siriProxyKillallRuby()
        end try
        delay 0.5
        tell application "System Events"
            keystroke "export rvmsudo_secure_path=1"
            keystroke return
            delay 0.5
        end tell
        siriProxyBundle()
        delay 0.5
        siriProxyPassword()
        delay 1
        tell application "Terminal" to quit
        tell application "Siri Proxy" to activate
        serverStoppedVisible()
        setLabelState("Server is Stopped")
    end serverBundle_
        
    on serverUpdate_(sender)
        serverActionVisible()
        saveAppExit()
        loadAppStart()
        setLabelState("Updating...")
        tell application "Terminal" to activate
        delay 1.5
        tell application "Terminal" to activate
        delay 0.5
        try
            siriProxyKillallRuby()
        end try
        delay 0.5
        tell application "System Events"
            keystroke "export rvmsudo_secure_path=1"
            keystroke return
            delay 0.5
        end tell
        siriProxyUpdate()
        delay 0.5
        siriProxyPassword()
        repeat
            set labelState to checkServerUpdateState()
            set labelState1 to checkServerState()
            delay 0.5
            if (labelState = 0) and (labelState1 = 0) then exit repeat
        end repeat
        delay 2
        tell application "Terminal" to quit
        tell application "Siri Proxy" to activate
        serverStoppedVisible()
        setLabelState("Server is Stopped")
    end serverUpdate_

    on serverGencerts_(sender)
        serverActionVisible()
        saveAppExit()
        loadAppStart()
        setLabelState("Genereting Cert...")
        tell application "Terminal" to activate
        delay 1.5
        tell application "Terminal" to activate
        delay 0.5
        try
            siriProxyKillallRuby()
        end try
        delay 0.5
        tell application "System Events"
            keystroke "export rvmsudo_secure_path=1"
            keystroke return
            delay 0.5
        end tell
        siriProxyGenCerts()
        delay 0.2
        siriProxyPassword()
        delay 2
        tell application "Terminal" to quit
        tell application "Siri Proxy" to activate
        delay 0.2
        set certAnswer to button returned of (display dialog "Send Certificate by email?" with title "Siri Proxy - Gencert" with icon 1 buttons {"Cancel", "Send"} default button "Send")
        if (certAnswer = "Send") then
            set returnValuePath2 to checkPath2()
            set theAttachment to returnValuePath2 & "ca.pem"
            set messageContent to "This email was generated by the app Siri Proxy. To install the certificate click on the attachement. It will redirect you to Settings. If you have a passcode, the Settings app will require you to put it. This does NOT jailbreak the iDevice nor access your data.
            
 "
            tell application "Mail"
                set theMessage to make new outgoing message with properties {visible:true, subject:"Siri Proxy Certificate", content:messageContent}
                tell content of theMessage
                    make new attachment with properties {file name:theAttachment} at after last paragraph
                end tell
                activate
            end tell
        end if
        serverStoppedVisible()
        setLabelState("Server is Stopped")
    end serverGencerts_

    on serverHide_(sender)
        saveAppExit()
        loadAppStart()
        tell application "System Events"
            set visible of process "Terminal" to false
            set visible of process "Siri Proxy" to false
        end tell
    end serverHide_

    on serverShow_(sender)
        saveAppExit()
        loadAppStart()
        tell application "Terminal" to activate
        tell application "Siri Proxy" to activate
    end serverShow_

    on choosePath_(sender)
        set userName to short user name of (system info)
        set plistPath to "Macintosh HD:Users:" & userName & ":Library:Application Support:Siri Proxy:Siri Proxy.plist:"
        set choosePathReturn to choose folder with prompt "Please select SiriProxy location:" default location (path to home folder)
        set choosePathEdit to (the POSIX path of choosePathReturn)
        tell application "System Events"
            tell property list file plistPath
                tell contents
                    set value of property list item "pathToSiriProxyText" to choosePathEdit
                end tell
            end tell
        end tell
        pathToSiriProxyText's setStringValue_(choosePathEdit)
    end choosePath_

    on choosePath2_(sender)
        set userName to short user name of (system info)
        set plistPath to "Macintosh HD:Users:" & userName & ":Library:Application Support:Siri Proxy:Siri Proxy.plist:"
        set choosePath2Return to choose folder with prompt "Please select .siriproxy location:" default location (path to home folder) invisibles true
        set choosePath2Edit to (the POSIX path of choosePath2Return)
        tell application "System Events"
            tell property list file plistPath
                tell contents
                    set value of property list item "pathToSiriProxy2Text" to choosePath2Edit
                end tell
            end tell
        end tell
        pathToSiriProxy2Text's setStringValue_(choosePath2Edit)
    end choosePath2_

    on consoleEnable_(sender)
        saveAppExit()
        loadAppStart()
        set boxState to consoleBoxState's state as text
        if boxState = "1" then
            consoleButton's setEnabled_(1)
            consoleButton's setHidden_(0)
        else if boxState = "0"
            consoleButton's setEnabled_(0)
            consoleButton's setHidden_(1)
        end if
    end consoleEnable_

    on serverConsole_(sender)
        serverRunningVisible()
        saveAppExit()
        loadAppStart()
        setLabelState("Bundling...")
        tell application "Terminal" to activate
        delay 1.5
        tell application "Terminal" to activate
        delay 0.5
        try
            siriProxyKillallRuby()
        end try
        delay 0.5
        tell application "System Events"
            keystroke "export rvmsudo_secure_path=1"
            keystroke return
            delay 0.5
        end tell
        siriProxyBundle()
        delay 0.5
        siriProxyPassword()
        delay 1
        set returnValuePath to checkPath()
        tell application "System Events"
            keystroke "rvmsudo " & returnValuePath & "bin/./siriproxy console"
            keystroke return
        end tell
        setLabelState("Console is Running")
    end serverConsole_

    -- Web buttons

    on clickDonateButton_(sender)
        tell application "Safari"
            open location "https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=beno%40me%2ecom&lc=BR&currency_code=USD&bn=PP%2dDonationsBF%3abtn_donate_LG%2egif%3aNonHosted"
            activate
        end tell
    end clickDonateButton_

    on clickUpdateButton_(sender)
        tell application "Safari"
            open location "https://github.com/bgottsch"
            activate
        end tell
    end clickUpdateButton_

    on clickContactButton_(sender)
        tell application "Mail"
            set theMessage to make new outgoing message with properties {visible:true,  subject:"Siri Proxy Contact"}
            tell theMessage
                make new to recipient at end of to recipients with properties {address:"beno@me.com"}
            end tell
            activate
        end tell
    end clickContactButton_

    -- End methods --
    -----------------------------------
    -- Default Methods --
    
	on applicationWillFinishLaunching_(aNotification)
        loadAppStart()
        set labelState to checkServerState()
        if (labelState = 1) then
            serverRunningVisible()
            setLabelState("Server is Running")
            timerLabel's setStringValue_("Already running")
        else if (labelState = 0)
            serverStoppedVisible()
            setLabelState("Server is Stopped")
            timerLabel's setStringValue_("Uptime: stopped")
        else
            setLabelState("error")
        end if
    end applicationWillFinishLaunching_
    
	on applicationShouldTerminate_(sender)
        saveAppExit()
        return current application's NSTerminateNow
	end applicationShouldTerminate_
    
    -- End default methods --
    ------------------------------------
end script