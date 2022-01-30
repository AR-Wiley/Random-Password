
function random_password{
    
    [int]$size = Read-Host "How long should do you want the password?"
    [int]$size_validation = 0

    while($size_validation -eq 0){
    
          if($size -le 11){
            Write-Host "Pass word should be a minimum of 12 characters" -ForegroundColor Black -BackgroundColor Red
            [int]$size = Read-Host "How long should do you want the password?"
          } elseif($size -ge 25){
            Write-Host "Password should not be more than 25 characters" -ForegroundColor Black -BackgroundColor Red
            [int]$size = Read-Host "How long should do you want the password?"
          } else {
            $size_validation = 1
          }  
    }

    [int]$num_pwd = Read-Host "How many passwords would you like to generate?"

    $upper = "ABCDEFGHIJKLMIOPQRSTUVWXYZ".ToCharArray()
    $lower = "abcdefghijklmnopqrstuvwxyz".ToCharArray()
    $num = "0123456789".ToCharArray()
    $char = "!@#$%^&*()+-".ToCharArray()

    $upper_num = [Math]::Round($size * .25)
    $lower_num = [Math]::Round($size * .50)
    $num_num = [Math]::Round($size * .15)
    $char_num = [Math]::Round($size * .10)
    
    $total = $upper_num + $lower_num + $num_num + $char_num

    if($total -ne $size){ 
        $char_num = [Math]::Round($size * .10) + 1
       }

    for($i = 0; $i -le $num_pwd; $i++){
        $pwd = ($upper | Get-Random -Count $upper_num) -join ""
        $pwd += ($lower | Get-Random -Count $lower_num) -join ""
        $pwd += ($num | Get-Random -Count $num_num) -join ""
        $pwd += ($char | Get-Random -Count $char_num) -join ""

        $pwd2 = $pwd.tochararray()
        $scramble=($pwd2 | Get-Random -Count $size) -join ""

        Write-Host "Password:" $scramble -ForegroundColor Green -BackgroundColor Black
    }
      
}



