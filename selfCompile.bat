//>NUL 2>NUL||@GOTO :BATCH
/*
:BATCH
@ECHO OFF
SETLOCAL
SET "frm=%SystemRoot%\Microsoft.NET\Framework\"
FOR /f "tokens=* delims=" %%v IN ('DIR /b /a:d  /o:-n "%SystemRoot%\Microsoft.NET\Framework\v*"') DO (
   SET netver=%%v
   GOTO :BREAL_LOOP
)
:BREAL_LOOP
SET csc=%frm%%netver%\csc.exe
CALL %csc% /nologo /out:"%~n0.exe" "%~dpsfnx0" 
%~n0.exe
ENDLOCAL

REM Uncomment the entry below to delete the script after execution 
REM DEL "%~f0"

REM Comment the entry below to keep the executable after its executed
DEL "%~n0.exe"

EXIT /b 0
*/
using System.Windows.Forms;
using System.Diagnostics;
public class Hello
{
   public static void Main()
   {
      System.Console.WriteLine("Hello From C Sharp, Dynamicly Compiled and Deleted After Execution!");
	 // Application.Exit();	
   }
}
