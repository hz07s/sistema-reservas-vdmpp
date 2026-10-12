@echo off
rem Ejecuta cada caso en una sesion aparte del interprete, porque el
rem Toolbox solo imprime el texto del primer error de ejecucion de la sesion.
setlocal
set TB=C:\Program Files\The VDM++ Toolbox v9.0.10
set SRC=modelo\Cliente.vdmpp modelo\Funcion.vdmpp modelo\SistemaReservas.vdmpp pruebas\PruebasReserva.vdmpp "%TB%\stdlib\io.vpp" "%TB%\stdlib\VDMUtil.vpp"
set SC=%TEMP%\caso_vdm.txt
for %%C in (CP1_ReservaYCompra CP2_CompraSinReserva CP3_DobleReserva CP4_ExcesoAforo CP5_CancelarYReasignar CP6_CompraDeOtroCliente) do (
  echo.
  echo ===== %%C =====
  echo set dtc> "%SC%"
  echo set inv>> "%SC%"
  echo set pre>> "%SC%"
  echo set post>> "%SC%"
  echo init>> "%SC%"
  echo create t := new PruebasReserva^(^)>> "%SC%"
  echo print t.%%C^(^)>> "%SC%"
  "%TB%\bin\vppde.exe" -o "%SC%" -q %SRC% | findstr /V /C:"Parsing " /C:"Initializing " /C:"set " /C:"init" /C:"create t" /C:"print t." /C:"VDM Toolbox is currently" /C:"for Architecture-Oriented" /C:"dtc set" /C:"inv set" /C:"pre set" /C:"post set" /C:"done"
)
