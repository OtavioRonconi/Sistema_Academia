unit unitLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Objects, FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation, FMX.Layouts,
  FMX.ComboEdit, FMX.EditBox, FMX.ComboTrackBar, FMX.ListBox,RegularExpressions,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FMX.DialogService;

type
  TForm3 = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    Label1: TLabel;
    edtUsuario: TEdit;
    Label18: TLabel;
    edtSenha: TEdit;
    Button1: TButton;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    TabItem5: TTabItem;
    Layout3: TLayout;
    Layout1: TLayout;
    Label2: TLabel;
    Layout2: TLayout;
    Layout4: TLayout;
    RoundRect1: TRoundRect;
    Label3: TLabel;
    Layout5: TLayout;
    RoundRect2: TRoundRect;
    Label4: TLabel;
    Layout6: TLayout;
    RoundRect3: TRoundRect;
    Label5: TLabel;
    edtTreino1: TEdit;
    edtSeries1: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edtTreino2: TEdit;
    Label8: TLabel;
    edtSeries2: TEdit;
    Label9: TLabel;
    edtTreino3: TEdit;
    Label10: TLabel;
    edtSeries3: TEdit;
    Label11: TLabel;
    edtTreino4: TEdit;
    Label12: TLabel;
    edtSeries4: TEdit;
    Label13: TLabel;
    edtTreino5: TEdit;
    Label14: TLabel;
    edtSeries5: TEdit;
    Label15: TLabel;
    Button2: TButton;
    Label16: TLabel;
    edtTM1: TEdit;
    Label17: TLabel;
    edtSM1: TEdit;
    Label19: TLabel;
    edtTM2: TEdit;
    Label20: TLabel;
    edtSM2: TEdit;
    Label21: TLabel;
    edtTM3: TEdit;
    Label22: TLabel;
    edtSM3: TEdit;
    Label23: TLabel;
    edtTM4: TEdit;
    Label24: TLabel;
    edtSM4: TEdit;
    Label25: TLabel;
    edtTM5: TEdit;
    Label26: TLabel;
    edtSM5: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label27: TLabel;
    ComboBox1: TComboBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    ListBoxItem7: TListBoxItem;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    ComboBox2: TComboBox;
    SpeedButton2: TSpeedButton;
    ListBoxItem8: TListBoxItem;
    ListBoxItem9: TListBoxItem;
    ListBoxItem10: TListBoxItem;
    procedure RoundRect1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RoundRect2Click(Sender: TObject);
    procedure RoundRect3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure edtSeries1ChangeTracking(Sender: TObject);
    procedure edtTreino1ChangeTracking(Sender: TObject);
    procedure edtSeries2ChangeTracking(Sender: TObject);
    procedure edtSeries3ChangeTracking(Sender: TObject);
    procedure edtSeries4ChangeTracking(Sender: TObject);
    procedure edtSeries5ChangeTracking(Sender: TObject);
    procedure edtTreino2ChangeTracking(Sender: TObject);
    procedure edtTreino3ChangeTracking(Sender: TObject);
    procedure edtTreino4ChangeTracking(Sender: TObject);
    procedure edtTreino5ChangeTracking(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}

uses unitDM1;

procedure TForm3.Button1Click(Sender: TObject);
begin
if (edtUsuario.Text = '') then
  begin
    TDialogService.ShowMessage('O campo "Usu�rio" deve ser preenchido!');
    if edtUsuario.CanFocus then edtUsuario.SetFocus;
    Exit;
  end;

  if (edtSenha.Text = '') then
  begin
    TDialogService.ShowMessage('O campo "Senha" deve ser preenchido!');
    if edtSenha.CanFocus then edtSenha.SetFocus;
    Exit;
  end;

  // Consultar o banco de dados para validar o login
  FDQuery1.SQL.Text :=
    'SELECT COUNT(*) FROM InformacoesPessoais ' +
    'WHERE Usuario = :usuario AND Senha = :senha';
  FDQuery1.ParamByName('usuario').AsString := edtUsuario.Text;
  FDQuery1.ParamByName('senha').AsString := edtSenha.Text;
  FDQuery1.Open;

  if FDQuery1.Fields[0].AsInteger > 0 then
  begin
    // Usu�rio autenticado com sucesso
    TDialogService.ShowMessage('Login bem-sucedido!'); // Exemplo: exiba uma mensagem ou abra o formul�rio principal
  end
  else
  begin
    TDialogService.ShowMessage('Usu�rio ou senha inv�lidos.');
    // Voc� pode adicionar uma l�gica para bloquear o acesso ap�s v�rias tentativas falhas.
  end;
