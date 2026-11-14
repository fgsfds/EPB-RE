; Leading initialized data in LE object 3.
bits 32

    db 1, 1, 1, 0
    db `BOB`, 0
    db `JIMBO`, 0, 0, 0
    db `TOM`, 0
    db `JEAN`, 0, 0, 0, 0
    db `MICHELLE`, 0, 0, 0, 0
    db `ANDRE`, 0, 0, 0
    db `JOSEPH`, 0, 0
    db `CARLOS`, 0, 0
    db `JOHN`, 0, 0, 0, 0
    db `MASATO`, 0, 0
    db `MIKE`, 0, 0, 0, 0
    db `REY`, 0
    db `OSVALDO`, 0
    db `MEL`, 0
    db `TURK`, 0, 0, 0, 0
    db `YOSEMITE`, 0, 0, 0, 0
    db `FRED`, 0, 0, 0, 0
    db `JIMMY`, 0, 0, 0
    db `Quick Exit.`, 0
    db `\nYou cannot play Duke with different versions.`, 0, 0
    db `INVALID GAME PACKET!!! (%ld too many bytes)\n`, 0, 0, 0, 0
    db ` `, 0, 0, 0
    db `Locked- %ld: Leng:%ld, Lock:%ld`, 0
    db `RTS Locked %ld:`, 0
    db `Game out of sync - Please restart`, 0, 0, 0
    db `Check the PHELP.EXE for more info`, 0, 0, 0
    db `Missed Network packet!`, 0, 0
    db `Check the PHELP.EXE for more info`, 0, 0, 0

%if UPDATE
%else
    db `...`, 0
%endif

    db `%ld`, 0
    db `%d`, 0, 0
    db `%`, 0, 0, 0
    db `ON`, 0, 0
    db `OFF`, 0
    db `AUTO`, 0, 0, 0, 0
    db `X= %ld`, 0, 0
    db `Y= %ld`, 0, 0
    db `Z= %ld`, 0, 0
    db `A= %ld`, 0, 0
    db `ZV= %ld`, 0
    db `OG= %ld`, 0
    db `AM= %ld`, 0
    db `LFW= %ld`, 0, 0, 0, 0
    db `SECTL= %ld`, 0, 0
    db `SEED= %ld`, 0, 0, 0
    db `THOLD= %ld`, 0, 0
    db `duke3d.bin`, 0, 0
    db `duke3d.tmp`, 0, 0
    db `: `, 0, 0
    db `SEND MESSAGE TO...`, 0, 0
    db `A/ENTER - ALL`, 0, 0, 0
    db `      %ld - %s`, 0, 0
    db `    ESC - Abort`
    times 5 db 0
    db `GAME PAUSED`, 0
    db ` Too many sprites spawned.`, 0, 0
    db `Found lonely Sector Effector (lotag 0) at (%ld,%ld)\n`, 0, 0, 0, 0
    db `Too many moving sectors at (%ld,%ld).\n`, 0, 0
    db `Subway found no zero'd sectors with locators\nat (%ld,%ld).\n`, 0
    db `duke0000.pcx`, 0, 0, 0, 0
    db `PLAYING `, 0, 0, 0, 0
    db `streets.mid`, 0
    db `Command line help.  %s [/flags...]\n`, 0
    db ` ?, /?         This help message`, 0, 0, 0, 0
    db ` /l##          Level (1-11)`, 0
    db ` /v#           Volume (1-4)`, 0
    db ` /s#           Skill (1-4)`, 0, 0
    db ` /r            Record demo`, 0, 0
    db ` /dFILE        Start to play demo FILE`, 0, 0
    db ` /m            No monsters`, 0, 0
    db ` /ns           No sound`, 0
    db ` /nm           No music`, 0
    db ` /t#           Respawn, 1 = Monsters, 2 = Items, 3 = Inventory, x = All`, 0
    db ` /c#           MP mode, 1 = DukeMatch(spawn), 2 = Coop, 3 = Dukematch(no spawn)`, 0
    db ` /q#           Fake multiplayer (2-8 players)`, 0, 0, 0
    db ` /a            Use player AI (fake multiplayer only)`, 0, 0, 0, 0
    db ` /i#           Network mode (1/0) (multiplayer only) (default == 1)`, 0
    db ` /f#           Send fewer packets (1, 2, 4) (multiplayer only)`, 0, 0
    db ` /gFILE, /g... Use multiple group files (must be last on command line)`, 0, 0
    db ` /xFILE        Compile FILE (default PAINT.CON)`, 0
    db ` /u#########   User's favorite weapon order (default: 3425689071)`, 0, 0, 0
    db ` /#            Load and run a game (slot 0-9)`, 0, 0, 0
    db ` /z            Skip memory check`, 0, 0, 0, 0
    db ` -map FILE     Use a map FILE`, 0, 0, 0
    db ` -name NAME    Foward NAME`, 0, 0
    db ` -net          Net mode game`, 0, 0, 0, 0
    db `Could not find con file '%s'.\n`, 0, 0
    db `Using con file: '%s'\n`, 0, 0, 0
    db `.grp`, 0, 0, 0, 0
    db `Could not find group file %s.\n`, 0, 0
    db `Using group file %s.\n`, 0, 0, 0
    db `Other player AI.`, 0, 0, 0, 0
    db `Sound off.`, 0, 0
    db `Music off.`, 0, 0
    db `Network Mode %d\n`, 0, 0, 0, 0
    db `Dukematch (spawn).`, 0, 0
    db `Cooperative play.`, 0, 0, 0
    db `Dukematch (no spawn).`, 0, 0, 0
    db `Respawn on.`, 0
    db `Monsters off.`, 0, 0, 0
    db `Fake multiplayer mode.`, 0, 0
    db `Demo record mode on.`, 0, 0, 0, 0
    db `.dmo`, 0, 0, 0, 0
    db `Play demo %s.\n`, 0, 0
    db `Duke Nukem 3D v1.5 - Atomic Edition`, 0
    db `assignment to 0 done`, 0, 0, 0, 0
    db `Using favorite weapon order(s).`, 0
    db `Using default weapon orders.`, 0, 0, 0, 0
    db `d3dtimbr.tmb`, 0, 0, 0, 0
    db `  * Writing defaults to current directory.\n`, 0
    db `EXTREME PAINTBRAWL`, 0, 0
    db `* Hold Esc to Abort. *`, 0, 0
    db `Loading art header.`, 0
    db `tiles000.art`, 0, 0, 0, 0
    db `Done...`, 0
    db `Loading Paint Brawl Palettes`, 0, 0, 0, 0
    db `Multiplayer initialized.`, 0, 0, 0, 0
    db `Checking music inits.`, 0, 0, 0
    db `Checking sound inits.`, 0, 0, 0
    db `Loading Team Stats`, 0, 0
    db `ERROR LOADING TEAM STATS`, 0, 0, 0, 0

