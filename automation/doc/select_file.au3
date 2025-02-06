; Tunggu hingga jendela File Explorer aktif (pastikan nama jendela sesuai)
WinWaitActive("Open") ; Gantilah dengan nama jendela yang sesuai

; Tekan Ctrl+L untuk fokus ke address bar di File Explorer
Send("^l")  ; Ctrl + L untuk memilih address bar

; Kirimkan path folder ke address bar di File Explorer
Send("C:\Ruby34-x64\automation\doc") ; Path folder tempat file berada

; Tekan Enter untuk pergi ke folder tersebut
Send("{ENTER}")

sleep(2000)

Send("{TAB 6}")

sleep(2000)

; Kirimkan path file ke input file explorer
Send("hasil_untuk_impor.xls") 

sleep(2000)

; Tekan tombol Enter untuk mengonfirmasi pemilihan file
Send("{ENTER}")
Send("{ENTER}")
Send("{ENTER}")
