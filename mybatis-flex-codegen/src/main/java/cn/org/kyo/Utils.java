package cn.org.kyo;

public class Utils {

    public static String upperFirst(String str) {
        return str.substring(0, 1).toUpperCase() + str.substring(1);
    }

    public static String lowerFirst(String str) {
        return str.substring(0, 1).toLowerCase() + str.substring(1);
    }   

    public static String upperFirstAndAddPrefix(String str, String prefix) {
        return prefix + upperFirst(str);
    }

    public static String lowerFirstAndAddPrefix(String str, String prefix) {
        return prefix + lowerFirst(str);
    }
}
