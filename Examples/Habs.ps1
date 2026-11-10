$habsplayers = "Caufield", "Suzuki" , "Hutson"

for ($i = 0; $i -gt $habsplayers.count; $i++){
    write-output ("Player:" + $i + "Name" + $habsplayers[$i])
}