%if UPDATE
    db `...`, 0
%endif

    db `Done`, 0, 0, 0, 0
    db `Starting up Extreme PaintBrawl`, 0, 0
    db `Please put Duke Nukem 3D Atomic Edition CD in drive.`, 0, 0, 0, 0
    db `rt+`, 0
    db `debug.txt`, 0, 0, 0
    db `%ld %ld %ld %ld %ld %ld %ld\n`, 0, 0, 0, 0
    db `rt`, 0, 0
    db `cdrom.ini`, 0, 0, 0
    db `%s`, 0, 0
    db `DUKE3D.IDF`, 0, 0
    db `PaintB.grp`, 0, 0
    db `You don't have enough free memory to run Paint Brawl.`, 0, 0, 0
    db `The DOS \"mem\" command should report 6,800K (or 6.8 megs)`, 0, 0, 0, 0
    db `of \"total memory free\".\n`, 0, 0, 0, 0
    db `Paint Brawl requires %ld more bytes to run.\n`, 0, 0, 0, 0
    db `Using %ld bytes for heap.\n`, 0, 0
    db `urban.map`, 0, 0, 0
    db `space.map`, 0, 0, 0
    db `forest.map`, 0, 0
    db `castle.map`, 0, 0
    db `desert.map`, 0, 0
    db `\n=========================================================================`, 0, 0
    db `WARNING: 8250 UART detected.`, 0, 0, 0, 0
    db `Music is being disabled and lower quality sound is being set.  We apologize`, 0
    db `for this, but it is necessary to maintain high frame rates while trying to`, 0, 0
    db `play the game on an 8250.  We suggest upgrading to a 16550 or better UART`, 0, 0, 0
    db `for maximum performance.  Press any key to continue.`, 0, 0, 0, 0
    db `=========================================================================\n`, 0, 0

%if UPDATE
%else
    db `Using .RTS file:%s\n`, 0
%endif

    db `\nVESA driver for ( %ld * %ld ) not found/supported!\n`, 0, 0, 0, 0
    db `LOADING SAVED GAME...`, 0, 0, 0
    db `demo_.dmo`, 0, 0, 0
    db `demo1.dmo`, 0, 0, 0
    db `wb`, 0, 0
    db ` SAVED A MULTIPLAYER GAME`, 0, 0, 0
    db `MULTIPLAYER GAME SAVED`, 0, 0
    db ` LOADED A MULTIPLAYER GAME`, 0, 0
    db `MULTIPLAYER GAME LOADED`, 0
    db `%s had enough!`, 0, 0
    db ` \nThe 'MASTER/First player' just quit the game.  All\nplayers are returned from the game. This only happens in 5-8\nplayer mode as a different network scheme is used.`, 0, 0, 0, 0
    db `cineov2.anm`, 0
    db `vol4e1.anm`, 0, 0
    db `vol4e2.anm`, 0, 0
    db `vol4e3.anm`, 0, 0
    db `THANKS TO ALL OUR`, 0, 0, 0
    db `FANS FOR GIVING`, 0
    db `US BIG HEADS.`, 0, 0, 0
    db `LOOK FOR A DUKE NUKEM 3D`, 0, 0, 0, 0
    db `SEQUEL SOON.`, 0, 0, 0, 0
    db `DUKETEAM.ANM`, 0, 0, 0, 0
    db `cineov3.anm`, 0
    db `RADLOGO.ANM`, 0
    db `MULTIPLAYER TOTALS`, 0, 0
    db `PRESS ANY KEY TO CONTINUE`, 0, 0, 0
    db `   NAME                                           KILLS`, 0
    db `%-4ld`, 0, 0, 0
    db `stats %ld killed %ld %ld\n`, 0, 0, 0
    db `DEATHS`, 0, 0
    db `COMPLETED`, 0, 0, 0
    db `Your Time:`, 0, 0
    db `Par time:`, 0, 0, 0
    db `3D Realms' Time:`, 0, 0, 0, 0
    db `%02ld:%02ld`, 0
    db `Enemies Killed:`, 0
    db `Enemies Left:`, 0, 0, 0
    db `%-3ld`, 0, 0, 0
    db `N/A`, 0
    db `Secrets Found:`, 0, 0
    db `Secrets Missed:`, 0
    db `%-3ld%`, 0, 0
    db `Center the joystick and press a button\n`, 0
    db `Move joystick to upper-left corner and press a button\n`, 0, 0
    db `Move joystick to lower-right corner and press a button\n`, 0
    db `Center the throttle control and press a button\n`, 0
    db `Center the rudder control and press a button\n`, 0, 0, 0
    db `BOB`, 0
    db `JIMBO`, 0, 0, 0
    db `TOM`, 0
    db `JEAN`, 0, 0, 0, 0
    db `MICHELLE`, 0, 0, 0, 0
    db `ANDRE`, 0, 0, 0
    db `JOSEPH`, 0, 0
    db `CARLOS`, 0, 0
    db `JOHN`, 0, 0, 0, 0
    db `MASATO`, 0, 0
    db `MIKE`, 0, 0, 0, 0
    db `REY`, 0
    db `OSVALDO`, 0
    db `MEL`, 0
    db `TURK`, 0, 0, 0, 0
    db `YOSEMITE`, 0, 0, 0, 0
    db `FRED`, 0, 0, 0, 0
    db `JIMMY`, 0, 0, 0
    db `return.dat`, 0, 0
    db `wb`, 0, 0
    db `game.dat`, 0, 0, 0, 0
    db `mtext.pal`, 0, 0, 0
    db `mmain.pal`, 0, 0, 0
    db `mdepot.pal`, 0, 0
    db `mroster.pal`, 0
    db `cexc68.pal`, 0, 0
    db `cp86.pal`, 0, 0, 0, 0
    db `cpgp.pal`, 0, 0, 0, 0
    db `cvm68.pal`, 0, 0, 0
    db `quit.pal`, 0, 0, 0, 0
    db `mpaint.pal`, 0, 0
    db `mair.pal`, 0, 0, 0, 0
    db `BOB`, 0
    db `JIMBO`, 0, 0, 0
    db `TOM`, 0
    db `JEAN`, 0, 0, 0, 0
    db `MICHELLE`, 0, 0, 0, 0
    db `ANDRE`, 0, 0, 0
    db `JOSEPH`, 0, 0
    db `CARLOS`, 0, 0
    db `JOHN`, 0, 0, 0, 0
    db `MASATO`, 0, 0
    db `MIKE`, 0, 0, 0, 0
    db `REY`, 0
    db `OSVALDO`, 0
    db `MEL`, 0
    db `TURK`, 0, 0, 0, 0
    db `YOSEMITE`, 0, 0, 0, 0
    db `FRED`, 0, 0, 0, 0
    db `JIMMY`, 0, 0, 0

