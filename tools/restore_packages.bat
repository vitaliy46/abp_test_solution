IF NOT EXIST nuget.exe (
	wget "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"
)


nuget restore "..\sources\It2g.sln"


pause
exit