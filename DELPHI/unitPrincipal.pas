unit unitPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Objects;

type
  TForm1 = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    Label1: TLabel;
    RoundRect1: TRoundRect;
    RoundRect2: TRoundRect;
    Label2: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    procedure RoundRect1Click(Sender: TObject);
    procedure RoundRect2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses unitCadastro, unitLogin;

procedure TForm1.RoundRect1Click(Sender: TObject);
begin
form1.Visible:= false;
form2.showmodal;
form1.Visible:= true;
end;

procedure TForm1.RoundRect2Click(Sender: TObject);
begin
form1.Visible:= false;
form3.showmodal;
form1.Visible:= true;
end;

end.