%if UPDATE
    db `YOU HAVE BEEN TAGGED`, 0, 0, 0, 0
    db `SWITCHING TO PLAYER`, 0
    db `PRESS ANY KEY`, 0, 0, 0
%else
    db `you lose`, 0, 0, 0, 0
    db `nice job yo`, 0
%endif

    db `Could not find any locators for SE# 6 and 14 with a hitag of %ld.\n`, 0, 0
    db `BOB`, 0
    db `JIMBO`, 0, 0, 0
    db `TOM`, 0
    db `JEAN`, 0, 0, 0, 0
    db `MICHELLE`, 0, 0, 0, 0
    db `ANDRE`, 0, 0, 0
    db `JOSEPH`, 0, 0
    db `CARLOS`, 0, 0
    db `JOHN`, 0, 0, 0, 0
    db `MASATO`, 0, 0
    db `MIKE`, 0, 0, 0, 0
    db `REY`, 0
    db `OSVALDO`, 0
    db `MEL`, 0
    db `TURK`, 0, 0, 0, 0
    db `YOSEMITE`, 0, 0, 0, 0
    db `FRED`, 0, 0, 0, 0
    db `JIMMY`, 0, 0, 0
    db `definelevelname`, 0
    db `actor`, 0, 0, 0
    db `addammo`, 0
    db `ifrnd`, 0, 0, 0
    db `enda`, 0, 0, 0, 0
    db `ifcansee`, 0, 0, 0, 0
    db `ifhitweapon`, 0
    db `action`, 0, 0
    db `ifpdistl`, 0, 0, 0, 0
    db `ifpdistg`, 0, 0, 0, 0
    db `else`, 0, 0, 0, 0
    db `strength`, 0, 0, 0, 0
    db `break`, 0, 0, 0
    db `shoot`, 0, 0, 0
    db `palfrom`, 0
    db `sound`, 0, 0, 0
    db `fall`, 0, 0, 0, 0
    db `state`, 0, 0, 0
    db `ends`, 0, 0, 0, 0
    db `define`, 0, 0
    db `//`, 0, 0
    db `ifai`, 0, 0, 0, 0
    db `killit`, 0, 0
    db `addweapon`, 0, 0, 0
    db `ai`, 0, 0
    db `addphealth`, 0, 0
    db `ifdead`, 0, 0
    db `ifsquished`, 0, 0
    db `sizeto`, 0, 0
    db `{`, 0, 0, 0
    db `}`, 0, 0, 0
    db `spawn`, 0, 0, 0
    db `move`, 0, 0, 0, 0
    db `ifwasweapon`, 0
    db `ifaction`, 0, 0, 0, 0
    db `ifactioncount`, 0, 0, 0
    db `resetactioncount`, 0, 0, 0, 0
    db `debris`, 0, 0
    db `pstomp`, 0, 0
    db `/*`, 0, 0
    db `cstat`, 0, 0, 0
    db `ifmove`, 0, 0
    db `resetplayer`, 0
    db `ifonwater`, 0, 0, 0
    db `ifinwater`, 0, 0, 0
    db `ifcanshoottarget`, 0, 0, 0, 0
    db `ifcount`, 0
    db `resetcount`, 0, 0
    db `addinventory`, 0, 0, 0, 0
    db `ifactornotstayput`, 0, 0, 0
    db `hitradius`, 0, 0, 0
    db `ifp`, 0
    db `count`, 0, 0, 0
    db `ifactor`, 0
    db `music`, 0, 0, 0
    db `include`, 0
    db `ifstrength`, 0, 0
    db `definesound`, 0
    db `guts`, 0, 0, 0, 0
    db `ifspawnedby`, 0
    db `runningspeed`, 0, 0, 0, 0
    db `wackplayer`, 0, 0
    db `ifgapzl`, 0
    db `ifhitspace`, 0, 0
    db `ifoutside`, 0, 0, 0
    db `ifmultiplayer`, 0, 0, 0
    db `operate`, 0
    db `ifinspace`, 0, 0, 0
    db `debug`, 0, 0, 0
    db `endofgame`, 0, 0, 0
    db `ifbulletnear`, 0, 0, 0, 0
    db `ifrespawn`, 0, 0, 0
    db `iffloordistl`, 0, 0, 0, 0
    db `ifceilingdistl`, 0, 0
    db `spritepal`, 0, 0, 0
    db `ifpinventory`, 0, 0, 0, 0
    db `betaname`, 0, 0, 0, 0
    db `cactor`, 0, 0
    db `ifphealthl`, 0, 0
    db `definequote`, 0
    db `quote`, 0, 0, 0
    db `ifinouterspace`, 0, 0
    db `ifnotmoving`, 0
    db `respawnhitag`, 0, 0, 0, 0
    db `tip`, 0
    db `ifspritepal`, 0
    db `money`, 0, 0, 0
    db `soundonce`, 0, 0, 0
    db `addkills`, 0, 0, 0, 0
    db `stopsound`, 0, 0, 0
    db `ifawayfromwall`, 0, 0
    db `ifcanseetarget`, 0, 0
    db `globalsound`, 0
    db `lotsofglass`, 0
    db `ifgotweaponce`, 0, 0, 0
    db `getlastpal`, 0, 0
    db `pkick`, 0, 0, 0
    db `mikesnd`, 0
    db `useractor`, 0, 0, 0
    db `sizeat`, 0, 0
    db `addstrength`, 0
    db `cstator`, 0
    db `mail`, 0, 0, 0, 0
    db `paper`, 0, 0, 0
    db `tossweapon`, 0, 0
    db `sleeptime`, 0, 0, 0
    db `nullop`, 0, 0
    db `definevolumename`, 0, 0, 0, 0
    db `defineskillname`, 0
    db `ifnosounds`, 0, 0
    db `clipdist`, 0, 0, 0, 0
    db `ifangdiffl`, 0, 0
    db `gravity`, 0
    db `respawntimetellhitifcanseeopteamincoscoreincfscore`, 0, 0
    db `PAINT.CON`, 0, 0, 0
    db `USER.CON`, 0, 0, 0, 0
    db `DEFS.CON`, 0, 0, 0, 0
    db `incfscore`, 0, 0, 0
    db `  * ERROR!(L%ld) Expecting a SPACE or CR between '{' and '%s'.\n`, 0
    db `  * ERROR!(L%ld) Expecting a SPACE or CR between '}' and '%s'.\n`, 0
    db `  * ERROR!(L%ld) Expecting a SPACE between '//' and '%s'.\n`, 0, 0
    db `  * ERROR!(L%ld) Expecting a SPACE between '/*' and '%s'.\n`, 0, 0
    db `  * ERROR!(L%ld) Expecting a SPACE between '*/' and '%s'.\n`, 0, 0
    db `  * ERROR!(L%ld) Expecting key word, but found '%s'.\n`, 0, 0, 0
    db `  * ERROR!(L%ld) Symbol '%s' is a key word.\n`, 0, 0, 0, 0
    db `  * ERROR!(L%ld) Parameter '%s' is undefined.\n`, 0, 0
    db `  * ERROR!(L%ld) Found '/*' with no '*/'.\n`, 0, 0
    db `  * ERROR!(L%ld) Symbol '%s' is a key word.\n`, 0, 0, 0, 0
    db `  * ERROR!(L%ld) State '%s' not found.\n`, 0
    db `  * ERROR!(L%ld) Found 'ends' with no 'state'.\n`, 0
    db `  * ERROR!(L%ld) Found more '{' than '}' before 'ends'.\n`, 0, 0, 0, 0
    db `  * ERROR!(L%ld) Found more '}' than '{' before 'ends'.\n`, 0, 0, 0, 0
    db `  * ERROR!(L%ld) Symbol '%s' is a key word.\n`, 0, 0, 0, 0
    db `  * WARNING.(L%ld) Duplicate definition '%s' ignored.\n`, 0, 0
    db `  * ERROR!(L%ld) Symbol '%s' is a key word.\n`, 0, 0, 0, 0
    db `  * WARNING.(L%ld) Duplicate move '%s' ignored.\n`, 0, 0, 0, 0
    db `  * ERROR!(L%ld) Could not find '%s'.\n`, 0, 0
    db `Including '%s'...\n`, 0, 0
    db `  * ERROR!(L%ld) Symbol '%s' is a key word.\n`, 0, 0, 0, 0
    db `  * WARNING.(L%ld) Duplicate ai '%s' ignored.\n`, 0, 0
    db `  * ERROR!(L%ld) Symbol '%s' is a key word.\n`, 0, 0, 0, 0
    db `  * WARNING.(L%ld) Duplicate action '%s' ignored.\n`, 0, 0
    db `  * ERROR!(L%ld) Found 'actor' within 'state'.\n`, 0
    db `  * ERROR!(L%ld) Found 'actor' within 'actor'.\n`, 0
    db `  * ERROR!(L%ld) Found 'useritem' within 'state'.\n`, 0, 0
    db `  * ERROR!(L%ld) Found 'useritem' within 'actor'.\n`, 0, 0
    db `  * ERROR!(L%ld) Found 'else' with no 'if'.\n`, 0, 0, 0, 0
    db `  * ERROR!(L%ld) Found more '}' than '{'.\n`, 0, 0
    db `  * ERROR!(L%ld) Volume name exceeds character size limit of 32.\n`, 0, 0, 0
    db `  * ERROR!(L%ld) Skill name exceeds character size limit of 32.\n`, 0, 0, 0, 0
    db `  * ERROR!(L%ld) Level file name exceeds character size limit of 128.\n`, 0, 0
    db `  * ERROR!(L%ld) Level name exceeds character size limit of 32.\n`, 0, 0, 0, 0
    db `  * ERROR!(L%ld) Quote amount exceeds limit of %ld characters.\n`, 0
    db `  * ERROR!(L%ld) Quote exceeds character size limit of 64.\n`, 0
    db `  * ERROR!(L%ld) Exceeded sound limit of %ld.\n`, 0, 0
    db `  * ERROR!(L%ld) Sound filename exceeded limit of 13 characters.\n`, 0, 0, 0
    db `  * ERROR!(L%ld) Found 'enda' without defining 'actor'.\n`, 0, 0, 0, 0
    db `  * ERROR!(L%ld) Found more '{' than '}' before 'enda'.\n`, 0, 0, 0, 0
    db `  * ERROR! Too many warnings or errors.`, 0
    db `wb`, 0, 0
    db `Missing external con file(s).`, 0, 0, 0
    db `COPY INTERNAL DEFAULTS TO DIRECTORY(Y/n)?`, 0, 0, 0
    db ` Yes`, 0, 0, 0, 0
    db `\nMissing con file(s).`, 0, 0, 0
    db `[Reading Script File '%s'...]\n`, 0, 0
    db `Found %ld warning(s), %ld error(s).\n`, 0, 0, 0, 0
    db `\nWarnings found in %s file.  You should backup the original copies before\n`, 0, 0
    db `before attempting to modify them.  Do you want to use the`, 0, 0, 0
    db `INTERNAL DEFAULTS (y/N)?`, 0, 0, 0, 0
    db `\nError in %s.`, 0, 0, 0
    db `\nErrors found in %s file.  You should backup the original copies\n`, 0, 0, 0
    db `before attempting to modify them.  Do you want to use the`, 0, 0, 0
    db `internal defaults (Y/N)?`
    times 8 db 0
    db `Code Size:%ld bytes(%ld labels).\n`, 0, 0, 0