TabControl1.ActiveTab:= TabItem2;
TabItem1.Visible:= false;
TabItem2.Visible:= true;
TabItem3.Visible:= false;
TabItem4.Visible:= false;
TabItem5.Visible:= false;
end;

procedure TForm3.Button2Click(Sender: TObject);
var
  Treino1, Treino2, Treino3, Treino4, Treino5: string;
  Series1, Series2, Series3, Series4, Series5: Integer;
  Usuario, Exercicio1: string;
begin
  Usuario := edtUsuario.Text;
  Exercicio1:= edtTreino1.Text;
  //PEITO//
  if ComboBox1.ItemIndex = 1 then
  begin
    Treino1 := edtTreino1.Text;
    Series1 := StrToInt(edtSeries1.Text);
    FDQuery1.SQL.Text := 'INSERT INTO Peito (Usuario, Exercicio1, Series1) VALUES (:Usuario, :TextoTreino1, :TextoSeries1)';
    FDQuery1.ParamByName('Usuario').AsString := Usuario;
    FDQuery1.ParamByName('TextoTreino1').AsString := Treino1;
    FDQuery1.ParamByName('TextoSeries1').AsInteger := Series1;
    FDQuery1.ExecSQL;
  end;

  //TREINO2//
  if ComboBox1.ItemIndex = 1 then
