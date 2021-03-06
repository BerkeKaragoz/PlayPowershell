[xml]$xaml = @" 
    <Window 
xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" 
xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" 
x:Name="Window" 
Title="Blend and PowerShell" 
Width="640" Height="480" AllowsTransparency="False"> 
<Grid x:Name="LayoutRoot"> 
  <Rectangle Margin="22,8,22,0" VerticalAlignment="Top" Height="178" Stroke="#FF000000"> 
   <Rectangle.Fill> 
    <LinearGradientBrush EndPoint="0.5,1" StartPoint="0.5,0"> 
     <GradientStop Color="#FF000000" Offset="0"/> 
     <GradientStop Color="#FF861A1A" Offset="1"/> 
    </LinearGradientBrush> 
   </Rectangle.Fill> 
  </Rectangle> 
  <Button Margin="121,0,129,96" VerticalAlignment="Bottom" Height="100" Content="Button" 
    x:Name="Close"/> 
</Grid> 
</Window> 
"@ 
$reader = New-Object System.Xml.XmlNodeReader $xaml 
$d = [Windows.Markup.XamlReader]::Load($reader) 
$d.FindName("Close").add_click({ 
    $d.Close() 
}) 
$d.ShowDialog() | out-null