/*去除字符串左边的空格*/
function LTrim(str) {
    for (var k = 0; str.length && str.charAt(k) <= " "; k++) {
        ;
    }
    return str.substring(k, str.length);
}
/*去除字符串右边的空格*/
function RTrim(str) {
    for (var j = str.length - 1; j >= 0 && str.charAt(j) <= " "; j--) {
        ;
    }
    return str.substring(0, j + 1);
}
/*合并上面的两个函数*/
function Trim(str) {
    return LTrim(RTrim(str));
}