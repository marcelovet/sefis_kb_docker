:: This file is part of an automated update process of
:: infrastructure files and should not be run standalone. 
:: For more details about the update process see comments 
:: in tlmgr.pl (subroutine write_w32_updater).

  if [%1]==[:doit] goto :doit
  if not exist "%~dp0tar.exe" goto :notar
  cmd.exe /e:on/v:off/d/c call "%~f0" :doit 2^>"%~dp0update-self.log" 1^>^&2
  if not errorlevel 1 tlmgr.bat "update" "--all"
  goto :eof

:notar
  echo %~nx0: cannot run without "%~dp0tar.exe"
  findstr "^::" <"%~f0"
  exit /b 1

:doit
  set prompt=TL$G
  title TeX Live Manager 2022 Update
  set PERL5LIB=C:/Users/marce/AppData/Roaming/TinyTeX/tlpkg/tlperl/lib
  >con echo DO NOT CLOSE THIS WINDOW!
  >con echo TeX Live infrastructure update in progress ...
  >con echo Detailed command logging to "%~dp0update-self.log"
  pushd "%~dp0.."
  if not errorlevel 1 goto :update
  >con echo Could not change working directory to "%~dp0.."
  >con echo Aborting infrastructure update, no changes have been made.
  >con rem 
  popd
  exit /b 1
    
:update
  for %%I in (texlive.infra.tar) do (
    temp\tar.exe -xmf temp\%%I
    if errorlevel 1 goto :rollback
  )
  tlpkg\tlperl\bin\perl.exe .\texmf-dist\scripts\texlive\tlmgr.pl _include_tlpobj tlpkg\tlpobj\texlive.infra.tlpobj
  if errorlevel 1 goto :rollback
  >>"C:/Users/marce/AppData/Roaming/TinyTeX/texmf-var/web2c/tlmgr.log" echo [%date% %time%] self update: texlive.infra ^(62297 -^> 63037^)
  >con echo self update: texlive.infra ^(62297 -^> 63037^)
  del "%~dp0*.tar" "%~dp0tar.exe" 
  >con echo Infrastructure update finished successfully.
  >con echo About to restart tlmgr to complete update ...
  >con rem 
  popd
  exit /b 0

:rollback
  >>"C:/Users/marce/AppData/Roaming/TinyTeX/texmf-var/web2c/tlmgr.log" echo [%date% %time%] failed self update: texlive.infra ^(62297 -^> 63037^)
  >con echo failed self update: texlive.infra ^(62297 -^> 63037^)
  >con echo Rolling back to previous version ...
  for %%I in (__BACKUP_texlive.infra.r62297.tar) do (
    temp\tar.exe -xmf temp\%%I
    if errorlevel 1 goto :panic
  )
  tlpkg\tlperl\bin\perl.exe .\texmf-dist\scripts\texlive\tlmgr.pl _include_tlpobj tlpkg\tlpobj\texlive.infra.tlpobj
  if errorlevel 1 goto :panic
  >>"C:/Users/marce/AppData/Roaming/TinyTeX/texmf-var/web2c/tlmgr.log" echo [%date% %time%] self restore: texlive.infra ^(62297^)
  >con echo self restore: texlive.infra ^(62297^)
  >con echo Infrastructure update failed. Previous version has been restored.
  >con rem 
  popd
  exit /b 1

:panic
  >>"C:/Users/marce/AppData/Roaming/TinyTeX/texmf-var/web2c/tlmgr.log" echo [%date% %time%] failed self restore: texlive.infra ^(62297^)
  >con echo failed self restore: texlive.infra ^(62297^)
  >con echo FATAL ERROR:
  >con echo Infrastructure update failed and backup recovery failed too.
  >con echo To repair your TeX Live installation download and run:
  >con echo https://mirror.ctan.org/systems/texlive/tlnet/update-tlmgr-latest.exe
  >con rem 
  popd
  exit /b 666