begin
  Treino2 := edtTreino2.Text;
  Series2 := StrToInt(edtSeries2.Text);
  FDQuery1.SQL.Text := 'UPDATE Peito SET Exercicio2 = :TextoTreino2, Series2 = :TextoSeries2 WHERE Usuario = :Usuario AND Exercicio1 = :Exercicio1';
  FDQuery1.ParamByName('TextoTreino2').AsString := Treino2;
  FDQuery1.ParamByName('TextoSeries2').AsInteger := Series2;
  FDQuery1.ParamByName('Usuario').AsString := Usuario;
  FDQuery1.ParamByName('Exercicio1').AsString := Exercicio1;
  FDQuery1.ExecSQL;
  end;

  //TREINO3//
  if ComboBox1.ItemIndex = 1 then
  begin
    Treino3 := edtTreino3.Text;
    Series3 := StrToInt(edtSeries3.Text);
    FDQuery1.SQL.Text := 'UPDATE Peito SET Exercicio3 = :TextoTreino3, Series3 = :TextoSeries3 WHERE Usuario = :Usuario AND Exercicio1 = :Exercicio1';
    FDQuery1.ParamByName('TextoTreino3').AsString := Treino3;
    FDQuery1.ParamByName('TextoSeries3').AsInteger := Series3;
    FDQuery1.ParamByName('Usuario').AsString := Usuario;
    FDQuery1.ParamByName('Exercicio1').AsString := Exercicio1;
    FDQuery1.ExecSQL;
  end;

  //TREINO4//
  if ComboBox1.ItemIndex = 1 then
  begin
    Treino4 := edtTreino4.Text;
    Series4 := StrToInt(edtSeries4.Text);
    FDQuery1.SQL.Text := 'UPDATE Peito SET Exercicio4 = :TextoTreino4, Series4 = :TextoSeries4 WHERE Usuario = :Usuario AND Exercicio1 = :Exercicio1';
    FDQuery1.ParamByName('TextoTreino4').AsString := Treino4;
    FDQuery1.ParamByName('TextoSeries4').AsInteger := Series4;
    FDQuery1.ParamByName('Usuario').AsString := Usuario;
    FDQuery1.ParamByName('Exercicio1').AsString := Exercicio1;
    FDQuery1.ExecSQL;
  end;

  //TREINO5//
  if ComboBox1.ItemIndex = 1 then
  begin
    Treino5 := edtTreino5.Text;
    Series5 := StrToInt(edtSeries5.Text);
    FDQuery1.SQL.Text := 'UPDATE Peito SET Exercicio5 = :TextoTreino5, Series5 = :TextoSeries5 WHERE Usuario = :Usuario AND Exercicio1 = :Exercicio1';
    FDQuery1.ParamByName('TextoTreino5').AsString := Treino5;
    FDQuery1.ParamByName('TextoSeries5').AsInteger := Series5;
    FDQuery1.ParamByName('Usuario').AsString := Usuario;
    FDQuery1.ParamByName('Exercicio1').AsString := Exercicio1;
    FDQuery1.ExecSQL;
  end;
  //COSTAS//
  if ComboBox1.ItemIndex = 2 then
  begin
    Treino1 := edtTreino1.Text;
    Series1 := StrToInt(edtSeries1.Text);
    FDQuery1.SQL.Text := 'INSERT INTO Costa (Usuario, Exercicio1, Series1) VALUES (:Usuario, :TextoTreino, :TextoSeries)';
    FDQuery1.ParamByName('Usuario').AsString := Usuario;
    FDQuery1.ParamByName('TextoTreino').AsString := Treino1;
    FDQuery1.ParamByName('TextoSeries').AsInteger := Series1;
    FDQuery1.ExecSQL;
  end;
  //TREINO2//
  if ComboBox1.ItemIndex = 2 then
  begin
    Treino2 := edtTreino2.Text;
    Series2 := StrToInt(edtSeries2.Text);
    FDQuery1.SQL.Text := 'UPDATE Costa SET Exercicio2 = :TextoTreino, Series2 = :TextoSeries WHERE Usuario = :Usuario AND Exercicio1 = :Exercicio1';
    FDQuery1.ParamByName('TextoTreino').AsString := Treino2;
    FDQuery1.ParamByName('TextoSeries').AsInteger := Series2;
    FDQuery1.ParamByName('Usuario').AsString := Usuario;
    FDQuery1.ParamByName('Exercicio1').AsString := Exercicio1;
    FDQuery1.ExecSQL;
  end;
  //TREINO3//
  if ComboBox1.ItemIndex = 2 then
  begin
    Treino3 := edtTreino3.Text;
    Series3 := StrToInt(edtSeries3.Text);
    FDQuery1.SQL.Text := 'UPDATE Costa SET Exercicio3 = :TextoTreino, Series3 = :TextoSeries WHERE Usuario = :Usuario AND Exercicio1 = :Exercicio1';
    FDQuery1.ParamByName('TextoTreino').AsString := Treino3;
    FDQuery1.ParamByName('TextoSeries').AsInteger := Series3;
    FDQuery1.ParamByName('Usuario').AsString := Usuario;
    FDQuery1.ParamByName('Exercicio1').AsString := Exercicio1;
    FDQuery1.ExecSQL;
  end;
  //TREINO4//
  if ComboBox1.ItemIndex = 2 then
  begin
    Treino4 := edtTreino5.Text;
    Series4 := StrToInt(edtSeries5.Text);
    FDQuery1.SQL.Text := 'UPDATE Costa SET Exercicio4 = :TextoTreino, Series4 = :TextoSeries WHERE Usuario = :Usuario AND Exercicio1 = :Exercicio1';
    FDQuery1.ParamByName('TextoTreino').AsString := Treino4;
    FDQuery1.ParamByName('TextoSeries').AsInteger := Series4;
    FDQuery1.ParamByName('Usuario').AsString := Usuario;
    FDQuery1.ParamByName('Exercicio1').AsString := Exercicio1;
    FDQuery1.ExecSQL;
  end;
  //TREINO5//
  if ComboBox1.ItemIndex = 2 then
  begin
    Treino5 := edtTreino5.Text;
    Series5 := StrToInt(edtSeries5.Text);
    FDQuery1.SQL.Text := 'UPDATE Costa SET Exercicio5 = :TextoTreino, Series5 = :TextoSeries WHERE Usuario = :Usuario AND Exercicio1 = :Exercicio1';
    FDQuery1.ParamByName('TextoTreino').AsString := Treino5;
    FDQuery1.ParamByName('TextoSeries').AsInteger := Series5;
    FDQuery1.ParamByName('Usuario').AsString := Usuario;
    FDQuery1.ParamByName('Exercicio1').AsString := Exercicio1;
    FDQuery1.ExecSQL;
  end;
  //PERNA//
  if ComboBox1.ItemIndex = 3 then
  begin
    Treino1 := edtTreino1.Text;
    Series1 := StrToInt(edtSeries1.Text);
    FDQuery1.SQL.Text := 'INSERT INTO Perna (Usuario, Exercicio1, Series1) VALUES (:Usuario, :TextoTreino, :TextoSeries)';
    FDQuery1.ParamByName('Usuario').AsString := Usuario;
    FDQuery1.ParamByName('TextoTreino').AsString := Treino1;
    FDQuery1.ParamByName('TextoSeries').AsInteger := Series1;
    FDQuery1.ExecSQL;
  end;
  //TREINO2//
  if ComboBox1.ItemIndex = 3 then
  begin
    Treino2 := edtTreino2.Text;
    Series2 := StrToInt(edtSeries2.Text);
    FDQuery1.SQL.Text := 'UPDATE Perna SET Exercicio2 = :TextoTreino, Series2 = :TextoSeries WHERE Usuario = :Usuario AND Exercicio1 = :Exercicio1';
    FDQuery1.ParamByName('TextoTreino').AsString := Treino2;
    FDQuery1.ParamByName('TextoSeries').AsInteger := Series2;
    FDQuery1.ParamByName('Usuario').AsString := Usuario;
    FDQuery1.ParamByName('Exercicio1').AsString := Exercicio1;
    FDQuery1.ExecSQL;
  end;
  //TREINO3//
  if ComboBox1.ItemIndex = 3 then
  begin
    Treino3 := edtTreino3.Text;
    Series3 := StrToInt(edtSeries3.Text);
    FDQuery1.SQL.Text := 'UPDATE Perna SET Exercicio3 = :TextoTreino, Series3 = :TextoSeries WHERE Usuario = :Usuario AND Exercicio1 = :Exercicio1';
    FDQuery1.ParamByName('TextoTreino').AsString := Treino3;
    FDQuery1.ParamByName('TextoSeries').AsInteger := Series3;
    FDQuery1.ParamByName('Usuario').AsString := Usuario;
    FDQuery1.ParamByName('Exercicio1').AsString := Exercicio1;
    FDQuery1.ExecSQL;
  end;
  //TREINO4//
  if ComboBox1.ItemIndex = 3 then
  begin
    Treino4 := edtTreino5.Text;
    Series4 := StrToInt(edtSeries5.Text);
    FDQuery1.SQL.Text := 'UPDATE Perna SET Exercicio4 = :TextoTreino, Series4 = :TextoSeries WHERE Usuario = :Usuario AND Exercicio1 = :Exercicio1';
    FDQuery1.ParamByName('TextoTreino').AsString := Treino4;
    FDQuery1.ParamByName('TextoSeries').AsInteger := Series4;
    FDQuery1.ParamByName('Usuario').AsString := Usuario;
    FDQuery1.ParamByName('Exercicio1').AsString := Exercicio1;
    FDQuery1.ExecSQL;
  end;
  //TREINO5//
  if ComboBox1.ItemIndex = 3 then
  begin
    Treino5 := edtTreino5.Text;
    Series5 := StrToInt(edtSeries5.Text);
    FDQuery1.SQL.Text := 'UPDATE Perna SET Exercicio5 = :TextoTreino, Series5 = :TextoSeries WHERE Usuario = :Usuario AND Exercicio1 = :Exercicio1';
    FDQuery1.ParamByName('TextoTreino').AsString := Treino5;
    FDQuery1.ParamByName('TextoSeries').AsInteger := Series5;
    FDQuery1.ParamByName('Usuario').AsString := Usuario;
    FDQuery1.ParamByName('Exercicio1').AsString := Exercicio1;
    FDQuery1.ExecSQL;
  end;
