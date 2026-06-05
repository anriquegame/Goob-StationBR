@echo off
echo [1/4] Executando RUN_THIS.py...
python RUN_THIS.py
if %errorlevel% neq 0 ( echo ERRO no RUN_THIS.py & pause & exit /b 1 )

echo [2/4] Buildando Content.Goobstation.Server...
dotnet build -c Release Content.Goobstation.Server --no-incremental
if %errorlevel% neq 0 ( echo ERRO no build do Server & pause & exit /b 1 )

echo [3/4] Buildando Content.Goobstation.Client...
dotnet build -c Release Content.Goobstation.Client --no-incremental
if %errorlevel% neq 0 ( echo ERRO no build do Client & pause & exit /b 1 )

echo [4/4] Iniciando servidor...
dotnet run -c Release --project Content.Goobstation.Server
pause