object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 273
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 15
  object EditRootCssFolder: TLabeledEdit
    Left = 32
    Top = 48
    Width = 353
    Height = 23
    EditLabel.Width = 82
    EditLabel.Height = 15
    EditLabel.Caption = 'Root CSS folder'
    TabOrder = 0
    Text = 'D:\HtmlFilter-test\html-edit'
  end
  object EditOutputFileName: TLabeledEdit
    Left = 32
    Top = 104
    Width = 353
    Height = 23
    EditLabel.Width = 94
    EditLabel.Height = 15
    EditLabel.Caption = 'Output File Name'
    TabOrder = 1
    Text = 'D:\_Repos\css-reaper\css-reaper.css'
  end
  object EditResult: TLabeledEdit
    Left = 32
    Top = 216
    Width = 353
    Height = 23
    EditLabel.Width = 32
    EditLabel.Height = 15
    EditLabel.Caption = 'Result'
    TabOrder = 2
    Text = ''
  end
  object BitBtn1: TBitBtn
    Left = 32
    Top = 152
    Width = 353
    Height = 25
    Action = acReapCssFiles
    Caption = 'Reap CSS Files'
    TabOrder = 3
  end
  object ActionList: TActionList
    Left = 352
    Top = 8
    object acReapCssFiles: TAction
      Caption = 'Reap CSS Files'
      OnExecute = acReapCssFilesExecute
    end
  end
end
