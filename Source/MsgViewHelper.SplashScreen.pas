(**

  This module contains the OTA code to add an entry to the IDEs splash screen for the plug-in.

  @Author  David Hoyle
  @Version 1.0
  @Date    26 Feb 2017

**)
Unit MsgViewHelper.SplashScreen;

Interface

  Procedure AddSplashScreen;

Implementation

Uses
  ToolsAPI,
  SysUtils,
  Windows,
  Forms,
  MsgViewHelper.Functions,
  MsgViewHelper.ResourceStrings;

(**

  This method adds an entry to the RAD Studio IDE splash screen.

  @precon  None.
  @postcon An entry is added to the RAD Studio IDE slplash screen if the version of RAD
           Studio is 2005 and above.

**)
Procedure AddSplashScreen;

Var
  iMajor : Integer;
  iMinor : Integer;
  iBugFix : Integer;
  iBuild : Integer;
  bmSplashScreen : HBITMAP;
  SplashScreenServices : IOTASplashScreenServices;

Begin
  BuildNumber(iMajor, iMinor, iBugFix, iBuild);
  bmSplashScreen := LoadBitmap(hInstance, 'MessageViewHelper24x24');
  If Supports(SplashScreenServices, IOTASplashScreenServices, SplashScreenServices) Then
    SplashScreenServices.AddPluginBitmap(
      Format(strSplashScreenName, [iMajor, iMinor, Copy(strRevision, iBugFix + 1, 1),
        Application.Title]),
      bmSplashScreen,
      False,
      Format(strSplashScreenBuild, [iMajor, iMinor, iBugfix, iBuild]), ''
      );
End;

End.
