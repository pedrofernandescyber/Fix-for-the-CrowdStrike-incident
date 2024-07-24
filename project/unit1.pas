unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Windows, Process;
type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  SearchRec: TSearchRec;
  FileFound: Boolean;
  search_path: string;
  SearchPattern: string;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  search_path := 'C:\Windows\System32\drivers\CrowdStrike\';
  SearchPattern := search_path + 'C-00000291*.sys';

   FileFound := FindFirst(SearchPattern, faAnyFile, SearchRec) = 0;

   if FileFound then
   begin
     ShowMessage('File found: ' + SearchRec.Name);
   end
   else
   begin
     ShowMessage('SUCCESS! No file found starting with "C-00000291" was found!');
   end;

   SysUtils.FindClose(SearchRec);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  ShellExecute(0, 'open', 'https://www.pedrof.com', nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  AProcess: TProcess;
begin
  AProcess := TProcess.Create(nil);
  try
    AProcess.Executable := 'cmd.exe';
    AProcess.Options := AProcess.Options;
    AProcess.Execute;
  finally
    AProcess.Free;
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);
var
  AProcess: TProcess;
begin
  AProcess := TProcess.Create(nil);
  try
    AProcess.Executable := 'notepad.exe';
    AProcess.Options := AProcess.Options;
    AProcess.Execute;
  finally
    AProcess.Free;
  end;
end;

procedure TForm1.Button7Click(Sender: TObject);
var
  Process: TProcess;
  Command: TStringList;
  BatchFileName: string;
begin
  Process := TProcess.Create(nil);
  Command := TStringList.Create;
  try
    // Create the batch file content
    Command.Add('@echo off');
    Command.Add('manage-bde -protectors C: -get -Type RecoveryPassword');
    Command.Add('echo.');
    Command.Add('echo Enter recovery key for the C Drive - Works both with and without the hyphens');
    Command.Add('set /p recovery_key="Key: "');
    Command.Add('manage-bde -unlock C: -recoverypassword %recovery_key%');
    Command.Add('echo.');
    Command.Add('echo Press any key or close this window to exit');
    Command.Add('pause');

    // Save the batch file to %TEMP% directory
    BatchFileName := SysUtils.GetEnvironmentVariable('TEMP') + PathDelim + 'fixer_unlock_drive.bat';
    Command.SaveToFile(BatchFileName);

    // Configure the process to execute cmd and run the batch file
    Process.Executable := 'cmd.exe';
    Process.Parameters.Add('/c');
    Process.Parameters.Add(BatchFileName);
    Process.Options := Process.Options + [poWaitOnExit];

    // Run the process
    Process.Execute;

    // Delete the batch file after execution
    DeleteFile(PChar(BatchFileName));

  finally
    Process.Free;
    Command.Free;
  end;

end;

procedure TForm1.Button8Click(Sender: TObject);
var
  AProcess: TProcess;
begin
  AProcess := TProcess.Create(nil);
  try
    AProcess.Executable := 'taskmgr.exe';
    AProcess.Options := AProcess.Options;
    AProcess.Execute;
  finally
    AProcess.Free;
  end;
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
  ShellExecute(0, 'open', 'https://www.pedrof.com', nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Search_Path := 'C:\Windows\System32\drivers\CrowdStrike\';
  SearchPattern := Search_Path + 'C-00000291*.sys';

  FileFound := FindFirst(SearchPattern, faAnyFile, SearchRec) = 0;

  if FileFound then
  begin
    repeat
      if SysUtils.DeleteFile(Search_Path + SearchRec.Name) then
      begin
        ShowMessage('Deleted file: ' + SearchRec.Name);
      end
      else
      begin
        ShowMessage('Failed to delete file: ' + SearchRec.Name);
      end;
    until FindNext(SearchRec) <> 0;
    SysUtils.FindClose(SearchRec);
  end
  else
  begin
    ShowMessage('No file found starting with "C-00000291" and ending with ".sys".');
  end;
end;

end.