%if UPDATE
    db `urban.map`, 0, 0, 0
%endif

    db `%ld\n`, 0, 0, 0, 0
    db `BOB`, 0
    db `JIMBO`, 0, 0, 0
    db `TOM`, 0
    db `JEAN`, 0, 0, 0, 0
    db `MICHELLE`, 0, 0, 0, 0
    db `ANDRE`, 0, 0, 0
    db `JOSEPH`, 0, 0
    db `CARLOS`, 0, 0
    db `JOHN`, 0, 0, 0, 0
    db `MASATO`, 0, 0
    db `MIKE`, 0, 0, 0, 0
    db `REY`, 0
    db `OSVALDO`, 0
    db `MEL`, 0
    db `TURK`, 0, 0, 0, 0
    db `YOSEMITE`, 0, 0, 0, 0
    db `FRED`, 0, 0, 0, 0
    db `JIMMY`, 0, 0, 0
    db `BOB`, 0
    db `JIMBO`, 0, 0, 0
    db `TOM`, 0
    db `JEAN`, 0, 0, 0, 0
    db `MICHELLE`, 0, 0, 0, 0
    db `ANDRE`, 0, 0, 0
    db `JOSEPH`, 0, 0
    db `CARLOS`, 0, 0
    db `JOHN`, 0, 0, 0, 0
    db `MASATO`, 0, 0
    db `MIKE`, 0, 0, 0, 0
    db `REY`, 0
    db `OSVALDO`, 0
    db `MEL`, 0
    db `TURK`, 0, 0, 0, 0
    db `YOSEMITE`, 0, 0, 0, 0
    db `FRED`, 0, 0, 0, 0
    db `JIMMY`, 0, 0, 0
    db `YOU HAVE NO GUNS`, 0, 0, 0, 0
    db `SHERRIDAN EXC`, 0, 0, 0
    db `SHERRIDAN P68`, 0, 0, 0
    db `SHERRIDAN PGP`, 0, 0, 0
    db `SHERRIDAN VM68`, 0, 0
    db `SURPLUS PAINT:`, 0, 0
    db `SURPLUS AIR:`
    times 8 db 0
    db `wb`, 0, 0
    db `game0.sav`, 0, 0, 0
    db `gameA_00.sav`, 0, 0, 0, 0
    db `LOADING...`, 0, 0
    db `GAME SAVED`, 0, 0
    db `EQUIPMENT STORE`, 0
    db `QUICK START`, 0
    db `TOURNAMENT STARTUP`, 0, 0
    db `PRACTICE`, 0, 0, 0, 0
    db `QUIT THE GAME`, 0, 0, 0
    db `ROSTER`, 0, 0
    db `BUY GUNS`, 0, 0, 0, 0
    db `BUY PAINT`, 0, 0, 0
    db `BUY CO2`, 0
    db `EXIT TO ROAD`, 0, 0, 0, 0
    db `LOOK AT TEAM SURPLUSES`, 0, 0
    db `RETURN TO EQUIPEMENT STORE`, 0, 0
    db `BACK TO ROSTER SCREEN`, 0, 0, 0
    db `TOURNAMENT SETUP`, 0, 0, 0, 0
    db `PREVIOUS PAGE`, 0, 0, 0
    db `NEXT PAGE`, 0, 0, 0
    db `BACK TO STORE`, 0, 0, 0
    db `BUY THIS GUN`, 0, 0, 0, 0
    db `INCREASE AMOUNT`, 0
    db `DECREASE AMOUNT`, 0
    db `BUY THE SPECIFIED AMOUNT`, 0, 0, 0, 0
    db `REFILL YOUR TEAM`, 0, 0, 0, 0
    db `SUBD`, 0, 0, 0, 0
    db `*.*`, 0