TabControl1.ActiveTab:= TabItem2;
TabItem1.Visible:= false;
TabItem2.Visible:= true;
TabItem3.Visible:= false;
TabItem4.Visible:= false;
TabItem5.Visible:= false;
ComboBox1.ItemIndex:= 0;
edtTreino1.Text:= '';
edtTreino2.Text:= '';
edtTreino3.Text:= '';
edtTreino4.Text:= '';
edtTreino5.Text:= '';
edtSeries1.Text:= '';
edtSeries2.Text:= '';
edtSeries3.Text:= '';
edtSeries4.Text:= '';
edtSeries5.Text:= '';
end;

procedure TForm3.Button4Click(Sender: TObject);
begin

edtTreino1.Text:= '';
edtTreino2.Text:= '';
edtTreino3.Text:= '';
edtTreino4.Text:= '';
edtTreino5.Text:= '';
edtSeries1.Text:= '';
edtSeries2.Text:= '';
edtSeries3.Text:= '';
edtSeries4.Text:= '';
edtSeries5.Text:= '';
end;

procedure TForm3.Button5Click(Sender: TObject);
begin
edtTreino1.Text:= '';
edtTreino2.Text:= '';
edtTreino3.Text:= '';
edtTreino4.Text:= '';
edtTreino5.Text:= '';
end;

