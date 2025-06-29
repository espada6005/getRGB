Add-Type -AssemblyName System.Drawing

# 画像ファイルのパスを指定
$imagePath = "C:\Users\yua48\Desktop\image\image2.png"

# 出力先のテキストファイル（存在すれば上書き）
$outputPath = "C:\Users\yua48\Desktop\rgb_output2.txt"

# Bitmapとして画像を読み込み
$bitmap = [System.Drawing.Bitmap]::FromFile($imagePath)

# 幅と高さを取得
$width = $bitmap.Width
$height = $bitmap.Height

# 出力用のStringBuilderを用意（メモリ効率のため）
$output = New-Object System.Text.StringBuilder

for ($y = 0; $y -lt $height; $y++) {
    for ($x = 0; $x -lt $width; $x++) {
        $pixel = $bitmap.GetPixel($x, $y)
        [void]$output.AppendLine("($x, $y): R=$($pixel.R), G=$($pixel.G), B=$($pixel.B)")
    }
}

# 結果をファイルに保存
[System.IO.File]::WriteAllText($outputPath, $output.ToString())