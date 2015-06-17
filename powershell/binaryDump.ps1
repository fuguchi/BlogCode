#ファイルパスをフルパスで入力↓↓
$FilePath="F:\00_一時フォルダ\hoge.txt"


Write-Output "--------------------------------------------------------"
Write-Output "         00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F"


$Output = New-Object System.String("")

$count = 16   #横ループ
$line = 0     #行数

Foreach($item in Get-Content -Path $FilePath -Encoding byte)
{
  #改行
  if($count % 16 -eq 0){
    Write-Output $Output
    $Output = $line.ToString("X").PadLeft(8, '0')
    $Output += $line.ToString(" ")
    $line = $line + 1
    $count = 16
  }
  #データ出力
  $Output += $item.ToString("X").PadLeft(2, '0')
  $Output += " "
  $count = $count - 1
}

if($count -ne 16){
  $line = $line + 1
  Write-Output $Output
}


