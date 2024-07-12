unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, Grids, DBGrids, frxClass, frxDBSet;

type
  TForm1 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    edt3: TEdit;
    edt4: TEdit;
    lbl5: TLabel;
    edt5: TEdit;
    lbl6: TLabel;
    cbb1: TComboBox;
    lbl7: TLabel;
    lbl8: TLabel;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    Label1: TLabel;
    dbgrd1: TDBGrid;
    edt6: TEdit;
    btn6: TButton;
    frxrprt1: TfrxReport;
    frxdbdtst1: TfrxDBDataset;
    procedure FormShow(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure edt6Change(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a : string;

implementation
uses Unit2;
{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
begin
btn1.Enabled:=False;
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
btn1.Enabled:=True;

end;

procedure TForm1.edt6Change(Sender: TObject);
begin
with DataModule2.Zkustomer do
begin
  SQL.clear;
  SQL.Add('select * from kustomer where name like'+QuotedStr('%'+edt6.Text+'%'));
  ExecSQL;
  Open;
end;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
DataModule2.Zkustomer.SQL.Clear;
DataModule2.Zkustomer.SQL.Add('insert into kustomer values (null,"'+edt1.Text+'","'+edt2.Text+'","'+edt3.Text+'","'+edt4.Text+'","'+edt5.Text+'","'+cbb1.Text+'")');
DataModule2.Zkustomer.ExecSQL;

DataModule2.Zkustomer.SQL.Clear;
DataModule2.Zkustomer.SQL.Add('select * from kustomer');
DataModule2.Zkustomer.Open;
ShowMessage('Data Berhasil Disimpan');
btn1.Enabled:=False;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
with DataModule2.Zkustomer do
begin
  SQL.clear;
  SQL.Add('delete from kustomer where id="'+a+'"');
  ExecSQL;

  SQL.clear;
  SQL.Add('select * from kustomer');
  Open;
  edt1.Text := '';
  edt2.Text := '';
  edt3.Text := '';
  edt4.Text := '';
  edt5.Text := '';
  cbb1.Text := 'Pilih--';

end;
ShowMessage('Data Berhasil DiDelete!');
end;

procedure TForm1.dbgrd1CellClick(Column: TColumn);
begin
begin
edt1.Text:= DataModule2.Zkustomer.Fields[1].AsString;
edt2.Text:= DataModule2.Zkustomer.Fields[2].AsString;
edt3.Text:= DataModule2.Zkustomer.Fields[3].AsString;
edt4.Text:= DataModule2.Zkustomer.Fields[4].AsString;
edt5.Text:= DataModule2.Zkustomer.Fields[5].AsString;
cbb1.Text:= DataModule2.Zkustomer.Fields[6].AsString;
a:= DataModule2.Zkustomer.Fields[0].AsString;
begin
  if cbb1.Text = 'YES' then
    lbl8.Caption := '10%'
  else
    lbl8.Caption := '5%';
end;
end;
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
with DataModule2.Zkustomer do
begin
SQL.Clear;
SQL.Add('update kustomer set nik ="'+edt1.Text+'",name ="'+edt2.Text+'",telp ="'+edt3.Text+'" ,email ="'+edt4.Text+'" ,alamat ="'+edt5.Text+'" ,member ="'+cbb1.Text+'"  where id="'+a+'"');
ExecSQL ;

SQL.Clear;
SQL.Add('Select * from kustomer');
Open;
end;
ShowMessage('Data Berhasil Diupdate');
  edt1.Text := '';
  edt2.Text := '';
  edt3.Text := '';
  edt4.Text := '';
  edt5.Text := '';
  cbb1.Text := 'Pilih--';
  btn1.Enabled:=False;
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
  edt1.Text := '';
  edt2.Text := '';
  edt3.Text := '';
  edt4.Text := '';
  edt5.Text := '';
  cbb1.Text := 'Pilih--';
  btn1.Enabled:=False;
end;

procedure TForm1.btn6Click(Sender: TObject);
begin
frxrprt1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\report_member.fr3');
frxrprt1.ShowReport();
end;

end.
