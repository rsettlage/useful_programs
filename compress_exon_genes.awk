###
###sort -k 3,3r -k 1,1 -k 4,4n pasa.gtf >pasa_sorted.gtf

BEGIN {
	first=""
	last_chr=""
	last_S=""
	last_E=""
	last_clsr=""
	}
{if(first==""){
	first=1
	last_chr=$1
	last_S=$4
	last_E=$5
	last_clsr=$10
	y[$10]=$10
	z[$12]=$10
	}else{
		if($3=="transcript"){
			if($1==last_chr && ((last_E>=$5 && $5>=last_S) || (last_E>=$4 && $4>=last_S))){
				y[$10]=last_clsr
				z[$12]=last_clsr
				if(last_E<$5){
					last_E=$5
				}
				if(last_S>$4){
					last_S=$1
				}
			}else{
					y[$10]=$10
					last_S=$4
					last_E=$5
					last_clsr=$10
					last_chr=$1
			}
		}
	}
	##{$10=y[$10];print $0}
}
END{
for(j in y) if(j!=y[j]){print j"\t"y[j]}
}