%if UPDATE
%else
    db `TEAM CASH:$`, 0
%endif

    db `SELECT A SAVE SPOT BEFORE`, 0, 0, 0
    db `YOU QUICK RESTORE.`, 0, 0
    db `LOAD last game:`, 0
    db `\"%s\"`, 0, 0, 0, 0
    db `(Y/N)`, 0, 0, 0
    db `LOAD GAME`, 0, 0, 0
    db `PLAYERS: %-2d                      `, 0
    db `EPISODE: %-2d / LEVEL: %-2d / SKILL: %-2d`, 0, 0, 0
    db `LOAD game:`, 0, 0
    db `ABORT this game?`, 0, 0, 0, 0
    db `SAVE GAME`, 0, 0, 0
    db `PLAYERS: %-2d                      `, 0
    db `EPISODE: %-2d / LEVEL: %-2d / SKILL: %-2d`, 0, 0, 0
    db `OVERWRITE previous SAVED game?`, 0, 0
    db `NEW GAME`, 0, 0, 0, 0
    db `OPTIONS`, 0
    db ` HELP`, 0, 0, 0
    db `QUIT TO TITLE`, 0, 0, 0
    db `QUIT GAME`, 0, 0, 0
    db `NAMES    C02    PAINT   ACCURACY   STRENGTH`, 0
    db `FREE AGENTS AVAILABLE                          FEE`, 0, 0
    db `TEAM SURPLUSES`, 0, 0
    db `PAINT GUNS OWNED:`, 0, 0, 0
    db `ROSTER SCREEN`, 0, 0, 0
    db `$`, 0, 0, 0
    db `THANK YOU`, 0, 0, 0
    db `YOU DO NOT HAVE ENOUGH MONEY`, 0, 0, 0, 0
    db `YOU ALREADY HAVE TOO MANY GUNS`, 0, 0
    db `YOU ALREADY HAVE TOO MANY GUNS`, 0, 0
    db `YOU ALREADY HAVE TOO MANY GUNS`, 0, 0
    db `YOU ALREADY HAVE TOO MANY GUNS`, 0, 0
    db `0`, 0, 0, 0
    db `PLEASE SELECT AN AMOUNT TO BUY`, 0, 0
    db `PLEASE SELECT AN AMOUNT TO BUY`, 0, 0
    db `CHOOSE AN AREA`, 0, 0
    db `HIGH`, 0, 0, 0, 0
    db `LOW`, 0
    db `ON`, 0, 0
    db `OFF`, 0
    db `FULL`, 0, 0, 0, 0
    db `DETAIL`, 0, 0
    db `SHADOWS`, 0
    db `SCREEN TILTING`, 0, 0
    db `SCREEN SIZE`, 0
    db `BRIGHTNESS`, 0, 0
    db `MOUSE SENSITIVITY`, 0, 0, 0
    db `MOUSE AIMING FLIP`, 0, 0, 0
    db `SOUNDS`, 0, 0
    db `PARENTAL LOCK`, 0, 0, 0
    db `RECORD`, 0, 0
    db `SOUND`, 0, 0, 0
    db `SOUND VOLUME`, 0, 0, 0, 0
    db `MUSIC`, 0, 0, 0
    db `MUSIC VOLUME`, 0, 0, 0, 0
    db `DUKE TALK`, 0, 0, 0
    db `AMBIENCE`, 0, 0, 0, 0
    db `FLIP STEREO`, 0
    db `duke3d.tmp`, 0, 0
    db `demo.map`, 0, 0, 0, 0
    db `PLAYERS: %-2d                      `, 0
    db `EPISODE: %-2d / LEVEL: %-2d / SKILL: %-2d`, 0, 0, 0
    db `PLAYERS: %-2d                      `, 0
    db `EPISODE: %-2d / LEVEL: %-2d / SKILL: %-2d`, 0, 0, 0
    db `EMPTY`, 0, 0, 0
    db `PLAYERS: %-2d                      `, 0
    db `EPISODE: %-2d / LEVEL: %-2d / SKILL: %-2d`, 0, 0, 0

