unit CssReaperMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, System.Actions, Vcl.ActnList, Vcl.Buttons;

type
  TForm1 = class(TForm)
    EditRootCssFolder: TLabeledEdit;
    EditOutputFileName: TLabeledEdit;
    EditResult: TLabeledEdit;
    BitBtn1: TBitBtn;
    ActionList: TActionList;
    acReapCssFiles: TAction;
    procedure acReapCssFilesExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

{$R *.dfm}


procedure ReapCssFile (const FileName: string; Properties: TStringList);
var
  CssFile : TStringList;
  Line    : integer;
begin
  try
    CssFile := TStringList.Create;
    CssFile.LoadFromFile(FileName);
    for Line := 0 to CssFile.Count-1 do
      if CssFile[Line][1] = #9 then
        Properties.Append(CssFile[Line]);
  finally
    FreeAndNil(CssFile);
  end;
end;


function ReapCssFilesFromFolder (const FolderName: string; Properties: TStringList): integer;
var
  SearchRec  : TSearchRec;
  FilesCount : integer;
begin
  FilesCount := 0;

  if FindFirst(FolderName + '\*.*', faDirectory, SearchRec) = 0 then
    repeat
      if (SearchRec.Name <> '.') And (SearchRec.Name <> '..') And ((SearchRec.Attr and faDirectory) <> 0) then
        Inc (FilesCount, ReapCssFilesFromFolder(FolderName + '\' + SearchRec.Name, Properties));
    until FindNext(SearchRec) <> 0;

  if FindFirst(FolderName + '\*.css', faAnyFile, SearchRec) = 0 then
    repeat
      if (SearchRec.Attr and faDirectory) = 0 then
        ReapCssFile(FolderName + '\' + SearchRec.Name, Properties);
      Inc (FilesCount);
    until FindNext(SearchRec) <> 0;

  FindClose(SearchRec);
  Result := FilesCount;
end;


function ReapCssFiles(const RootFolderName, PropertiesFileName: string): string;
var
  Properties      : TStringList;
  FilesCount      : integer;
  PropertiesCount : integer;
begin
  try
    Properties := TStringList.Create;
    FilesCount := ReapCssFilesFromFolder(RootFolderName, Properties);
  finally
    Properties.WriteBOM := false;
    Properties.SaveToFile(PropertiesFileName, TEncoding.UTF8);
    PropertiesCount := Properties.Count;
    FreeAndNil(Properties);
    Result := 'Reaper has found ' + IntToStr(FilesCount) + ' CSS files with ' + IntToStr(PropertiesCount) + ' properties';
  end;
end;


procedure TForm1.acReapCssFilesExecute(Sender: TObject);
begin
  EditResult.Text := ReapCssFiles(EditRootCssFolder.Text, EditOutputFileName.Text);
end;


end.
