object MainFrm: TMainFrm
  Left = 0
  Top = 0
  Caption = #23574#21483#20307#29983#25104#22120
  ClientHeight = 506
  ClientWidth = 1045
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #24494#36719#38597#40657
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 21
  object lblpreview: TcxLabel
    Left = 375
    Top = -108
    Caption = #25105
    ParentFont = False
    Style.Font.Charset = GB2312_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -128
    Style.Font.Name = #24494#36719#38597#40657
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Visible = False
  end
  object Panel2: TPanel
    Left = 0
    Top = 319
    Width = 1045
    Height = 187
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object cxGroupBox1: TcxGroupBox
      Left = 0
      Top = 0
      Align = alLeft
      Caption = #35774#32622
      TabOrder = 0
      Height = 187
      Width = 545
      object Panel1: TPanel
        Left = 2
        Top = 26
        Width = 200
        Height = 159
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object cbbfont: TcxFontNameComboBox
          Left = 0
          Top = 0
          Align = alTop
          ParentFont = False
          Properties.HideSelection = False
          Style.Font.Charset = GB2312_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -16
          Style.Font.Name = #24494#36719#38597#40657
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 0
          Text = #24494#36719#38597#40657
          Width = 200
        end
        object chkbold: TcxCheckBox
          Left = 0
          Top = 29
          Align = alTop
          Caption = #21152#31895
          TabOrder = 1
        end
        object chkstatic: TcxCheckBox
          Left = 0
          Top = 58
          Align = alTop
          Caption = #26012#20307
          TabOrder = 2
        end
        object chkul: TcxCheckBox
          Left = 0
          Top = 87
          Align = alTop
          Caption = #19979#21010#32447
          TabOrder = 3
        end
        object chkso: TcxCheckBox
          Left = 0
          Top = 116
          Align = alTop
          Caption = #21024#38500#32447
          TabOrder = 4
        end
      end
      object Panel3: TPanel
        Left = 202
        Top = 26
        Width = 200
        Height = 159
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object cxRadioGroup1: TcxRadioGroup
          Left = 0
          Top = 0
          Align = alTop
          Caption = #32437#23545#40784
          Properties.Columns = 3
          Properties.Items = <
            item
              Caption = #19978
              Value = '1'
            end
            item
              Caption = #20013
              Value = '2'
            end
            item
              Caption = #19979
              Value = '3'
            end>
          ItemIndex = 0
          TabOrder = 0
          Height = 49
          Width = 200
        end
        object cxRadioGroup2: TcxRadioGroup
          Left = 0
          Top = 49
          Align = alTop
          Caption = #27178#23545#40784
          Properties.Columns = 3
          Properties.Items = <
            item
              Caption = #24038
              Value = '1'
            end
            item
              Caption = #20013
              Value = '2'
            end
            item
              Caption = #21491
              Value = '3'
            end>
          ItemIndex = 0
          TabOrder = 1
          Height = 49
          Width = 200
        end
      end
      object Panel4: TPanel
        Left = 402
        Top = 26
        Width = 141
        Height = 159
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 141
          Height = 39
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Caption = #38388#38548
          Padding.Left = 5
          Padding.Top = 5
          Padding.Right = 5
          Padding.Bottom = 5
          TabOrder = 0
          object cxSpinEdit1: TcxSpinEdit
            Left = 44
            Top = 5
            Align = alRight
            Properties.AssignedValues.MinValue = True
            Properties.MaxValue = 36.000000000000000000
            TabOrder = 0
            Value = 8
            Width = 92
          end
        end
      end
    end
    object btnPreview: TcxButton
      Left = 614
      Top = 66
      Width = 89
      Height = 25
      Caption = #39044#35272
      TabOrder = 2
      OnClick = btnPreviewClick
    end
    object btnsave: TcxButton
      Left = 732
      Top = 66
      Width = 89
      Height = 25
      Caption = #20445#23384#22270#29255
      TabOrder = 3
      OnClick = btnsaveClick
    end
    object edtMain: TcxTextEdit
      Left = 614
      Top = 14
      Align = alCustom
      ParentFont = False
      Properties.MaxLength = 9
      Style.Font.Charset = GB2312_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = #24494#36719#38597#40657
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 1
      Text = #21451#35850#30340#23567#33337#35828#32763#23601#32763
      Width = 207
    end
  end
  object pnlsave: TPanel
    Left = 0
    Top = 0
    Width = 1045
    Height = 319
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    Enabled = False
    ParentBackground = False
    TabOrder = 0
    object pnlMain: TPanel
      Left = 80
      Top = 33
      Width = 873
      Height = 253
      Align = alCustom
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
    end
  end
  object SavePictureDialog1: TSavePictureDialog
    DefaultExt = 'bmp'
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 888
    Top = 343
  end
end