%if UPDATE
    db `REASON: EVERYONE ON YOUR TEAM WAS TAGGED`, 0, 0, 0, 0
    db `REASON: FLAG WAS CAPTURED`, 0, 0, 0
%endif

    db `...`, 0

%if UPDATE
    db `REASON: TAGGED ALL ENEMIES`, 0, 0
    db `REASON: CAPTURED THE FLAG`, 0, 0, 0
%endif

    db `Quit to Title?`, 0, 0
    db `Waiting for master`, 0, 0
    db `to select level`, 0
    db `*.MAP`, 0, 0, 0
    db `USER MAPS`, 0, 0, 0
    db `COOPERATIVE PLAY`, 0, 0, 0, 0
    db `DUKEMATCH (NO SPAWN)`, 0, 0, 0, 0
    db `DUKEMATCH (SPAWN)`, 0, 0, 0
    db `NONE`, 0, 0, 0, 0
    db `GAME TYPE`, 0, 0, 0
    db `EPISODE %ld`, 0
    db `LEVEL %ld`, 0, 0, 0
    db `MONSTERS`, 0, 0, 0, 0
    db `MARKERS`, 0
    db `FR. FIRE`, 0, 0, 0, 0
    db `USER MAP`, 0, 0, 0, 0
    db `START GAME`, 0, 0
    db `BOB`, 0
    db `JIMBO`, 0, 0, 0
    db `TOM`, 0
    db `JEAN`, 0, 0, 0, 0
    db `MICHELLE`, 0, 0, 0, 0
    db `ANDRE`, 0, 0, 0
    db `JOSEPH`, 0, 0
    db `CARLOS`, 0, 0
    db `JOHN`, 0, 0, 0, 0
    db `MASATO`, 0, 0
    db `MIKE`, 0, 0, 0, 0
    db `REY`, 0
    db `OSVALDO`, 0
    db `MEL`, 0
    db `TURK`, 0, 0, 0, 0
    db `YOSEMITE`, 0, 0, 0, 0
    db `FRED`, 0, 0, 0, 0
    db `JIMMY`, 0, 0, 0

%if UPDATE
%else
    db `KILLED BY %s`, 0, 0, 0, 0
    db `KILLED %s`, 0, 0, 0
    db `KILLED BY PLAYER %ld`, 0, 0, 0, 0
    db `KILLED PLAYER %ld`, 0, 0, 0
    db `frag %d killed %d\n`, 0, 0
    db `yo you won`, 0, 0
