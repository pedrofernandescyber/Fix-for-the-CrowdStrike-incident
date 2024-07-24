unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Windows;
type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
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

