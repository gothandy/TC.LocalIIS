# TC Local IIS

## Notes

Use the NuGet package to install this utility.

The package will be marked as a development dependancy so it won't get auto-packaged in your projects.

For debugging your `Global.asax` see article below.

Uninstall will remove the host file entry and revert the project to IIS Express.

Tested on Visual Studio 2013.

Worth un-checking *Apply server settings to all users (store in project file)* otherwise project won't install until Local IIS instance created.

An `empty.txt` is used in the `lib` folder to ensure the `install.ps1` and `uninstall.ps1` are called and this package isn't installed as a solution package.

## References

http://blogs.msdn.com/b/mpeder/archive/2014/05/14/powershell-configure-web-application-use-iis-in-a-nuget-package.aspx

http://weblog.west-wind.com/posts/2011/Dec/15/Debugging-ApplicationStart-and-Module-Initialization-with-IIS-and-Visual-Studio