%endif

    db `BOB`, 0
    db `JIMBO`, 0, 0, 0
    db `TOM`, 0
    db `JEAN`, 0, 0, 0, 0
    db `MICHELLE`, 0, 0, 0, 0
    db `ANDRE`, 0, 0, 0
    db `JOSEPH`, 0, 0
    db `CARLOS`, 0, 0
    db `JOHN`, 0, 0, 0, 0
    db `MASATO`, 0, 0
    db `MIKE`, 0, 0, 0, 0
    db `REY`, 0
    db `OSVALDO`, 0
    db `MEL`, 0
    db `TURK`, 0, 0, 0, 0
    db `YOSEMITE`, 0, 0, 0, 0
    db `FRED`, 0, 0, 0, 0
    db `JIMMY`, 0, 0, 0
    db `\nToo many cycling sectors.`, 0, 0
    db `\nToo many switches (64 max).`, 0, 0, 0, 0
    db `\nToo many mirrors (64 max.)`, 0
    db `\nToo many 'anim' walls (max 512.)`, 0, 0, 0
    db `vol41a.anm`, 0, 0
    db `vol42a.anm`, 0, 0
    db `vol43a.anm`, 0, 0
    db `\nToo many player sprites (max 16.)`, 0, 0
    db `lookup.dat`, 0, 0
    db `\nERROR: File 'LOOKUP.DAT' not found.`, 0, 0, 0, 0

%if UPDATE
    db `VER 191`, 0
%else
    db `LOADING...`, 0, 0