procedure TForm3.Button6Click(Sender: TObject);
begin
edtSeries1.Text:= '';
edtSeries2.Text:= '';
edtSeries3.Text:= '';
edtSeries4.Text:= '';
edtSeries5.Text:= '';
end;

procedure TForm3.edtSeries1ChangeTracking(Sender: TObject);
var
  Texto: string;
  Numero: Double;
begin
  Texto := edtSeries1.Text;
  if not TryStrToFloat(Texto, Numero) then
    edtSeries1.Text := '';
end;

procedure TForm3.edtSeries2ChangeTracking(Sender: TObject);
var
  Texto: string;
  Numero: Double;
begin
  Texto := edtSeries2.Text;
  if not TryStrToFloat(Texto, Numero) then
    edtSeries2.Text := '';
end;

procedure TForm3.edtSeries3ChangeTracking(Sender: TObject);
var
  Texto: string;
  Numero: Double;
begin
  Texto := edtSeries3.Text;
  if not TryStrToFloat(Texto, Numero) then
    edtSeries3.Text := '';
end;

procedure TForm3.edtSeries4ChangeTracking(Sender: TObject);
var
  Texto: string;
  Numero: Double;
begin
  Texto := edtSeries4.Text;
  if not TryStrToFloat(Texto, Numero) then
    edtSeries4.Text := '';
end;

procedure TForm3.edtSeries5ChangeTracking(Sender: TObject);
var
  Texto: string;
  Numero: Double;
begin
  Texto := edtSeries5.Text;
  if not TryStrToFloat(Texto, Numero) then
    edtSeries5.Text := '';
end;

procedure TForm3.edtTreino1ChangeTracking(Sender: TObject);
var
  Texto: string;
begin
  Texto := edtTreino1.Text;
  if not Texto.IsEmpty then
  begin
    // Verifica se o texto cont�m apenas letras
    if not TRegEx.IsMatch(Texto, '^[A-Za-z]*$') then
      edtTreino1.Text := '';
  end;
end;

procedure TForm3.edtTreino2ChangeTracking(Sender: TObject);
var
  Texto: string;
begin
  Texto := edtTreino2.Text;
  if not Texto.IsEmpty then
  begin
    // Verifica se o texto cont�m apenas letras
    if not TRegEx.IsMatch(Texto, '^[A-Za-z]*$') then
      edtTreino2.Text := '';
  end;
end;

procedure TForm3.edtTreino3ChangeTracking(Sender: TObject);
var
  Texto: string;
begin
  Texto := edtTreino3.Text;
  if not Texto.IsEmpty then
  begin
    // Verifica se o texto cont�m apenas letras
    if not TRegEx.IsMatch(Texto, '^[A-Za-z]*$') then
      edtTreino3.Text := '';
  end;
end;

procedure TForm3.edtTreino4ChangeTracking(Sender: TObject);
var
  Texto: string;
begin
  Texto := edtTreino4.Text;
  if not Texto.IsEmpty then
  begin
    // Verifica se o texto cont�m apenas letras
    if not TRegEx.IsMatch(Texto, '^[A-Za-z]*$') then
      edtTreino4.Text := '';
  end;
end;

procedure TForm3.edtTreino5ChangeTracking(Sender: TObject);
var
  Texto: string;
begin
  Texto := edtTreino5.Text;
  if not Texto.IsEmpty then
  begin
    // Verifica se o texto cont�m apenas letras
    if not TRegEx.IsMatch(Texto, '^[A-Za-z]*$') then
      edtTreino5.Text := '';
  end;
end;

procedure TForm3.RoundRect1Click(Sender: TObject);
begin
TabControl1.ActiveTab:= TabItem3;
TabItem1.Visible:= false;
TabItem2.Visible:= false;
TabItem3.Visible:= true;
TabItem4.Visible:= false;
TabItem5.Visible:= false;
end;

procedure TForm3.RoundRect2Click(Sender: TObject);
begin
TabControl1.ActiveTab:= TabItem4;
TabItem1.Visible:= false;
TabItem2.Visible:= false;
TabItem3.Visible:= false;
TabItem4.Visible:= true;
TabItem5.Visible:= false;
end;

procedure TForm3.RoundRect3Click(Sender: TObject);
begin
TabControl1.ActiveTab:= TabItem4;
TabItem1.Visible:= false;
TabItem2.Visible:= false;
TabItem3.Visible:= false;
TabItem4.Visible:= false;
TabItem5.Visible:= true;
end;

