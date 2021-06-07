!/#/ {
    {printf "- `"$1}{for(i=2;i<NF;i++){printf "_%s", $i}}
    {printf "="}if($NF) {printf $NF }{printf "`\n"}
}
