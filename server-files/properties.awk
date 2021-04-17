!/#/ {
    {printf "set_server_properties "}
    {printf $1}{for(i=2;i<NF;i++){printf "-%s", $i}}
    {printf " ${"$1}{for(i=2;i<NF;i++){printf "_%s", $i}}
    if($NF) {printf "-"q $NF q}{printf "}\n"}
}