procedure TForm3.SpeedButton1Click(Sender: TObject);
begin
TabControl1.ActiveTab:= TabItem2;
TabItem1.Visible:= false;
TabItem2.Visible:= true;
TabItem3.Visible:= false;
TabItem4.Visible:= false;
TabItem5.Visible:= false;
end;

procedure TForm3.SpeedButton2Click(Sender: TObject);
var
  UsuarioCadastrado: Boolean;
begin
  FDQuery1.SQL.Text :=
    'SELECT COUNT(*) FROM InformacoesPessoais ' +
    'WHERE Usuario = :usuario AND Senha = :senha';
  FDQuery1.ParamByName('usuario').AsString := edtUsuario.Text;
  FDQuery1.ParamByName('senha').AsString := edtSenha.Text;
  FDQuery1.Open;

  UsuarioCadastrado := FDQuery1.Fields[0].AsInteger > 0;
  FDQuery1.Close;

  if UsuarioCadastrado then
  begin
    if ComboBox2.ItemIndex = 0 then
    begin
      FDQuery1.SQL.Text :=
        'SELECT Exercicio1, Series1, Exercicio2, Series2, ' +
        'Exercicio3, Series3, Exercicio4, Series4, Exercicio5, Series5 ' +
        'FROM Peito WHERE Usuario = :Usuario';
    end
    else if ComboBox2.ItemIndex = 1 then
    begin
      FDQuery1.SQL.Text :=
        'SELECT Exercicio1, Series1, Exercicio2, Series2, ' +
        'Exercicio3, Series3, Exercicio4, Series4, Exercicio5, Series5 ' +
        'FROM Costa WHERE Usuario = :Usuario';
    end
    else if ComboBox2.ItemIndex = 2 then
    begin
      FDQuery1.SQL.Text :=
        'SELECT Exercicio1, Series1, Exercicio2, Series2, ' +
        'Exercicio3, Series3, Exercicio4, Series4, Exercicio5, Series5 ' +
        'FROM Perna WHERE Usuario = :Usuario';
    end
    else
    begin
      ShowMessage('Selecione um grupo muscular v�lido.');
      Exit;
    end;

    FDQuery1.ParamByName('Usuario').AsString := edtUsuario.Text;
    FDQuery1.Open;

    if not FDQuery1.IsEmpty then
    begin
      edtTM1.Text := FDQuery1.FieldByName('Exercicio1').AsString;
      edtSM1.Text := IntToStr(FDQuery1.FieldByName('Series1').AsInteger);
      edtTM2.Text := FDQuery1.FieldByName('Exercicio2').AsString;
      edtSM2.Text := IntToStr(FDQuery1.FieldByName('Series2').AsInteger);
      edtTM3.Text := FDQuery1.FieldByName('Exercicio3').AsString;
      edtSM3.Text := IntToStr(FDQuery1.FieldByName('Series3').AsInteger);
      edtTM4.Text := FDQuery1.FieldByName('Exercicio4').AsString;
      edtSM4.Text := IntToStr(FDQuery1.FieldByName('Series4').AsInteger);
      edtTM5.Text := FDQuery1.FieldByName('Exercicio5').AsString;
      edtSM5.Text := IntToStr(FDQuery1.FieldByName('Series5').AsInteger);
    end
    else
    begin
      ShowMessage('Nenhum treino encontrado para este usu�rio.');
    end;

    FDQuery1.Close;
  end
  else
  begin
    ShowMessage('Acesso negado. Voc� n�o est� cadastrado.');
  end;
end;

procedure TForm3.SpeedButton3Click(Sender: TObject);
begin

edtTreino1.Text:= '';
edtTreino2.Text:= '';
edtTreino3.Text:= '';
edtTreino4.Text:= '';
edtTreino5.Text:= '';
edtSeries1.Text:= '';
edtSeries2.Text:= '';
edtSeries3.Text:= '';
edtSeries4.Text:= '';
edtSeries5.Text:= '';
end;

procedure TForm3.SpeedButton4Click(Sender: TObject);
begin
edtTreino1.Text:= '';
edtTreino2.Text:= '';
edtTreino3.Text:= '';
edtTreino4.Text:= '';
edtTreino5.Text:= '';
end;

procedure TForm3.SpeedButton5Click(Sender: TObject);
begin
edtSeries1.Text:= '';
edtSeries2.Text:= '';
edtSeries3.Text:= '';
edtSeries4.Text:= '';
edtSeries5.Text:= '';
end;

end.
