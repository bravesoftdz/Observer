unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Unit3, Vcl.StdCtrls, Unit4;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    Subject: TSubject;
    SubjectObserver1, SubjectObserver2: TSubjectObserver;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Subject.Change;
  Form4.Edit1.Text:=inttostr(SubjectObserver1.OnChange);
  Form4.Label1.Caption:= inttostr(SubjectObserver2.OnChange);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Subject := TSubject.Create;
  SubjectObserver1 := TSubjectObserver.Create;//(nil);
  SubjectObserver2 := TSubjectObserver.Create;//(nil);
  Subject.RegisterObserver(SubjectObserver1);
  Subject.RegisterObserver(SubjectObserver2);

end;

end.
