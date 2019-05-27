@call "%VS140COMNTOOLS%VsDevCmd.bat"

@echo Run msbuild build URISH.Framework.sln
msbuild "..\sources\framework\sources\URISH.Framework.sln" /m /t:Build /p:Configuration=Debug
::pause

@echo Run msbuild build Urish.Diagnostic.sln
msbuild "..\sources\modules\Urish.Diagnostic\Sources\Urish.Diagnostic.sln" /m /t:Build /p:Configuration=Debug
::pause

@echo Run msbuild build Urish.Core.sln
msbuild "..\sources\modules\Urish.Core\sources\Urish.Core.sln" /m /t:Build /p:Configuration=Debug
::pause

@echo Run msbuild build Urish.Noris.sln
msbuild "..\sources\modules\Urish.Noris\sources\Urish.Noris.sln" /m /t:Build /p:Configuration=Debug
::pause

@echo Run msbuild build Urish.Scheduler.sln
msbuild "..\sources\modules\Urish.Scheduler\sources\Urish.Scheduler.sln" /m /t:Build /p:Configuration=Debug
::pause


::@echo Run msbuild build Urish.Security.sln
::msbuild "..\sources\modules\Urish.Security\Sources\Urish.Security.sln" /m /t:Build /p:Configuration=Debug
::pause

@echo Run msbuild build uRISH.Importer.sln
msbuild "..\sources\modules\Urish.Importer\sources\Urish.Integration.sln" /m /t:Build /p:Configuration=Debug
::pause

@echo Run msbuild build Urish.General.sln
msbuild "..\sources\modules\Urish.General\sources\Urish.General.sln" /m /t:Build /p:Configuration=Debug
::pause

@echo Run msbuild build Urish.Er.sln
msbuild "..\sources\modules\Urish.Er\sources\Urish.Er.sln" /m /t:Build /p:Configuration=Debug
::pause


@echo Run msbuild build uRISH.EHR.sln
msbuild "..\sources\modules\Urish.EHR\sources\uRISH.EHR.sln" /m /t:Build /p:Configuration=Debug
::pause

::@echo Run msbuild build RoadAccidents.sln
::msbuild "..\sources\modules\Urish.RoadAccidents\sources\RoadAccidents.sln" /m /t:Build /p:Configuration=Debug
::pause

pause
exit