%endif

    db `Map %s not found!`, 0, 0, 0
    db `Thecall.mid`, 0
    db `BOB`, 0
    db `JIMBO`, 0, 0, 0
    db `TOM`, 0
    db `JEAN`, 0, 0, 0, 0
    db `MICHELLE`, 0, 0, 0, 0
    db `ANDRE`, 0, 0, 0
    db `JOSEPH`, 0, 0
    db `CARLOS`, 0, 0
    db `JOHN`, 0, 0, 0, 0
    db `MASATO`, 0, 0
    db `MIKE`, 0, 0, 0, 0
    db `REY`, 0
    db `OSVALDO`, 0
    db `MEL`, 0
    db `TURK`, 0, 0, 0, 0
    db `YOSEMITE`, 0, 0, 0, 0
    db `FRED`, 0, 0, 0, 0
    db `JIMMY`, 0, 0, 0
    db `BOB`, 0
    db `JIMBO`, 0, 0, 0
    db `TOM`, 0
    db `JEAN`, 0, 0, 0, 0
    db `MICHELLE`, 0, 0, 0, 0
    db `ANDRE`, 0, 0, 0
    db `JOSEPH`, 0, 0
    db `CARLOS`, 0, 0
    db `JOHN`, 0, 0, 0, 0
    db `MASATO`, 0, 0
    db `MIKE`, 0, 0, 0, 0
    db `REY`, 0
    db `OSVALDO`, 0
    db `MEL`, 0
    db `TURK`, 0, 0, 0, 0
    db `YOSEMITE`, 0, 0, 0, 0
    db `FRED`, 0, 0, 0, 0
    db `JIMMY`, 0, 0, 0
    db `duke3d.tmp`, 0, 0
    db `Error initializing sound.`
    times 7 db 0
    db `Couldn't find selected sound card.`, 0, 0
    db `Sound %s(#%ld) not found.`, 0, 0, 0
    db `BOB`, 0
    db `JIMBO`, 0, 0, 0
    db `TOM`, 0
    db `JEAN`, 0, 0, 0, 0
    db `MICHELLE`, 0, 0, 0, 0
    db `ANDRE`, 0, 0, 0
    db `JOSEPH`, 0, 0
    db `CARLOS`, 0, 0
    db `JOHN`, 0, 0, 0, 0
    db `MASATO`, 0, 0
    db `MIKE`, 0, 0, 0, 0
    db `REY`, 0
    db `OSVALDO`, 0
    db `MEL`, 0
    db `TURK`, 0, 0, 0, 0
    db `YOSEMITE`, 0, 0, 0, 0
    db `FRED`, 0, 0, 0, 0
    db `JIMMY`, 0, 0, 0
    db `    Adding %s.\n`, 0
    db `IWAD`, 0, 0, 0, 0
    db `RTS file %s doesn't have IWAD id\n`, 0, 0, 0
    db `RTS file could not allocate header info on stack`, 0, 0, 0, 0
    db `RTS Manager Started.\n`, 0, 0, 0
    db `RTS_SoundLength: %i >= numlumps`, 0
    db `RTS_GetSoundName: %i >= numlumps`, 0, 0, 0, 0
    db `RTS_ReadLump: %i >= numlumps`, 0, 0, 0, 0
    db `RTS_ReadLump: %i < 0`, 0, 0, 0, 0
    db `RTS_GetSound: %i >= %i\n`, 0
    db `BOB`, 0
    db `JIMBO`, 0, 0, 0
    db `TOM`, 0
    db `JEAN`, 0, 0, 0, 0
    db `MICHELLE`, 0, 0, 0, 0
    db `ANDRE`, 0, 0, 0
    db `JOSEPH`, 0, 0
    db `CARLOS`, 0, 0
    db `JOHN`, 0, 0, 0, 0
    db `MASATO`, 0, 0
    db `MIKE`, 0, 0, 0, 0
    db `REY`, 0
    db `OSVALDO`, 0
    db `MEL`, 0
    db `TURK`, 0, 0, 0, 0
    db `YOSEMITE`, 0, 0, 0, 0
    db `FRED`, 0, 0, 0, 0
    db `JIMMY`, 0, 0, 0
    db `Move_Forward`, 0, 0, 0, 0
    db `Move_Backward`, 0, 0, 0
    db `Turn_Left`, 0, 0, 0
    db `Turn_Right`, 0, 0
    db `Strafe`, 0, 0
    db `Fire`, 0, 0, 0, 0
    db `Open`, 0, 0, 0, 0
    db `Run`, 0
    db `AutoRun`, 0
    db `Jump`, 0, 0, 0, 0
    db `Crouch`, 0, 0
    db `Look_Up`, 0
    db `Look_Down`, 0, 0, 0
    db `Look_Left`, 0, 0, 0
    db `Look_Right`, 0, 0
    db `Strafe_Left`, 0
    db `Strafe_Right`, 0, 0, 0, 0
    db `Aim_Up`, 0, 0
    db `Aim_Down`, 0, 0, 0, 0
    db `Weapon_1`, 0, 0, 0, 0
    db `Weapon_2`, 0, 0, 0, 0
    db `Weapon_3`, 0, 0, 0, 0
    db `Weapon_4`, 0, 0, 0, 0
    db `Weapon_5`, 0, 0, 0, 0
    db `Weapon_6`, 0, 0, 0, 0
    db `Weapon_7`, 0, 0, 0, 0
    db `Weapon_8`, 0, 0, 0, 0
    db `Weapon_9`, 0, 0, 0, 0
    db `Weapon_10`, 0, 0, 0
    db `Inventory`, 0, 0, 0
    db `Inventory_Left`, 0, 0
    db `Inventory_Right`, 0
    db `Holo_Duke`, 0, 0, 0
    db `Jetpack`, 0
    db `NightVision`, 0
    db `MedKit`, 0, 0
    db `TurnAround`, 0, 0
    db `SendMessage`, 0
    db `Map`, 0
    db `Shrink_Screen`, 0, 0, 0
    db `Enlarge_Screen`, 0, 0
    db `Center_View`, 0
    db `Holster_Weapon`, 0, 0
    db `Show_Opponents_Weapon`, 0, 0, 0
    db `Map_Follow_Mode`, 0
    db `See_Coop_View`, 0, 0, 0
    db `Mouse_Aiming`, 0, 0, 0, 0
    db `Toggle_Crosshair`, 0, 0, 0, 0
    db `Steroids`, 0, 0, 0, 0
    db `Quick_Kick`, 0, 0
    db `Next_Weapon`, 0
    db `Previous_Weapon`, 0
    db `PaintB.CFG`, 0, 0
    db `SETUPFILE`, 0, 0, 0
    db `\nMultiple Configuration Files Encountered\n`, 0, 0
    db `========================================\n`, 0, 0, 0
    db `Please choose a configuration file from the following list by pressing its\n`, 0
    db `corresponding letter:\n`, 0, 0
    db `%c. %s\n`, 0
    db `%c. %s <DEFAULT>\n`, 0, 0, 0
    db `\n`, 0, 0, 0
    db `(%s will be used if no selection is made within 10 seconds.)\n\n`, 0, 0
    db `%ld seconds left. \r`, 0
    db `\n\n`, 0, 0
    db `Using Setup file: '%s'\n`, 0
    db `analog_turning`, 0, 0
    db `analog_strafing`, 0
    db `analog_moving`, 0, 0, 0
    db `analog_lookingupanddown`, 0
    db `KeyDefinitions`, 0, 0
    db `MouseButton%ld`, 0, 0
    db `Controls`, 0, 0, 0, 0
    db `MouseButtonClicked%ld`, 0, 0, 0
    db `MouseAnalogAxes%ld`, 0, 0
    db `MouseDigitalAxes%ld_0`, 0, 0, 0
    db `MouseDigitalAxes%ld_1`, 0, 0, 0
    db `MouseAnalogScale%ld`, 0
    db `MouseSensitivity`, 0, 0, 0, 0
    db `JoystickButton%ld`, 0, 0, 0
    db `JoystickButtonClicked%ld`, 0, 0, 0, 0
    db `GamePadDigitalAxes%ld_0`, 0
    db `GamePadDigitalAxes%ld_1`, 0
    db `JoystickPort`, 0, 0, 0, 0
    db `JoystickAnalogAxes%ld`, 0, 0, 0
    db `JoystickDigitalAxes%ld_0`, 0, 0, 0, 0
    db `JoystickDigitalAxes%ld_1`, 0, 0, 0, 0
    db `JoystickAnalogScale%ld`, 0, 0
    db `EnableRudder`, 0, 0, 0, 0
    db `game_.sav`, 0, 0, 0
    db `rb`, 0, 0
    db `ReadSetup: %s does not exist\n           Please run SETUP.EXE\n`, 0, 0, 0
    db `Comm Setup`, 0, 0
    db `PlayerName`, 0, 0
    db `NAME`, 0, 0, 0, 0
    db `MAP`, 0
    db `.map`, 0, 0, 0, 0
    db `Using level: '%s'.\n`, 0
    db `RTSName`, 0
    db `Shadows`, 0
    db `Screen Setup`, 0, 0, 0, 0
    db `Password`, 0, 0, 0, 0
    db `Detail`, 0, 0
    db `Tilt`, 0, 0, 0, 0
    db `Messages`, 0, 0, 0, 0
    db `ScreenWidth`, 0
    db `ScreenHeight`, 0, 0, 0, 0
    db `ScreenMode`, 0, 0
    db `ScreenGamma`, 0
    db `ScreenSize`, 0, 0
    db `Out`, 0
    db `Executions`, 0, 0
    db `Misc`, 0, 0, 0, 0
    db `RunMode`, 0
    db `Crosshairs`, 0, 0
    db `WeaponChoice%ld`, 0
    db `FXDevice`, 0, 0, 0, 0
    db `Sound Setup`, 0
    db `MusicDevice`, 0
    db `FXVolume`, 0, 0, 0, 0
    db `MusicVolume`, 0
    db `SoundToggle`, 0
    db `MusicToggle`, 0
    db `VoiceToggle`, 0
    db `AmbienceToggle`, 0, 0
    db `NumVoices`, 0, 0, 0
    db `NumChannels`, 0
    db `NumBits`, 0
    db `MixRate`, 0
    db `MidiPort`, 0, 0, 0, 0
    db `BlasterAddress`, 0, 0
    db `BlasterType`, 0
    db `BlasterInterrupt`, 0, 0, 0, 0
    db `BlasterDma8`, 0
    db `BlasterDma16`, 0, 0, 0, 0
    db `BlasterEmu`, 0, 0
    db `ReverseStereo`, 0, 0, 0
    db `ControllerType`, 0, 0
    db `MouseAimingFlipped`, 0, 0
    db `MouseAiming`, 0
    db `GameMouseAiming`, 0
    db `AimingFlag`, 0, 0
