program MSUOnTLE;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1}

  ,sgp_init in 'sgp/sgp_init.pas'
  ,sgp_time in 'sgp/sgp_time.pas'
  ,sgp_math in 'sgp/sgp_math.pas'
  ,sgp_conv in 'sgp/sgp_conv.pas'
  ,sgp_intf in 'sgp/sgp_intf.pas'
  ,sgp_obs in 'sgp/sgp_obs.pas'
  ,SGP_In in 'sgp/SGP_In.pas'
  ,SGP_Out in 'sgp/SGP_Out.pas'
  ,sgp4sdp4 in 'sgp/sgp4sdp4.pas'
  ,solar in 'sgp/solar.pas'
  ,support in 'sgp/support.pas'
  ,minmax in 'sgp/minmax.pas'
  ,extMath in 'extMath.pas'
  ,myConst in 'sgp/myConst.pas'

  ,pngimage in 'PNGImage/pngimage.pas'
  ,zlibpas in 'PNGImage/zlibpas.pas'
  ,pnglang in 'PNGImage/pnglang.pas'
  ;

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
