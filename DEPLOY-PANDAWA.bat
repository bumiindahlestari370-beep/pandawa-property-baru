@echo off
chcp 65001 >nul
setlocal
cd /d "%~dp0"
echo ==============================================
echo   PEMBARUAN GOOGLE CONSOLE - PANDAWA PROPERTY
echo ==============================================
echo.
echo Memeriksa file website...
if not exist "%~dp0wrangler.jsonc" (
  echo ERROR: wrangler.jsonc tidak ditemukan. Jalankan BAT dari folder hasil ekstrak ZIP.
  pause
  exit /b 1
)
if not exist "%~dp0public\index.html" (
  echo ERROR: public\index.html tidak ditemukan.
  pause
  exit /b 1
)
if not exist "%~dp0public\sitemap.xml" (
  echo ERROR: public\sitemap.xml tidak ditemukan.
  pause
  exit /b 1
)
echo File utama, sitemap, dan robots.txt ditemukan.
echo.
echo Mengirim pembaruan ke Worker pandawa-property-baru...
echo Jika browser terbuka, masuk ke akun Cloudflare PANDAWA.
echo.
call npx wrangler@latest deploy --config "%~dp0wrangler.jsonc"
if errorlevel 1 (
  echo.
  echo DEPLOY BELUM BERHASIL. File lama dan website online tidak dihapus.
) else (
  echo.
  echo DEPLOY BERHASIL. Periksa URL website PANDAWA.
  echo Sitemap: https://pandawa-property-baru.bumiindahlestari370.workers.dev/sitemap.xml
)
echo.
pause
