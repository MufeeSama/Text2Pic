unit MainUnt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, cxTextEdit, Vcl.ExtCtrls, cxLabel, cxMaskEdit,
  cxDropDownEdit, cxFontNameComboBox, cxGroupBox, cxCheckBox, cxRadioGroup,
  cxSpinEdit, Vcl.ExtDlgs;

type
  TMainFrm = class(TForm)
    edtMain: TcxTextEdit;
    pnlMain: TPanel;
    cxGroupBox1: TcxGroupBox;
    Panel2: TPanel;
    cbbfont: TcxFontNameComboBox;
    lblpreview: TcxLabel;
    btnPreview: TcxButton;
    btnsave: TcxButton;
    pnlsave: TPanel;
    cxRadioGroup1: TcxRadioGroup;
    cxRadioGroup2: TcxRadioGroup;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    cxSpinEdit1: TcxSpinEdit;
    chkbold: TcxCheckBox;
    chkstatic: TcxCheckBox;
    chkul: TcxCheckBox;
    chkso: TcxCheckBox;
    SavePictureDialog1: TSavePictureDialog;
    procedure btnPreviewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnsaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainFrm: TMainFrm;

implementation

{$R *.dfm}

/// 半角转全角的函数
function ToSDB(AInput: Widestring): WideString;
var
  I: Integer;
  nChar: Cardinal;
begin
  Result := AInput;
  for I := 1 to Length(AInput) do
  begin
    nChar := Cardinal(WideChar(AInput[I]));
    if nChar = 32 then
    begin
      Result[I] := WideChar(12288);
      Continue;
    end;
    if (nChar < 127) then
      Result[I] := WideChar(nChar + 65248)
  end;
end;


/// 全角转半角的函数
function ToDBC(const AInput: Widestring): Widestring;
var
  I: Integer;
  nChar: Cardinal;
begin
  Result := AInput;
  for I := 1 to Length(AInput) do
  begin
    nChar := Cardinal(WideChar(AInput[I]));
    if nChar = 12288 then
    begin
      Result[I] := WideChar(32);
      Continue;
    end;
    if (nChar > 65280) and (nChar < 65375) then
      Result[I] := WideChar(nChar - 65248)
  end;
end;

function WindowSnap(WndHandle: HWND; Destbmp: TBitmap): Boolean;
var
  r: TRect;
  user32DLLHandle: THandle;
  PrintWindowAPI: function(sourceHandle: HWND; destinationHandle: HDC; nFlags:
    UINT): BOOL; stdcall;
begin
  Result := False;
  user32DLLHandle := GetModuleHandle(user32);
  if user32DLLHandle <> 0 then
  begin
    @PrintWindowAPI := GetProcAddress(user32DLLHandle, 'PrintWindow');
    if @PrintWindowAPI <> nil then
    begin
      GetWindowRect(WndHandle, r);
      Destbmp.Width := r.Right - r.Left;
      Destbmp.Height := r.Bottom - r.Top;
      Destbmp.Canvas.Lock;
      try
        Result := PrintWindowAPI(WndHandle, Destbmp.Canvas.Handle, 0);
      finally
        Destbmp.Canvas.Unlock;
      end;
    end;
  end;
end;

procedure TMainFrm.btnPreviewClick(Sender: TObject);
var
  i, j, fs: Integer;
  vstr: string;
  edt: TcxTextEdit;
  pnl: TPanel;
begin
  for i := 0 to pnlMain.ControlCount - 1 do
  begin
    pnlMain.Controls[i].Free;
  end;
  vstr := Trim(edtMain.Text);
  fs := 100;
  with lblpreview.Style.Font do
  begin
    Size := fs;
    Name := cbbfont.FontName;
  end;

  pnl := TPanel.Create(Self);
  pnl.Color := clWhite;
  pnl.BorderStyle := bsNone;
  pnl.BevelOuter := bvNone;
  pnl.Parent := pnlMain;
  pnl.Height := lblpreview.Height;
  pnl.Width := 0;
  //pnl.Width := lblpreview.Width * 4;
  pnl.Top := 0;

  vstr := Trim(edtMain.Text);
  for j := Length(vstr) downto 1 do
  begin
    with lblpreview.Style.Font do
    begin
      Size := fs;
      Name := cbbfont.Name;
    end;
    pnl.Width := pnl.Width + lblpreview.Width + cxSpinEdit1.Value;
    edt := TcxTextEdit.Create(pnl);
    edt.Style.BorderStyle := ebsNone;
    with edt.Style.Font do
    begin
      Name := cbbfont.FontName;
      Charset := GB2312_CHARSET;
      Size := fs;
      if chkbold.Checked then
        Style := Style + [fsbold];
      if chkstatic.Checked then
        Style := Style + [fsItalic];
      if chkul.Checked then
        Style := Style + [fsUnderline];
      if chkso.Checked then
        Style := Style + [fsStrikeOut];
    end;
    edt.Parent := pnl;
    case cxRadioGroup1.EditValue of
      1:
        edt.Properties.Alignment.Vert := taTopJustify;
      2:
        edt.Properties.Alignment.Vert := taVCenter;
      3:
        edt.Properties.Alignment.Vert := taBottomJustify;
    end;
    case cxRadioGroup2.EditValue of
      1:
        edt.Properties.Alignment.Horz := taLeftJustify;
      2:
        edt.Properties.Alignment.Horz := taCenter;
      3:
        edt.Properties.Alignment.Horz := taRightJustify;
    end;

    edt.Align := alLeft;
    edt.Anchors := [akTop, akRight, akBottom];
    with lblpreview.Style.Font do
    begin
      Size := fs;
      Name := cbbfont.Name;
    end;
    //edt.Height := pnl.Height;
    edt.Width := lblpreview.Width + cxSpinEdit1.Value;
    edt.Text := vstr[j];

    Dec(fs, 10);
  end;

  pnlMain.Height := pnl.Height;
  pnlMain.Width := pnl.Width;
  pnlMain.Left := (pnlsave.Width - pnlMain.Width) div 2;
  pnlMain.top := (pnlsave.Height - pnlMain.Height) div 2;
end;

procedure TMainFrm.btnsaveClick(Sender: TObject);
var
  bmp: TBitmap;
begin
  bmp := TBitmap.Create;
  WindowSnap(pnlMain.Handle, bmp);
  if SavePictureDialog1.Execute then
    bmp.SaveToFile(SavePictureDialog1.FileName);
end;

procedure TMainFrm.FormShow(Sender: TObject);
begin
  cbbfont.ItemIndex := cbbfont.Properties.Items.Count - 1;
end;

end.

