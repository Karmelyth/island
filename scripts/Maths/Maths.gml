//[bool] returns if a random 100% check succeeded or not
function chance(PERCENT){
	return !(irandom(99) > (PERCENT - 1));
}

//[real] returns a given floored value using the fraction as a chance of value + 1 e.g: 54.3 returns 54 w/ a 30% chance of returning 55 instead
function chance_value(VALUE){
	return floor(VALUE) + chance(frac(VALUE) * 100);
}

//[real] modulates a value with a given modulo
function modulate(VALUE, MOD){
	return VALUE - VALUE mod MOD;
}